#ifndef	_MEMMAN_ROUTINES
#define	_MEMMAN_ROUTINES

#include <stdint.h>
#include "Serial_EE/serial_ee.h"
#include "TinyFS/tff.h"


/* Buffer size should not exceed that of either the SD or EEPROM mediums */
#define MM_BUFFER_SIZE  128
#define MAX_DATA_SETS   5

#define MM_SECTOR_START 1
#define MM_SECTOR_END 0
#define MM_FILENAME_MAX	10

#define MM_SDCARD 0
#define MM_EEPROM 1

typedef struct _dataRecord
{
	uint8_t FileName[MM_FILENAME_MAX];
	EE_AddressStruct	eepromFile;
	FIL	sdFile;
	uint32_t sampleCount;
	
} DataRecord_t;

extern DataRecord_t MasterDataRecord;
extern uint8_t MM_Buffer[];



/** Memory Type is either MM_SDCARD or MM_EEPROM */
void MM_SetMemoryType(uint8_t memoryType);
uint8_t MM_GetMemoryType(void);

void MM_Write32(uint32_t data);

/** Requests to write a byte to the buffer */
void MM_Write(uint8_t data);

/** Reads out nbytes from the Master record and increments
 * the address pointer */
void MM_Read(uint8_t* buffer, uint8_t nbytes);

/** Will create a new recording with the passed file name */
void MM_CreateRecording(uint8_t* name);

void MM_Sync(void);

/** Internal functions */
void WriteMasterRecord(uint8_t* data, uint8_t nbytes);




#endif
