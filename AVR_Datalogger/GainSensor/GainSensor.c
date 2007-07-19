
#include <avr/io.h>
#include <avr/pgmspace.h>
#include <stdint.h>
#include <stdlib.h>
#include "I2C/i2c.h"
#include "GainSensor.h"
#include "MAX7300/max7300.h"
#include "MSB2LSB/MSB2LSB.h"
#include "ADS1213/ads1213.h"


/* TODO: Ensure that AVR Signed is done using two's comp */

static const uint8_t  GS_GAIN[] = {GS_GAIN_76, GS_GAIN_30, GS_GAIN_22, GS_GAIN_11, GS_GAIN_5,
                      GS_GAIN_05, GS_GAIN_025, GS_GAIN_02, GS_GAIN_01, GS_GAIN_005, 0}; 


const Float32_t  GAIN_76FP PROGMEM = {GAIN_INT(GAIN_76), GAIN_DECIMAL(GAIN_76)};
const Float32_t  GAIN_30FP PROGMEM = {GAIN_INT(GAIN_30), GAIN_DECIMAL(GAIN_30)};
const Float32_t  GAIN_22FP PROGMEM = {GAIN_INT(GAIN_22), GAIN_DECIMAL(GAIN_22)};
const Float32_t  GAIN_11FP PROGMEM = {GAIN_INT(GAIN_11), GAIN_DECIMAL(GAIN_11)};
const Float32_t  GAIN_5FP  PROGMEM = {GAIN_INT(GAIN_5), GAIN_DECIMAL(GAIN_5)};



/* Still to finish this off */
static const Float32_t *SENSOR_GAIN[] = {&GAIN_76FP, &GAIN_30FP};

void GS_Init(void)
{
   /* Set all pins to outputs except for NC pins which are set to inputs*/
	i2cAddress(GS_MAX7300_ADDRESS, TW_WRITE);     
 	i2cTransmit(MAX7300_DDRA1);
	i2cTransmit(0xAA); 
	i2cTransmit(0x65);
	i2cTransmit(0xAA);
	i2cStop();   

}

/* Channel 1 <= 32 */
void GS_Channel(uint8_t channel)
{
   
   uint8_t block;
   uint8_t portData;
   
   /* Channel Manipulation needed to reflect connection of the hardware */
   channel = channel - 1;
   block = 0x07 - (channel / 4);
   block = MSB2LSB(block);
   
   /* Change only the sensor channel and not the gain bits */
   portData = GS_ReadRegister(GS_SENSOR_PORT);
   
   portData &= ~(GS_SENSOR_MASK);
   portData |= (((block << 3) + (channel & 0x03)) & (GS_SENSOR_MASK));
   
   GS_SetRegister(GS_SENSOR_PORT, portData );
}


/* Function used to set the gain:
 * Usage: GS_Gain( (1<<GS_GAINA) | (1<<GS_GAINE) )
 */
void GS_GainSel(uint8_t gain)
{
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
   int32_t ADCResult;
   
   for(i = 0; GS_GAIN[i]; i++)
   {
		/* Start from the highest gain and work down */
      SensorSetGain(channel, GS_GAIN[i]);
      ADCResult = (int32_t)SensorData(channel);
      
      /* Within the saturation limit of 15 bits (could use 16?) */
      if(abs(ADCResult) > SENSOR_SATURATION_LIMIT)
      {
			if( i != 0 )
			{
				SensorSetGain(channel, GS_GAIN[i-1]);
			}
			
         return;
      }
   }
}

/* Turns all digits into voltages regardless of Type */
void SensorCondition(uint32_t data, uint8_t gainIndex)
{

	/* Could change to 64's */
	Float32_t Gain;
	Float128_t Voltage;
	
	int32_t signedData = (int32_t)data;
	int32_t realReading;
	/* These need to be upgraded if Gain -> 64 bit */
	Gain.decimal = pgm_read_word( &(SENSOR_GAIN[gainIndex]->decimal) ) * GAIN_RESOLUTION;
	Gain.integer = pgm_read_word( &(SENSOR_GAIN[gainIndex]->integer) ) * GAIN_RESOLUTION;
	
	
	Voltage.integer = signedData 
							* GAIN_RESOLUTION
							* SENSOR_REFERNCE 
							/ SENSOR_MAX 
							/ Gain.integer;
							
							
	Voltage.decimal = signedData 
							* GAIN_RESOLUTION
							* SENSOR_REFERNCE 
							/ SENSOR_MAX 
							/ Gain.decimal;	
   /* At this point realReading is still SENSOR_REF_MULTIPLIER  * GAIN_RESOLUTION 
    * too large */
    
   realReading =  Voltage.integer - Voltage.decimal;
   
}


void SensorCalculateTemperature(void)
{
   float haha;
   haha = 5.223213;
   
}

























