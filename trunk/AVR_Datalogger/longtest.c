/* Long test */

#include <avr/io.h>
#include <stdlib.h>
#include <string.h>
#include "hardUart/hardUart.h"

#define GAIN_DECIMAL(x) (uint16_t)( (int32_t)(x*GAIN_RESOLUTION) - (int32_t)(GAIN_INT(x)*GAIN_RESOLUTION)  )
#define GAIN_INT(x) (uint16_t)((x/x) * x)

uint32_t sample = 31604871;

#define FLOAT_EXPONENT_BITS   (0x7F8)
#define FLOAT_EXP_BITS_HI     (0x7F)
#define FLOAT_EXP_BITS_LO     (0x80)
#define FLOAT_SIGN_BIT        (0x80)
typedef union _GS_float
{
   uint8_t  byteField[4];
   float    FP;  
   
} float32_t;

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

/* 32bit is the largest we can print */
/* Need to fix this tihs work with leading zero's */
void printFloat(float data)
{

   char outputString[20];
   float working; 
   working = data - (int32_t)data;
   //ltoa( (int32_t)data, outputString, 10);
   
   
   
   //strcat( outputString, ".");   
   //utoa( working * 10000, &outputString[strlen(outputString)], 10);  
   uartTxString( (uint8_t*)outputString );
}


int main(void)
{
   
  	float  data;
   char outputString[20];
   float32_t working;
   
   uartInit(3 , 1);
   
   data = 76.5142;
   
   
   working.FP = (data - (int32_t)data);
   printFloat(working.FP);
   uartTx('\r');      
   uartTx('\n'); 
//   working = floatExponent( working, 2);
   printFloat(working.FP);   
   uartTx('\r');      
   uartTx('\n');   
//   working = floatExponent( working, -4);
   printFloat(working.FP);
   uartTx('\r');      
   uartTx('\n');

   return 0;  
}
