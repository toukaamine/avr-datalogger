/* Modified code from Pascal Stang and Roland Riegel */

#include <avr/io.h>
#include "sd.h"
#include "SPI/spi.h"
#include <util/delay.h>
#include "mmculib/uint8toa.h"
#include "hardUart/hardUart.h"
#include "diskio/diskio.h"

#define SD_DEBUG  0


DSTATUS MMC_Stat = STA_NOINIT;

uint8_t SD_disk_Init(void)
{
	if( SD_Init() == SD_SUCCESS)
	{
		return RES_OK;	
	}	
	else
	{
		return RES_ERROR;	
	}
}

/* returns 0 if success */
uint8_t SD_Init(void)
{
   uint8_t i;
   uint8_t r1;
   
   MMC_CS_DDR |= (1 << MMC_CS_PIN);
   MMC_PWR_DDR |= (1 << MMC_PWR_PIN);
   
   
   SD_Startup();
   
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
         return SD_ERROR;
      }
   }

   /* Initialise the card's activation sequence */
   for( i = 0; ; i++)
   { 
      r1 = SD_Command(MMC_SEND_OP_COND, 0);
      _delay_ms(10);
		
		if(r1 == MMC_R1_READY){
         break;
      }    
      if( i > 200 )
      {
         return SD_ERROR;
      }
   }
  
   r1 = SD_Command(MMC_CRC_ON_OFF, 0);
   
   r1 = SD_Command(MMC_SET_BLOCKLEN, 512);     
   
   /* Release and return clock phase and speed back to default */
   MMC_CS_PORT |= (1 << MMC_CS_PIN);
   SPCR |= (1 << CPHA) | (1 << SPR1);
   
   MMC_Stat &= ~(STA_NOINIT); /// Set to initialised
   return SD_SUCCESS;
}

void SD_Startup(void)
{
   /* Power up the SD Card */
   MMC_PWR_PORT &= ~(1 << MMC_PWR_PIN);
  
   /* Set Clock Phase to sample on the rising edge */
   SPCR &= ~((1 << CPHA) | (1 << SPR1));	 
}

void SD_Shutdown(void)
{
   /* Disable SPI, Bring all SD lines low */
   SPCR &= ~(1 << SPE);
   
   SPI_PORT &= ~( (1<<MOSI) );
   MMC_CS_PORT |= (1 << MMC_CS_PIN);
   
   /* Power down the SD Card */
   MMC_PWR_PORT |= (1 << MMC_PWR_PIN);
   /* Re-Enable SPI and Revert Clock Phase to sample on the falling edge */
   SPCR |= ((1 << CPHA) | (1<<SPE));     
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
#if SD_DEBUG	
	uint8_t outputString[5];

   uartNewLine();
   uartTxString("R1 Response: ");
   uint8toa(r1, outputString);
   uartTxString(outputString);
   uartNewLine();   
#endif

	return r1;
}


/* Subroutine which reads 'byteCount' bytes from the SPI and writes it to buffer */
uint8_t SD_ReadBlock(uint8_t* buffer, uint16_t byteCount)
{
	uint16_t i;
	uint8_t retry = 0;	
	/** Wait for start block */
	while( SPI_RxByte() != MMC_STARTBLOCK_READ)
	{
		if(retry++ > MMC_MAX_RETRIES)
		{
			return SD_ERROR;		
		}
	}
	/* read in data */
	for(i=0; i < byteCount; i++)
	{
		*buffer++ = SPI_RxByte();
	}
	SPI_RxByte(); /// read 16-bit CRC
	SPI_RxByte();
	
	
	
	return SD_SUCCESS;	
}

/* Used by SD_DISKREAD */
/** Writes the buffer to the sector. secCount is the number of sectors to write */	
uint8_t SD_Read(uint8_t* buffer, uint32_t sector, uint8_t secCount )
{
	// assert chip select
   MMC_CS_PORT &= ~(1 << MMC_CS_PIN);
   
   
   sector = sector << 9;
   
	if (secCount == 1) {									// Single block read 
		if ((SD_Command(MMC_READ_SINGLE_BLOCK, sector) == 0)		// READ_SINGLE_BLOCK 
			&& SD_ReadBlock(buffer, 512))
			secCount = 0;
	}
	else {	// Multiple block read
		if (SD_Command(MMC_READ_MULTIPLE_BLOCK, sector) == 0) 
		{	// READ_MULTIPLE_BLOCK 
			do 
			{
				if (!SD_ReadBlock(buffer, 512)) break;
				buffer += 512;
			} while (--secCount);
			SD_Command(MMC_STOP_READ_TRANS, 0);				// STOP_TRANSMISSION 
		}
	}
  
	// wait until card not busy
	while(!SPI_RxByte());	

   /* Release and return clock phase and speed back to default */
   MMC_CS_PORT |= (1 << MMC_CS_PIN);
   SPCR |= (1 << CPHA) | (1 << SPR1);
  
	// return success
	return secCount ? RES_ERROR : RES_OK;
}




/** Subroutine which writes 512 bytes of buffer to the SD Card*/
/* Token is the data token to send */
uint8_t SD_WriteSector(uint8_t* buffer, uint8_t token)
{
	uint16_t i;

	/* Send Dummy Byte */
	SPI_RxByte();

	SPI_TxByte(token);

	/* Write data */
	for(i=0; i<0x200; i++)
	{
		SPI_TxByte(*buffer++);
	}
	SPI_RxByte(); /// read 16-bit CRC
	SPI_RxByte();
	
	uint8_t r1 = SPI_RxByte();
	// read data response token
	if( (r1 & MMC_DR_MASK) != MMC_DR_ACCEPT)
	{
#if SD_DEBUG		
		uint8_t outputString[5];	
   	uartNewLine();
   	uartTxString("R1 Response: ");
   	uint8toa(r1, outputString);
   	uartTxString(outputString);
   	uartNewLine();  
#endif   	
		return SD_ERROR;	
	}
		
	
	
	return SD_SUCCESS;	
}



/* Writes 'secCount' sectors of buffer to the address sector */
uint8_t SD_Write(const uint8_t* buffer, uint32_t sector, uint8_t secCount)
{   
	// assert chip select
   MMC_CS_PORT &= ~(1 << MMC_CS_PIN);
   
   sector = sector << 9;
   
	if (secCount == 1) {									// Single block write 
		if ((SD_Command(MMC_WRITE_BLOCK, sector) == 0)
			&& SD_WriteSector( (uint8_t*) buffer, MMC_STARTBLOCK_WRITE))
			secCount = 0;
	}
	else {	// Multiple block Write
		if (SD_Command(MMC_WRITE_MULTIPLE_BLOCK, sector) == 0) 
		{ 
			do 
			{
				if (!SD_WriteSector( (uint8_t*)buffer, MMC_STARTBLOCK_MWRITE)) break;
				buffer += 512;
			} while (--secCount);
			SPI_TxByte(MMC_STOPTRAN_WRITE);				// STOP_TRANSMISSION 
		}
	}
  
	// wait until card not busy
	while(!SPI_RxByte());	

   /* Release and return clock phase and speed back to default */
   MMC_CS_PORT |= (1 << MMC_CS_PIN);
   SPCR |= (1 << CPHA) | (1 << SPR1);
  
	// return success
	return secCount ? RES_ERROR : RES_OK;
}





/** Disk IO Functions */
DSTATUS SD_disk_status(void)
{
	return 0;
}

/*-----------------------------------------------------------------------*/
/* Miscellaneous Functions                                               */
/*-----------------------------------------------------------------------*/
/** Ctrl is the control command to send */
/** buff is the memory to read or write the control data to */
DRESULT SD_disk_ioctl(	uint8_t ctrl,	void *buff )
{
	DRESULT res;
	uint8_t n, csd[16], *ptr = buff;
	uint16_t csize;

	res = RES_ERROR;


	if (MMC_Stat & STA_NOINIT) return RES_NOTRDY;

   /* Select the card */
   MMC_CS_PORT &= ~(1 << MMC_CS_PIN);

	switch (ctrl) 
	{
		case GET_SECTOR_COUNT :	/* Get number of sectors on the disk (DWORD) */
			if ((SD_Command(MMC_SEND_CSD, 0) == 0) && SD_ReadBlock(csd, 16)) {
				if ((csd[0] >> 6) == 1) {	/* SDC ver 2.00 */
					csize = csd[9] + ((uint16_t)csd[8] << 8) + 1;
					*(uint32_t*)buff = (uint32_t)csize << 10;
				} else {					/* MMC or SDC ver 1.XX */
					n = (csd[5] & 15) + ((csd[10] & 128) >> 7) + ((csd[9] & 3) << 1) + 2;
					csize = (csd[8] >> 6) + ((uint16_t)csd[7] << 2) + ((uint16_t)(csd[6] & 3) << 10) + 1;
					*(uint32_t*)buff = (uint16_t)csize << (n - 9);
				}
				res = RES_OK;
			}
			break;
	
		case GET_SECTOR_SIZE :	/* Get sectors on the disk (WORD) */
			*(uint16_t*)buff = 512;
			res = RES_OK;
			break;
	
		case CTRL_SYNC :	/* Make sure that data has been written */
				while(!SPI_RxByte());
				res = RES_OK;
			break;
	
		case MMC_GET_CSD :	/* Receive CSD as a data block (16 uint8_ts) */
			if (SD_Command(MMC_SEND_CSD, 0) == 0		/* READ_CSD */
				&& SD_ReadBlock(ptr, 16))
				res = RES_OK;
			break;
	
		case MMC_GET_CID :	/* Receive CID as a data block (16 uint8_ts) */
			if (SD_Command(MMC_SEND_CID, 0) == 0		/* READ_CID */
				&& SD_ReadBlock(ptr, 16))
				res = RES_OK;
			break;
	
		case MMC_GET_OCR :	/* Receive OCR as an R3 resp (4 uint8_ts) */
			if (SD_Command(MMC_READ_OCR, 0) == 0) {	/* READ_OCR */
				for (n = 0; n < 4; n++)
					*ptr++ = SPI_RxByte();
				res = RES_OK;
			}
	
		case MMC_GET_TYPE :	/* Get card type flags (1 uint8_t) */
			*ptr = 0;
			res = RES_OK;
			break;
	
		default:
			res = RES_PARERR;
	}

   /* Deselect the card */
   MMC_CS_PORT |= (1 << MMC_CS_PIN);
	SPI_RxByte();			/* Idle (Release DO) */


	return res;
}
