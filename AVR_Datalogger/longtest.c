/* Long test */

#include <avr/io.h>
#include <stdlib.h>
#include <string.h>
#include "hardUart/hardUart.h"
#include "mmculib/uint16toa.h"
#include "GainSensor/GainSensorFP.h"


#define GAIN_DECIMAL(x) (uint16_t)( (int32_t)(x*GAIN_RESOLUTION) - (int32_t)(GAIN_INT(x)*GAIN_RESOLUTION)  )
#define GAIN_INT(x) (uint16_t)((x/x) * x)

uint32_t sample = -36;



/** Tested with negative numbers too */

int main(void)
{
   
  	float  data;
  	float hexa;
   char outputString[20];
   volatile float32_t working;
   uint32_t shit;
   
   uartInit(3 , 1);
   
   data = -12548.5142;
   
	working.FP = data;
	
   printFloat(working.FP);
   uartTx('\r');      
   uartTx('\n'); 
   working = floatExponent( working, 2);
   printFloat(working.FP);   
   uartTx('\r');      
   uartTx('\n');   
   working = floatExponent( working, -4);
   printFloat(working.FP);
   uartTx('\r');      
   uartTx('\n');

	SensorCondition(sample, 0); 

   return 0;  
}
