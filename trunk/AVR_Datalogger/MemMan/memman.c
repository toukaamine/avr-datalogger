

/** Memory Manager files for the AVR-Datalogger */

#include <stdint.h>
#include <string.h>
/** Time Functions */
#include "DS1305/ds1305.h"
#include "RTC/RTCPrint.h"
#include "SD_MMC/sd.h"
#include "TinyFS/tff.h"
#include "memman.h"

#define MM_SDCARD 0
#define MM_EEPROM 1

/* Buffer size should not exceed that of either the SD or EEPROM mediums */
#define BUFFER_SIZE  128
#define MAX_DATA_SETS   5

/* 512 bytes */
/** As there is only one buffer, reading will overwrite any
 * previously buffered data and reset the write buffer ptr. */
uint8_t MM_Buffer[BUFFER_SIZE];
static uint32_t MM_Sector = 0;
static uint32_t MM_DataSetStartSector[MAX_DATA_SETS];
static uint32_t MM_DataSetEndSector[MAX_DATA_SETS];
static uint8_t  MM_CurrentDataSet;
static uint16_t BlockAddress = 0; /// Byte position within a sector.

static uint8_t MM_MemoryMode;
DataRecord_t MasterDataRecord;

/** endOption is either MM_SECTOR_START or MM_SECTOR_END
 * which corresponds the index's start/end sector address */
uint32_t MM_GetDataSector(uint8_t index, uint8_t endOption)
{
   if( index >= MAX_DATA_SETS )
   {
      return -1;  
   }
   
   if( endOption == MM_SECTOR_START )
   {
      return MM_DataSetStartSector[index];
   }
   else
   {
      return MM_DataSetEndSector[index];      
   }
  
}
   
/** Returns the current sector */
uint32_t MM_GetSector(void)
{
   return MM_Sector;  
}

/** Memory Type is either MM_SDCARD or MM_EEPROM */
void MM_SetMemory(uint8_t memoryType);


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
	uint16_t counter;
	
   MM_Buffer[ BlockAddress ] = data;
  
   BlockAddress++;
   /** Write the data to the memory once the buffer is full */
   if( BlockAddress = BUFFER_SIZE )
   {
		
		if( method == MM_SDCARD)
		{
	      /* Write the data */
	      f_write(&MasterDataRecord.sdFile, MM_Buffer, BUFFER_SIZE, &counter);
		}
		else
		{
			/** EEPROM Write */
			serialEE_WriteBlock( MM_Buffer, BUFFER_SIZE, MasterDataRecord.eepromFile);
			/* Update the eeprom address */
			MasterDataRecord.eepromFile.EE_Address += BUFFER_SIZE;
		}
		
      BlockAddress = 0;
   }
}

/** Write the cached data in the buffer to memory */
void MM_Sync(void);

/** Reads out the whole recording */
void MM_Read(uint8_t recordingIndex, uint8_t* dataBuffer)
{
   SD_Read( dataBuffer, recordingIndex, 1);
   /* Reset the write block address buffer */
   BlockAddress = 0;
}

/** Will create a new recording with the passed file name */
void MM_CreateRecording(uint8_t* name)
{
   uint8_t temp_date[4];
   uint8_t i;
   

   strcpy(MasterDataRecord.FileName, name);
	/* Attempt to open a new file in the SD card if one exists */
	if( MM_MemoryMode == MM_SDCARD )
	{
		if( f_open(&hellotxt, MasterDataRecord.FileName, FA_CREATE_ALWAYS | FA_WRITE) )
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
