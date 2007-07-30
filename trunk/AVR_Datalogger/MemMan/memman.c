

/** Memory Manager files for the AVR-Datalogger */

#include <stdint.h>
/** Time Functions */
#include "DS1305/ds1305.h"
#include "RTC/RTCPrint.h"
#include "SD_MMC/sd.h"
#include "memman.h"

#define MM_SDCARD 0
#define MM_EEPROM 1

#define BUFFER_SIZE  0x200
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
   MM_Buffer[ BlockAddress ] = data;
  
   BlockAddress++;
   if( BlockAddress >= 512 )
   {
      /* Write the data */
      SD_Write(MM_Sector, MM_Buffer);
      
      BlockAddress = 0;
      MM_Sector++;
      /* Updates the position of the 'currentDataSet' */
      MM_DataSetEndSector[ MM_CurrentDataSet ] = MM_Sector;  
   }
}

/** Reads out the whole recording */
void MM_Read(uint8_t recordingIndex, uint8_t* dataBuffer)
{
   SD_Read(recordingIndex, dataBuffer);
   /* Reset the write block address buffer */
   BlockAddress = 0;
}

/** Will create a new recording and returns the start sector / address */
/** A new dataset which is given the location 'index' */
uint32_t MM_CreateRecording(uint8_t index)
{
   uint8_t temp_date[4];
   uint8_t i;
   
   /* Update the time */
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

   MM_DataSetEndSector[index] = MM_Sector;
   MM_DataSetStartSector[index] = MM_Sector;  
   MM_CurrentDataSet = index;

   return MM_GetSector();
}


void MM_SetRecordingIndex(uint8_t index)
{
   MM_CurrentDataSet = index;  
}

/** Internal functions */
void MM_WriteBuffer(void);
