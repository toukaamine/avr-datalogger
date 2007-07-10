
#include <avr/io.h>
#include <stdint.h>
#include <stdlib.h>
#include "I2C/i2c.h"
#include "GainSensor.h"
#include "MAX7300/max7300.h"
#include "Util/MSB2LSB.h"
#include "ADS1213/ads1213.h"

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
void GS_Gain(uint8_t gain)
{
   GS_SetRegister(GS_GAIN_PORT, gain & (GS_GAIN_MASK) );
}



/* Sensor Area */

/* Require a function which 'auto' scales the input data */
/* Also needs to have an array of either Voltage, Temperature or Off channels */


static uint32_t SensorType;
static uint32_t SensorState;
static uint8_t SensorGain[SENSOR_COUNT];

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

uint8_t SensorGetGain(uint8_t channel) 
{
   return SensorGain[channel];
}

/* Each sensor is assigned a gain */
void SensorSetGain(uint8_t channel, uint8_t gain)
{
   SensorGain[channel] = gain;
}

#endif

/* Gets the sensor data of the passed channel */
int32_t SensorData(uint8_t channel)
{

   GS_Gain( (SensorType & (1 << channel)) );
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
      SensorSetGain(channel, GS_GAIN[i]);
      ADCResult = SensorData(channel);
      
      /* Within the saturation limit of 15 bits (could use 16?) */
      if(abs(ADCResult) < SENSOR_SATURATION_LIMIT)
      {
         return;  
      }
   }
}

/* Turns all digits into voltages */
void SensorCondition(int32_t data, uint8_t channel)
{

   float result;
   
   result = data * SensorGetGain(channel);
   
}


void SensorCalculateTemperature(void)
{
   float haha;
   haha = 5.223213;
   
}

























