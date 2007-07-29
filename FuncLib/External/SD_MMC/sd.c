/* Modified code from Pascal Stang and Roland Riegel */

#include <avr/io.h>
#include "sd.h"
#include "SPI/spi.h"
#include <util/delay.h>
#include "mmculib/uint8toa.h"
#include "hardUart/hardUart.h"

/* returns 0 if success */
uint8_t SD_Init(void)
{
   uint8_t i;
   uint8_t r1;
   
   MMC_CS_DDR |= (1 << MMC_CS_PIN);
   MMC_PWR_DDR |= (1 << MMC_PWR_PIN);
   
   SD_Startup();
   _delay_ms(30);   
      
    /* card needs 74 cycles minimum to start up */
   for(i = 0; i < MMC_MAX_RETRIES; ++i)
   {
        /* wait 8 clock cycles */
      SPI_RxByte();
   }
    
    
   /* Select the card */
   MMC_CS_PORT &= ~(1 << MMC_CS_PIN);
    
   /* Reset the card */
   for( i = 0; ; i++)
   { 
      r1 = SD_Command(MMC_GO_IDLE_STATE, 0);
      if(r1 == MMC_R1_IDLE_STATE){
         break;
      }
            
      if( i > MMC_MAX_RETRIES )
      {
         return 1;
      }
   }
   

   /* Initialise the card's activation sequence */
   for( i = 0; ; i++)
   { 
      r1 = SD_Command(MMC_SEND_OP_COND, 0);
      if(r1 == MMC_R1_READY){
         break;
      }    
      if( i > 200 )
      {
         return 1;
      }
   }
   
   r1 = SD_Command(MMC_CRC_ON_OFF, 0);
   r1 = SD_Command(MMC_SET_BLOCKLEN, 512);     
   
   /* Release and return clock phase and speed back to default */
   MMC_CS_PORT |= (1 << MMC_CS_PIN);
   SPCR |= (1 << CPHA) | (1 << SPR1);
   
   return 0;
    


}

void SD_Startup(void)
{
   /* Power up the SD Card */
   MMC_PWR_PORT &= ~(1 << MMC_PWR_PIN);
  
   /* Set Clock Phase to sample on the rising edge */
   SPCR &= ~(1 << CPHA);   
}

void SD_Shutdown(void)
{
   /* Disable SPI, Bring all SD lines low */
   SPCR &= ~(1 << SPE);
   
   SPI_PORT &= ~( (1<<MOSI) );
   MMC_CS_PORT &= ~(1 << MMC_CS_PIN);
   
   /* Power down the SD Card */
   MMC_PWR_PORT |= (1 << MMC_PWR_PIN);
   /* Re-Enable SPI and Revert Clock Phase to sample on the falling edge */
   SPCR |= ((1 << CPHA) | (1<<SPE));     
}

uint8_t SD_SendCommand(uint8_t cmd, uint32_t arg)
{
   uint8_t r1;
   MMC_CS_PORT &= ~(1 << MMC_CS_PIN);
   r1 = SD_Command(cmd, arg);   
   MMC_CS_PORT |= ~(1 << MMC_CS_PIN);
   
   return r1;
      
}

/* Note that Clock Phase should be set to zero */ 

uint8_t SD_Command(uint8_t cmd, uint32_t arg)
{
	uint8_t r1;
	uint8_t retry = 0;

   /* Ensure speed is max */
   SPCR &= ~((1 << CPHA) | (1 << SPR1));	
	
	// send command
	SPI_TxByte(cmd | 0x40);
	SPI_TxByte(arg>>24);
	SPI_TxByte(arg>>16);
	SPI_TxByte(arg>>8);
	SPI_TxByte(arg);
	
   SPI_TxByte(0x95);	 /// Sends the CRC byte
   
	// end command
	// wait for response
	// if more than 8 retries, card has timed-out
	// return the received 0xFF
	while( (r1 = SPI_RxByte() ) == 0xFF)
		if(retry++ > MMC_MAX_RETRIES) break;
	// return response
	
	uint8_t outputString[5];
	
   uartNewLine();
   uartTxString("R1 Response: ");
   uint8toa(r1, outputString);
   uartTxString(outputString);
   
   uartNewLine();   
	
   SPCR |= (1 << CPHA) | (1 << SPR1);	
	return r1;
}








uint8_t SD_Read(uint32_t sector, uint8_t* buffer)
{
	uint8_t r1;
	uint16_t i;
   uint8_t outputString[5];

	// assert chip select
   MMC_CS_PORT &= ~(1 << MMC_CS_PIN);
	// issue command
	r1 = SD_Command(MMC_READ_SINGLE_BLOCK, sector<<9);

   uartNewLine();
   uartTxString("SD Read R1 Response: ");
   uint8toa(r1, outputString);
   uartTxString(outputString);   
   uartNewLine();   

	// check for valid response
	if(r1 != 0x00)
		return r1;
	// wait for block start
	while(SPI_TxByte(0xFF) != MMC_STARTBLOCK_READ);
	// read in data
	for(i=0; i<0x200; i++)
	{
		*buffer++ = SPI_TxByte(0xFF);
	}
	// read 16-bit CRC
	SPI_TxByte(0xFF);
	SPI_TxByte(0xFF);

	// wait until card not busy
	while(!SPI_RxByte());

		
   /* Release and return clock phase and speed back to default */
   MMC_CS_PORT |= (1 << MMC_CS_PIN);
   SPCR |= (1 << CPHA) | (1 << SPR1);
  
   
	// return success
	return 0;
}

uint8_t SD_Write(uint32_t sector, uint8_t* buffer)
{
	uint8_t r1;
	uint16_t i;
   uint8_t outputString[5];
   
	// assert chip select
   MMC_CS_PORT &= ~(1 << MMC_CS_PIN);
	// issue command
	r1 = SD_Command(MMC_WRITE_BLOCK, sector<<9);
   
   

	// check for valid response
	if(r1 != 0x00)
	{
      uartNewLine();
      uartTxString("SD Write R1 Response: ");
      uint8toa(r1, outputString);
      uartTxString(outputString);   
      uartNewLine();        
      
		return r1;
   }
	// send dummy
	SPI_TxByte(0xFF);
	// send data start token
	SPI_TxByte(MMC_STARTBLOCK_WRITE);
	// write data
	for(i=0; i<0x200; i++)
	{
		SPI_TxByte(*buffer++);
	}
	// write 16-bit CRC (dummy values)
	SPI_TxByte(0xFF);
	SPI_TxByte(0xFF);
	// read data response token
	r1 = SPI_RxByte();
	if( (r1&MMC_DR_MASK) != MMC_DR_ACCEPT)
		return r1;

	// wait until card not busy
	while(!SPI_RxByte());

   /* Release and return clock phase and speed back to default */
   MMC_CS_PORT |= (1 << MMC_CS_PIN);
   SPCR |= (1 << CPHA) | (1 << SPR1);

	
	// return success
	return 0;
}
