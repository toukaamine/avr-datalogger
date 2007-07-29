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
	/* Set to a slower speed */	
	inputByte = SPI_TxByte(data);

	return inputByte;
}

void ADS1213_Reset(void)
{
	SPCR &= ~(1 << SPE);
	
   SPI_PORT &= ~(1 << SCK);
	_delay_us(100);
	/* Perform a reset */
	SPI_PORT |= (1 << SCK);
	_delay_us(60);
	_delay_us(60);
	_delay_us(60);
	_delay_us(60);
	_delay_us(60);
	_delay_us(60);
	_delay_us(60);
	_delay_us(60);
	_delay_us(60);         
	_delay_us(60);
            	
	SPI_PORT &= ~(1 << SCK);
	_delay_us(6);
   
   	
	SPI_PORT |= (1 << SCK);
	_delay_us(60);
	_delay_us(60);
	_delay_us(60);
	_delay_us(60);
	_delay_us(60);
               	
	SPI_PORT &= ~(1 << SCK);
	_delay_us(6);
   
   	
	SPI_PORT |= (1 << SCK);
	_delay_us(60);
	_delay_us(60);
	_delay_us(60);
	_delay_us(60);
	_delay_us(60);
	_delay_us(60);
	_delay_us(60);
	_delay_us(60);
	_delay_us(60);         
	_delay_us(60);
   	
	SPI_PORT &= ~(1 << SCK);
	_delay_us(6);
   
   		
	SPI_PORT |= (1 << SCK);
	_delay_ms(1);
	_delay_us(60);
         	
	SPI_PORT &= ~(1 << SCK);
	_delay_ms(30);   

    
	
	SPCR |= (1 << SPE); 
   
}

/* Note SPI_Init() must be called prior */
void ADS1213_Init(void)
{  
   /* Set Chip Select as Output */
   ADS1213_CS_DDR |= (1 << ADS1213_CS_PIN);
    
   /* CPHA = 1 is required  for this ADC,
    * CPHA = 1 required for the DS1305 as well (DONE IN SPIINIT)*/
   
   
   ADS1213_CS_PORT &= ~(1 << ADS1213_CS_PIN);     
   ADS1213_TxByte( (1 << ADS1213_MB1) 
               | (1 << ADS1213_MB0)
               | (1 << ADS1213_A2) );  
   	 
   /* Need to set SDL to SDOUT and turn on REFerence Ouput */
   ADS1213_TxByte( (1 << ADS1213_SDL) );


   /* Perform a bkground calibration */
   ADS1213_TxByte( (1<<ADS1213_MD0) );
   
   /* Always use Turbo 16 as it offers better performance */
   /* Set SF2 to 1 to enable Turbo 16 mode */
   /* Set decimation ratio to 500 which means fData ~=~ 500 Hz */
   ADS1213_TxByte( (1<<ADS1213_SF2) |  0x1 );

   /* Have a data rate of 2kHz */
   ADS1213_TxByte( 0x20 );
   
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
      
   ADS1213Data_t Data;
   Data.result = 0;

   /* Read nDRDY and only return the contents of DOR
    * if nDRDY is LOW */
   
   BusyFlag = 1;
     
    
   for( retry = 0; retry < 32; retry++)
   {    
      ADS1213_CS_PORT &= ~(1 << ADS1213_CS_PIN);  
      _delay_us(10);
      /* Read CMD Register's DRDY */
            
      ADS1213_TxByte((1 << ADS1213_RW) | (1 << ADS1213_A2));     
      _delay_us(10);     
      DRDY_Status = ADS1213_RxByte();
      
      if( !(DRDY_Status & (1<<ADS1213_DRDY)) )
      { 

         BusyFlag = 0;
         ADS1213_CS_PORT |= (1 << ADS1213_CS_PIN);
         _delay_us(10);     
         break;
      }
   
      ADS1213_CS_PORT |= (1 << ADS1213_CS_PIN);
      _delay_us(10); 
   }
   
   if(BusyFlag)
   {
      return ADS1213_BUSY;  
   }
   
   ADS1213_CS_PORT &= ~(1 << ADS1213_CS_PIN);    
   /* Ask to read three bytes from DOR(1) */
   ADS1213_TxByte((1 << ADS1213_RW) | (1 << ADS1213_MB1)); 
   Data.byte[2] = ADS1213_RxByte();
   Data.byte[1] = ADS1213_RxByte();    
   Data.byte[0] = ADS1213_RxByte();   
   /* Release the chip */
   ADS1213_CS_PORT |= (1 << ADS1213_CS_PIN);   
   
   
   Data.byte[4] = 0x00;
       
   /* Truncate data to 22 bits */
   return Data.result & 0xFFFFFF;   
  
}


/* Receives a 24bit integer in the form of an unsigned 32bit integer and
 * translates it into a signed 32bit integer. */
int32_t uint24_tSign(ADS1213Data_t data)
{
   
   /* If the 24bit is negative... */
   if( data.byte[2] & ADS1213_SIGN_BIT )
   {
      /* make it a 32_bit negative */
      data.result = (~data.result + 1) & (0x007FFFFF);
      data.result = -data.result;
   }
   
   return data.result;
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
   //ADS1213_TxByte( (1 << ADS1213_SDL) | (1 << ADS1213_REFO) );

   ADS1213_TxByte( 1 << ADS1213_SDL );
   
   /* Do a Self Calib */
   ADS1213_TxByte( (1<<ADS1213_MD0) );
   
   /* Release CS */
   ADS1213_CS_PORT |= (1 << ADS1213_CS_PIN);      
}


void ADS1213_PsuedoCalib(void)
{

   ADS1213_CS_PORT &= ~(1 << ADS1213_CS_PIN);   
   
   ADS1213_TxByte((1 << ADS1213_A2) | (1 << ADS1213_A0));
    
    /* Set to Psuedo Calib */
   ADS1213_TxByte( (1<<ADS1213_MD2) );
   
   /* Release CS */
   ADS1213_CS_PORT |= (1 << ADS1213_CS_PIN);        
   
   
}


