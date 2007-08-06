
#include <avr/io.h>
#include <avr/pgmspace.h>
#include "I2C/i2c.h"
#include "GainControl.h"
#include "max7300/max7300.h"
#include "MSB2LSB/msb2lsb.h"

/* TODO: Ensure that AVR Signed is done using two's comp */
const uint8_t GS_GAIN[] PROGMEM = {GS_GAIN_9P6, GS_GAIN_2P5, GS_GAIN_0P4, 
											  GS_GAIN_0P09, GS_GAIN_0P04, 0}; 


const float SENSOR_GAIN[] PROGMEM = { 
   GAIN_9P6FP, GAIN_2P5FP, GAIN_0P4FP, 
	GAIN_0P09FP, GAIN_0P04FP};

const uint32_t GAIN_OFFSETS[] = {
	GAIN_9P6O, GAIN_2P5O, GAIN_0P4O,
	GAIN_0P09O, GAIN_0P04O };


void GS_Init(void)
{
   /** Set all pins to outputs except for NC pins which are set to inputs*/
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
