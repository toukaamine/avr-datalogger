/* ADC1213 Routines for the ATMEGA Micro
 * Author: Adrian Gin
 * Date: 27/06/07
 *
 */

#include <avr/io.h>
#include <util/delay.h>

#include "SPI/spi.h"
#include "ads1213.h"


#include "hardUart/hardUart.h"

/* Internal function */
uint8_t ADS1213_TxByte(uint8_t data)
{
	uint8_t inputByte;
	_delay_ms(3);	
	inputByte = SPI_TxByte(data);
	_delay_ms(3);
		
	return inputByte;
}

void ADS1213_Reset(void)
{
 

	SPCR &= ~(1 << SPE);
	
	/* Perform a reset */
	SPI_PORT |= (1 << SCK);
	_delay_us(255);
	SPI_PORT &= ~(1 << SCK);
	_delay_us(10);	
	SPI_PORT |= (1 << SCK);
	_delay_us(100);	
	SPI_PORT &= ~(1 << SCK);
	_delay_us(10);	
	SPI_PORT |= (1 << SCK);
	_delay_us(255);	
	SPI_PORT &= ~(1 << SCK);
	_delay_us(10);		
	SPI_PORT |= (1 << SCK);
	_delay_ms(1);   	
	SPI_PORT &= ~(1 << SCK);
	_delay_ms(100);   

    
	
	SPCR |= (1 << SPE); 
   
}

/* Note SPI_Init() must be called prior */
void ADS1213_Init(void)
{
   /* Set Chip Select as Output */
   ADS1213_CS_DDR |= (1 << ADS1213_CS_PIN);
    
   /* CPHA = 1 is required  for this ADC,
    * CPHA = 1 required for the DS1305 as well (DONE IN SPIINIT)*/
   
   //ADS1213_CS_Pulse(); 
   

   ADS1213_CS_PORT &= ~(1 << ADS1213_CS_PIN);     
   ADS1213_TxByte( (1 << ADS1213_MB1) 
               | (1 << ADS1213_MB0)
               | (1 << ADS1213_A2) );  
   	 
   /* Need to set SDL to SDOUT and turn on REFerence Ouput */
   ADS1213_TxByte( (1 << ADS1213_SDL) 
                   | (1<<ADS1213_REFO)
                   | (1<<ADS1213_UNIPOLAR)
                   | (1<<ADS1213_BIAS));

   
   
   /* Perform a self calibration */
   ADS1213_TxByte( (1<<ADS1213_MD0) | (1<<ADS1213_MD2) );
   
   /* Set SF2 to 1 to enable Turbo 16 mode */
   /* Set decimation ratio to 500 which means fData ~=~ 500 Hz */
   ADS1213_TxByte( (1 << ADS1213_SF0) + 0 );

   ADS1213_TxByte( 23 );
   
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
   uint16_t retry;
   
   
   uint32_t temporary;
   
   ADS1213Data_t Data;
   Data.result = 0;

   /* Read nDRDY and only return the contents of DOR
    * if nDRDY is LOW */
   
   BusyFlag = 1;
    
   for( retry = 0; retry < 32; retry++)
   {    
      ADS1213_CS_PORT &= ~(1 << ADS1213_CS_PIN);  
      
      /* Read CMD Register's DRDY */
            
      ADS1213_TxByte((1 << ADS1213_RW) | (1 << ADS1213_A2));     
      DRDY_Status = ADS1213_RxByte();
      
      if( !(DRDY_Status & (1<<ADS1213_DRDY)) )
      { 

         BusyFlag = 0;
         ADS1213_CS_PORT |= (1 << ADS1213_CS_PIN);      
         _delay_ms(2);
         break;
      }
   
      ADS1213_CS_PORT |= (1 << ADS1213_CS_PIN);      
      _delay_ms(2);
   }
   
   uartTx(retry);
   if(BusyFlag)
   {
      return ADS1213_BUSY;  
   }
   
   ADS1213_CS_PORT &= ~(1 << ADS1213_CS_PIN);   
  _delay_us(10);
   /* Ask to read three bytes from DOR(1) */
   ADS1213_TxByte((1 << ADS1213_RW) | (1 << ADS1213_MB1));
   Data.byte[2] = ADS1213_RxByte();
   Data.byte[1] = ADS1213_RxByte();
   Data.byte[0] = ADS1213_RxByte();   
   
   Data.byte[4] = 0;
   
   uartTx(Data.byte[2]);
   uartTx(Data.byte[1]);
   uartTx(Data.byte[0]);      
   
   temporary = Data.result;
   
   /* Release the chip */
   ADS1213_CS_PORT |= (1 << ADS1213_CS_PIN);   
   
   /* Truncate data to 22 bits */
   return temporary & 0x003FFFFF;   
  
}

void ADS1213_CS_Pulse(void)
{
   ADS1213_CS_PORT |= (1 << ADS1213_CS_PIN);
   _delay_us(22);     
   ADS1213_CS_PORT &= ~(1 << ADS1213_CS_PIN);
   _delay_us(22); 
}

/* Turns the Vreference and VBias Off as well as puts the unit
 * into sleep mode*/
void ADS1213_Shutdown(void)
{
   ADS1213_CS_PORT &= ~(1 << ADS1213_CS_PIN);   
   
   ADS1213_TxByte((1 << ADS1213_MB0) | (1 << ADS1213_A2));
    
   /* Need to set SDL to SDOUT and turn off REFerence Ouput */
   ADS1213_TxByte( (1 << ADS1213_SDL) );
   
   /* Set mode to sleep */
   ADS1213_TxByte( (1 << ADS1213_MD2) | (1 << ADS1213_MD1) );
   
   /* Release CS */
   ADS1213_CS_PORT |= (1 << ADS1213_CS_PIN);   
}

void ADS1213_Startup(void)
{
   ADS1213_CS_PORT &= ~(1 << ADS1213_CS_PIN);   
   
   ADS1213_TxByte((1 << ADS1213_MB0) | (1 << ADS1213_A2));
    
   /* Need to set SDL to SDOUT and turn on REFerence Ouput */
   ADS1213_TxByte( (1 << ADS1213_SDL) | (1 << ADS1213_REFO) );

   //ADS1213_TxByte( 1 << ADS1213_SDL );
   
   /* Return to Normal mode */
   ADS1213_TxByte( 0 );
   
   /* Release CS */
   ADS1213_CS_PORT |= (1 << ADS1213_CS_PIN);      
}





