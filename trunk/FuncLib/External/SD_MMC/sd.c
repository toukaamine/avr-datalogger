/* Modified code from Pascal Stang and Roland Riegel */

#include <avr/io.h>
#include "sd.h"
#include "SPI/spi.h"

/* returns 0 if success */
uint8_t SD_Init(void)
{
   uint8_t i;
   uint8_t r1;
   
   MMC_CS_DDR |= (1 << MMC_CS_PIN);
   MMC_PWR_DDR |= (1 << MMC_PWR_PIN);
   
   /* Select the card */
   MMC_CS_PORT &= ~(1 << MMC_CS_PIN);
   SD_Startup();
   
    /* card needs 74 cycles minimum to start up */
   for(i = 0; i < MMC_MAX_RETRIES; ++i)
   {
        /* wait 8 clock cycles */
      SPI_RxByte();
   }
    
   /* Reset the card */
   for( i = 0; ; i++)
   { 
      r1 = SD_Command(MMC_GO_IDLE_STATE, 0);
      if(r1 == 0x01){
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
      if(r1 == 0x01){
         break;
      }    
      if( i > MMC_MAX_RETRIES )
      {
         return 1;
      }
   }
   
   r1 = SD_Command(MMC_CRC_ON_OFF, 0);
   if(r1 != 0x01)
   {
      return -1;
   }
   
   r1 = SD_Command(MMC_SET_BLOCKLEN, 512);   
   if(r1 != 0x01)
   {
      return -1;
   }   
   
   return 0;
    


}

void SD_Startup(void)
{
   /* Power up the SD Card */
   MMC_PWR_PORT |= (1 << MMC_PWR_PIN);
  
   /* Set Clock Phase to sample on the rising edge */
   SPCR &= ~(1 << CPHA);   
}

void SD_Shutdown(void)
{
   /* Power down the SD Card */
   MMC_PWR_PORT &= ~(1 << MMC_PWR_PIN);
   /* Revert Clock Phase to sample on the falling edge */
   SPCR |= (1 << CPHA);     
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
	
	// send command
	SPI_TxByte(cmd | 0x40);
	SPI_TxByte(arg>>24);
	SPI_TxByte(arg>>16);
	SPI_TxByte(arg>>8);
	SPI_TxByte(arg);
   SPI_TxByte(cmd == MMC_GO_IDLE_STATE ? 0x95 : 0xff);	
   
	// end command
	// wait for response
	// if more than 8 retries, card has timed-out
	// return the received 0xFF
	while( (r1 = SPI_RxByte() ) == 0xFF)
		if(retry++ > MMC_MAX_RETRIES) break;
	// return response
	return r1;
}
