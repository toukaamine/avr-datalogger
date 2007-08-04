

/** Memory Manager files for the AVR-Datalogger */

#include <stdint.h>
#include <string.h>
#include <avr/pgmspace.h>
/** Time Functions */
#include "DS1305/ds1305.h"
#include "RTC/RTCPrint.h"
#include "SD_MMC/sd.h"
#include "TinyFS/tff.h"
#include "memman.h"
#include "hardUart/hardUart.h"


/* 128 bytes */
uint8_t MM_Buffer[MM_BUFFER_SIZE];
static uint16_t MM_BuffPtr = 0; /// Byte position within the buffer.

static uint8_t MM_MemoryMode;
DataRecord_t MasterDataRecord;
EE_AddressStruct MM_ReadAddress;

/** Memory Type is either MM_SDCARD or MM_EEPROM */
void MM_SetMemoryType(uint8_t memoryType)
{
	MM_MemoryMode = memoryType;	
}

uint8_t MM_GetMemoryType(void)
{
	return MM_MemoryMode;	
}


/* Writes 32 bytes to the buffer */
void MM_Write32(uint32_t data)
{
   MM_Write( (data >> 24) & 0xFF );
   MM_Write( (data >> 16) & 0xFF );
   MM_Write( (data >> 8) & 0xFF );      
   MM_Write( (data) & 0xFF );
}

/** Requests to write a byte to the buffer */
void MM_Write(uint8_t data)
{

   MM_Buffer[ MM_BuffPtr ] = data;  
   /** Write the data to the memory once the buffer is full */
   if( ++MM_BuffPtr == MM_BUFFER_SIZE )
   {	
		WriteMasterRecord(MM_Buffer, MM_BuffPtr);
	}
}

/** Write the cached data in the buffer to memory */
void MM_Sync(void)
{
	WriteMasterRecord(MM_Buffer, MM_BuffPtr);
	if( MM_MemoryMode == MM_SDCARD)
	{	
		f_sync( &MasterDataRecord.sdFile );
	}
}

/** Just Perform a data dump ... */
void MM_Read(uint8_t* buffer, uint8_t nbytes)
{
	uint16_t counter;

	if( MM_MemoryMode == MM_SDCARD)
	{
      /* Read the data in nbyte blocks */
      f_read(&MasterDataRecord.sdFile, buffer, nbytes, (uint16_t*)&counter);
	}
	else
	{
		/** EEPROM Read */
		serialEE_ReadBlock( buffer, nbytes, &MM_ReadAddress);
		/* Update the eeprom address */
		MM_ReadAddress.EE_Address += nbytes;
	}	
}

/** TODO: once read, the write pointer is destroyed... */
void MM_Rewind(void)
{
	
	if( MM_MemoryMode == MM_SDCARD)
	{
      /* Rewind file */
      f_lseek(&MasterDataRecord.sdFile, 0);
	}
	else
	{
		/** EEPROM Address Reset */
		MM_ReadAddress.EE_Address = 0;
	}
}

/** Will create a new recording with the passed file name */
void MM_CreateRecording(uint8_t* name)
{
   uint8_t temp_date[4];
   uint8_t i;
   

   strcpy( (char*)MasterDataRecord.FileName, (const char*)name);
	/* Attempt to open a new file in the SD card if one exists */
	if( MM_MemoryMode == MM_SDCARD )
	{
		if( f_open(&MasterDataRecord.sdFile, (const char*)MasterDataRecord.FileName, FA_CREATE_ALWAYS | FA_WRITE) )
		{
			uartTxString_P( PSTR("Open Failed!") );	
		}
	}
	else
	{
		/* Reset the EEPROM Pointer */
		MasterDataRecord.eepromFile.EE_Address = 0;
		MasterDataRecord.eepromFile.EE_Address = 0;	
	}
	
	
   /** Write the Datestamp and update the time */
   DS1305_GetTime( DS1305_TimeDate_config );
   /* Write the date to the SD card */
   /** The first 4 bytes of the recording have the Day, DD/MM/YY loaded */
   RTC_ConvertDate(DS1305_TimeDate_config, temp_date);
	/* Print out the Date in the format DD/MM/YY*/
	for( i = DAY; i <= YEAR; i++)
	{		
	  /* Write the DAY DD/MM/YY to signify the start date */
      MM_Write( temp_date[i - DAY] );
	}	
}

/** Internal functions */

/** Writes nbytes of data to the respective medium */
void WriteMasterRecord(uint8_t* data, uint8_t nbytes)
{
	uint16_t counter;

	if( MM_MemoryMode == MM_SDCARD)
	{
      /* Write the data */
      if( f_write(&MasterDataRecord.sdFile, data, nbytes, (uint16_t*)&counter) )
      {
			uartTxString_P( PSTR("Write Error!") );				
		}
	}
	else
	{
		/** EEPROM Write */
		serialEE_WriteBlock( data, nbytes, &MasterDataRecord.eepromFile);
		/* Update the eeprom address */
		MasterDataRecord.eepromFile.EE_Address += nbytes;
	}	
	MM_BuffPtr = 0;	
}
