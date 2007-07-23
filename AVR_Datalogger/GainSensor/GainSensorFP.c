
#include <avr/io.h>
#include <avr/pgmspace.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include "I2C/i2c.h"
#include "GainSensorFP.h"
#include "MAX7300/max7300.h"
#include "MSB2LSB/MSB2LSB.h"
#include "ADS1213/ads1213.h"

#include "hardUart/hardUart.h"

/* TODO: Ensure that AVR Signed is done using two's comp */

const uint8_t GS_GAIN[] PROGMEM = {GS_GAIN_76, GS_GAIN_30, GS_GAIN_22, GS_GAIN_11, GS_GAIN_5,
                      GS_GAIN_05, GS_GAIN_025, GS_GAIN_02, GS_GAIN_01, GS_GAIN_005, 0}; 


const float  GAIN_76FP  = GAIN_76;
const float  GAIN_30FP  = GAIN_30;


/* Still to finish this off */
static const float SENSOR_GAIN[] = {GAIN_76, GAIN_30};

void GS_Init(void)
{
   /* Set all pins to outputs except for NC pins which are set to inputs*/
	i2cAddress(GS_MAX7300_ADDRESS, TW_WRITE);     

 	i2cTransmit(MAX7300_DDRA1);
	i2cTransmit(0x55); 
	i2cTransmit(0x59);
	i2cTransmit(0x55);
	i2cStop();   
	
	GS_SetRegister( MAX7300_CONFIG, (1 << MAX7300_SHUTDOWN_CONTROL) );
	

}

/* Channel 1 <= 32 */
void GS_Channel(uint8_t channel)
{
   
   static uint8_t block;
   static uint8_t portData;
   
   /* Channel Manipulation needed to reflect connection of the hardware */
   channel = channel - 1;
   block = 0x07 - (channel / 4);
   block = MSB2LSB(block) >> 5;
   
   /* Change only the sensor channel and not the gain bits */
   portData = GS_ReadRegister(GS_SENSOR_PORT);
   
   portData &= ~(GS_SENSOR_MASK);
   portData |= (((block << 2) + (channel & 0x03)) & (GS_SENSOR_MASK));
   
   GS_SetRegister(GS_SENSOR_PORT, portData );
}


/* Function used to set the gain:
 * Usage: GS_Gain( (1<<GS_GAINA) | (1<<GS_GAINE) )
 */
void GS_GainSel(uint8_t gain)
{
   /* There is no need to AND this with the CH Sel bits because we are
    * writing to the GAIN Port */
   
   GS_SetRegister(GS_GAIN_PORT, gain & (GS_GAIN_MASK) );
}



/* Sensor Area */

/* Require a function which 'auto' scales the input data */
/* Also needs to have an array of either Voltage, Temperature or Off channels */

/* Sensor state is ON/OFF */
/* Sensor Type is VOLTAGE / TEMPERATURE */
static uint32_t SensorType;
static uint32_t SensorState;

/* The sensor gain selects which index of the SENSOR_GAIN array is used */
/* Each sensor will use 4_bits thus there are 16 combo's of gains */
static uint8_t SensorGain[SENSOR_COUNT/2];





#if SENSOR_MACRO == 1

#define SensorOn(channel) SensorState |= (1<<channel)
#define SensorOff(channel) SensorState &= ~(1<<channel)

#define SensorTypeVoltage(channel) SensorType |= (1<<channel)
#define SensorTypeTemp(channel) SensorType &= ~(1<<channel)

#define SensorGetType(channel)   return (SensorType & (1 << channel))
#define SensorGetState(channel)   return (SensorState & (1 << channel))

#define SensorSetGain(channel, gain)  (SensorGain[channel] = gain)
#define SensorGetGain(channel) return (SensorGain[channel])



#else

/* Sensor Function channels are ranged between 0 -> 31 inclusive */

void SensorOn(uint8_t channel)
{
   SensorState |= (1<<channel);
}

void SensorOff(uint8_t channel)
{
   SensorState &= ~(1<<channel);
}

void SensorTypeVoltage(uint8_t channel)
{
   SensorType |= (1<<channel);   
}

void SensorTypeTemp(uint8_t channel)
{
   SensorType &= ~(1<<channel);   
}

uint8_t SensorGetType(uint8_t channel)
{
   return (SensorType & (1 << channel));
}

uint8_t SensorGetState(uint8_t channel)
{
   return (SensorState & (1 << channel));
}


/* Returns the index of SENSOR_GAIN */
uint8_t SensorGetGain(uint8_t channel) 
{
	uint8_t returnVal;
	returnVal = SensorGain[channel / 2] >> (4*(channel % 2));

   return (returnVal & 0x0F);
}


/* Each sensor is assigned a gain, this sets which of the
 * SENSOR_GAIN's are used. gain must be within the SENSOR_GAIN index */
void SensorSetGain(uint8_t channel, uint8_t gain)
{
	/* To use the correct nibble */
	gain = gain & 0x0F;
	SensorGain[ (channel / 2) ] = gain << (4* (channel % 2));
	
}

#endif

/* Gets the sensor data of the passed channel 
 * RAW Data */
uint32_t SensorData(uint8_t channel)
{

	/* Set the correct Gain */	  
   GS_GainSel( GS_GAIN[ SensorGetGain(channel) ] );
   
   /* Select the correct channel */
   GS_Channel( channel + 1 );
   return ADS1213_GetResult();
   
}


/* Ensures that the ADC result is as large as possible without being saturated */
void SensorAutoScale(uint8_t channel)
{
   uint8_t i;
   uint8_t gain;
   int32_t ADCResult;
   
   for(i = 0; (gain = pgm_read_byte( &GS_GAIN[i] )); i++)
   {
		/* Start from the highest gain and work down */
      SensorSetGain(channel, gain );
      ADCResult = (int32_t)SensorData(channel);
      
      /* Within the saturation limit of 15 bits (could use 16?) */
      if(abs(ADCResult) > SENSOR_SATURATION_LIMIT)
      {
			if( i != 0 )
			{
				SensorSetGain(channel, pgm_read_byte(GS_GAIN[i-1]) );
			}
			
         return;
      }
   }
}

/* Turns all digits into voltages regardless of Type */
void SensorCondition(uint32_t data, uint8_t gainIndex)
{

	/* Could change to 64's */
	Float64_t Gain;
	Float128_t Voltage;
	
	char outputString[20];
	
	int32_t signedData;
	static float   dataFP;
	static float   gainFP;
	int32_t realReading = 0;
	
	
   signedData = (int32_t)data;
	dataFP = (float)signedData;
	
   ltoa( data, outputString, 10);
   uartTxString( (uint8_t*)"Raw Data = ");
   uartTxString(outputString);      
   uartNewLine(); 
   
   ltoa( signedData, outputString, 10);
   uartTxString( (uint8_t*)"Signed Data = ");
   uartTxString(outputString);      
   uartNewLine();
    
   uartTxString( (uint8_t*)"Float Data = ");
   printFloat( dataFP ); 	
   uartNewLine();
      
   gainFP = SENSOR_GAIN[gainIndex];
   
   uartTxString( (uint8_t*)"Current Gain = ");
   printFloat( gainFP ); 	
   uartNewLine();
   
   dataFP = dataFP * gainFP;
   
	dataFP = (dataFP * 2.5) * 2e-21 ;
   

   uartTxString( (uint8_t*)"Conditioned 'Voltage' is: "); 
   printFloat(dataFP);
     							
   /* At this point realReading is still SENSOR_REF_MULTIPLIER  * GAIN_RESOLUTION 
    * too large */
    
   
}



/* 32bit is the largest we can print */
void printFloat(float data)
{

   char outputString[20];
   float working;
   
   working = data - (int32_t)data;
   
   
   ltoa( (int32_t)data, outputString, 10);
   strcat( outputString, ".");
   utoa( working * 10000, &outputString[strlen(outputString)], 10);  
   
   uartTxString( (uint8_t*)outputString );
   
}





















