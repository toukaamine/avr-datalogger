#include <avr/io.h>
#include <avr/pgmspace.h>
#include <avr/interrupt.h>
#include <stdint.h>

#include "GainSensor/GainSensorFP.h"

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



int main(void)
{
	 float32_t* test;
	 float32_t  test2;
	 
	 test = (float32_t*)(&SENSOR_GAIN[0] );

   test2 = (float32_t)pgm_read_float( (uint16_t*)(&SENSOR_GAIN[0]) );
      
	return 0;	
}



