/* ADC1213 Routines for the ATMEGA Micro
 * Author: Adrian Gin
 * Date: 27/06/07
 *
 */

#include <avr/io.h>
#include <util/delay.h>

#include "SPI/spi.h"
#include "ads1213.h"


/* Note SPI_Init() must be called prior */
void ADS1213_Init(void)
{
   /* Set Chip Select as Output */
   ADS1213_CS_DDR |= (1 << ADS1213_CS_PIN);
    
   /* CPHA = 1 is required  for this ADC,
    * CPHA = 1 required for the DS1305 as well (DONE IN SPIINIT)*/
   
   ADS1213_CS_Pulse(); 
   
   SPI_TxByte( (1 << ADS1213_MB1) 
               | (1 << ADS1213_MB0)
               | (1 << ADS1213_A2) );  
    
   /* Need to set SDL to SDOUT and turn on REFerence Ouput */
   SPI_TxByte( (1 << ADS1213_SDL) | (1<<ADS1213_REFO) );
   
   /* Perform a self calibration */
   SPI_TxByte( (1 << ADS1213_MD0) );
   
   /* Set SF2 to 1 to enable Turbo 16 mode */
   /* Set decimation ratio to 500 which means fData ~=~ 500 Hz */
   SPI_TxByte( (1 << ADS1213_SF2) | 1 );
   SPI_TxByte( 244 );
   
   
   ADS1213_CS_PORT |= (1 << ADS1213_CS_PIN);     
   
}


/* Obtains a 32_bit result, however only the 1st 22 bits will
 * contain data.
 *
 * ADS1213_BUSY will be returned if the read fails */
uint32_t ADS1213_GetResult(void)
{
   uint8_t BusyFlag;
   uint8_t DRDY_Status;
   uint8_t retry;
   
   ADS1213Data_t Data;

   /* Read nDRDY and only return the contents of DOR
    * if nDRDY is LOW */
   
   BusyFlag = 1;
    
   for( retry = 0; retry < 8; retry++)
   {    
      ADS1213_CS_Pulse();
            
      SPI_TxByte((1 << ADS1213_RW) | (1 << ADS1213_A2));     
      DRDY_Status = SPI_RxByte();
      
      if( !(DRDY_Status & (1<<ADS1213_DRDY)) )
      { 
         BusyFlag = 0;
         break;
      }
   }

   if(BusyFlag)
   {
      return ADS1213_BUSY;  
   }
   
   
   ADS1213_CS_Pulse();
   SPI_TxByte((1 << ADS1213_RW) | (1 << ADS1213_MB1));
   Data.byte[2] = SPI_RxByte();
   Data.byte[1] = SPI_RxByte();
   Data.byte[0] = SPI_RxByte();   
   
   
   ADS1213_CS_PORT &= ~(1 << ADS1213_CS_PIN);   
   
   return Data.result;   
  
}

void ADS1213_CS_Pulse(void)
{
   ADS1213_CS_PORT |= (1 << ADS1213_CS_PIN);
   _delay_loop_1(22);     
   ADS1213_CS_PORT &= ~(1 << ADS1213_CS_PIN);
   _delay_loop_1(22); 
}

/* Turns the Vreference and VBias Off as well as puts the unit
 * into sleep mode*/
void ADS1213_Shutdown(void)
{
   ADS1213_CS_Pulse(); 
   
   SPI_TxByte((1 << ADS1213_MB0) | (1 << ADS1213_A2));
    
   /* Need to set SDL to SDOUT and turn off REFerence Ouput */
   SPI_TxByte( (1 << ADS1213_SDL) );
   
   /* Set mode to sleep */
   SPI_TxByte( (1 << ADS1213_MD2) | (1 << ADS1213_MD1) );
   
   /* Release CS */
   ADS1213_CS_PORT &= ~(1 << ADS1213_CS_PIN);   
}

void ADS1213_Startup(void)
{
   ADS1213_CS_Pulse(); 
   
   SPI_TxByte((1 << ADS1213_MB0) | (1 << ADS1213_A2));
    
   /* Need to set SDL to SDOUT and turn on REFerence Ouput */
   SPI_TxByte( (1 << ADS1213_SDL) | (1 << ADS1213_REFO) );
   
   /* Return to Normal mode */
   SPI_TxByte( 0 );
   
   /* Release CS */
   ADS1213_CS_PORT &= ~(1 << ADS1213_CS_PIN);      
}





