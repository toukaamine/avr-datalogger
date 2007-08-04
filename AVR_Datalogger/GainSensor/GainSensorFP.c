
#include <avr/io.h>
#include <avr/pgmspace.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include "I2C/i2c.h"
#include "GainSensorFP.h"
#include "hardUart/hardUart.h"

#define RESULT_DEBUG 0




/** Multiplies the passed float by 2^(adjust) 
  * The 8 exponent bits are held in the 
  * 1st 7 bits of the 4the byte and the last bit of the 3rd byte.
  */
float32_t floatExponent(float32_t data, int8_t adjust)
{
   uint8_t newExponent;
   
   newExponent = ((data.byteField[3] & FLOAT_EXP_BITS_HI) << 1)
                  | ((data.byteField[2] & FLOAT_EXP_BITS_LO) >> 7);
                   
   newExponent += adjust;
   /* Clear the Exponent Bits */
   data.byteField[3] =  (data.byteField[3] & ~(FLOAT_EXP_BITS_HI)) | (newExponent >> 1);
   data.byteField[2] =  (data.byteField[2] & ~(FLOAT_EXP_BITS_LO))  | (newExponent << 7);   
   
   return data;  
}


/* 16bit integer and decimal is the largest we can print */
void printFloat(float data)
{

   char outputString[20];
   float32_t working; 

	working.FP = data;
	if( working.byteField[3] & FLOAT_SIGN_BIT)
	{
   	uartTx('-');
		data = -data;
		working.byteField[3] &=  (~FLOAT_SIGN_BIT);
	}

   uint16toa( working.FP, outputString, 0);
   uartTxString( (uint8_t*)outputString );   
   uartTx('.');
   
	working.FP = data - (int32_t)data;
	float_4dp( working.FP * GAIN_RESOLUTION, outputString); 
   uartTxString( (uint8_t*)outputString );
}


/** Returns a float from address short. */
float pgm_read_float(uint16_t* address_short)
{
   float32_t* floatPtr = (float32_t*)(address_short);;   
   float32_t returnFloat;
   returnFloat.byteField[3] = pgm_read_byte( &floatPtr->byteField[3] );
   returnFloat.byteField[2] = pgm_read_byte( &floatPtr->byteField[2]);
   returnFloat.byteField[1] = pgm_read_byte( &floatPtr->byteField[1]);
   returnFloat.byteField[0] = pgm_read_byte( &floatPtr->byteField[0]);         
   return returnFloat.FP;
}



/* TODO: Ensure that AVR Signed is done using two's comp */

const uint8_t GS_GAIN[] PROGMEM = {GS_GAIN_9P6, GS_GAIN_2P5, GS_GAIN_0P4, 
											  GS_GAIN_0P09, GS_GAIN_0P04, 0}; 


/* Still to finish this off */
//const float SENSOR_GAIN[] PROGMEM = { 
//   GAIN_76FP, GAIN_30FP, GAIN_22FP, GAIN_11FP, 
//   GAIN_5FP, GAIN_05FP, GAIN_025FP, GAIN_02FP, 
//   GAIN_01FP, GAIN_005FP};

const float SENSOR_GAIN[] PROGMEM = { 
   GAIN_9P6FP, GAIN_2P5FP, GAIN_0P4FP, 
	GAIN_0P09FP, GAIN_0P04FP};


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
uint32_t SensorType;
uint32_t SensorState;

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
   SensorState |= ( (uint32_t)(1) << channel);
}

void SensorOff(uint8_t channel)
{
   SensorState &= ~((uint32_t)(1) <<channel);
}

void SensorToggle(uint8_t channel)
{
	SensorState = SensorState ^ ((uint32_t)(1) << channel);	
}

void SensorSetType(uint8_t channel, uint8_t type)
{
	SensorType &= ~( (uint32_t)(1) << channel);
	SensorType |= ( (uint32_t)(type) << channel);	
}

void SensorTypeToggle(uint8_t channel)
{
	SensorType = SensorType ^ ((uint32_t)(1) << channel);		
}

uint8_t SensorGetType(uint8_t channel)
{
   return (SensorType & ((uint32_t)(1) << channel)) ? SENSOR_VOLTAGE : SENSOR_TEMP ;
}

uint8_t SensorGetState(uint8_t channel)
{
   return (SensorState & ((uint32_t)(1) << channel)) ? SENSOR_ON : SENSOR_OFF;
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
   uint8_t nibble;
   
   nibble = 4* (channel % 2);
   
	/* To use the correct nibble */
	gain = gain & 0x0F;
	SensorGain[ (channel / 2) ] &= ~( 0x0F << nibble);
	SensorGain[ (channel / 2) ] |= (gain << nibble);
	
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
/* Function assumes a signed 24bit integer */
float32_t SensorCondition(uint32_t data, uint8_t gainIndex)
{

	/* Could change to 64's */
	char outputString[20];
	
	volatile ADS1213Data_t ConvertedData;
	volatile int32_t signedData;
	volatile float32_t   dataFP;
	static volatile float32_t   gainFP;
	int32_t realReading = 0;
	
	/* Convert signed 24bit into signed 32bit */
	ConvertedData.result = data;
	signedData = uint24_tSign( ConvertedData );
		
/** Debug only because the float output function can only handle 16bit */		   
	dataFP.FP = (float)(signedData);

#if RESULT_DEBUG
   ltoa( data, outputString, 10);
   uartTxString( (uint8_t*)"Raw Data = ");
   uartTxString(outputString);      
   uartNewLine(); 
   
   ltoa( signedData , outputString, 10);
   uartTxString( (uint8_t*)"Signed Data = ");
   uartTxString(outputString);      
   uartNewLine();

    
   uartTxString( (uint8_t*)"Float Data = ");
   printFloat( dataFP.FP ); 	
   uartNewLine();
#endif   
/** Debug only */	
   
   gainFP = (float32_t)pgm_read_float( (uint16_t*) &SENSOR_GAIN[gainIndex] );

#if RESULT_DEBUG   
/** Debug only */	   
   uartTxString( (uint8_t*)"Current Gain = ");
   printFloat( gainFP.FP ); 	
   uartNewLine();
#endif   
/** Debug only */	   
   
   /* Divide by 2^22 */
   dataFP.FP = dataFP.FP / (SENSOR_REF_MULTIPLIER * gainFP.FP);
	dataFP = floatExponent(dataFP, - (SENSOR_ENOB) + 8);
   
#if RESULT_DEBUG  
   uartTxString( (uint8_t*)"Conditioned 'Voltage' is: "); 
   printFloat(dataFP.FP);
#endif      							
   /* At this point realReading is still SENSOR_REF_MULTIPLIER  * GAIN_RESOLUTION 
    * too large */
   
   return dataFP; 
    
}





















