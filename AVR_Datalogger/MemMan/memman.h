#ifndef	_MEMMAN_ROUTINES
#define	_MEMMAN_ROUTINES

#include <stdint.h>


#define MM_SECTOR_START 1
#define MM_SECTOR_END 0

extern uint8_t MM_Buffer[];

/** Returns the current sector */
uint32_t MM_GetSector(void);

uint32_t MM_GetDataSector(uint8_t index, uint8_t endOption);


/** Memory Type is either MM_SDCARD or MM_EEPROM */
void MM_SetMemory(uint8_t memoryType);


void MM_Write32(uint32_t data);

/** Requests to write a byte to the buffer */
void MM_Write(uint8_t data);

/** Reads out the whole recording */
void MM_Read(uint8_t recordingIndex, uint8_t* dataBuffer);


/** Will create a new recording and returns the start sector / address */
uint32_t MM_CreateRecording(uint8_t index);


/** Internal functions */
void MM_WriteBuffer(void);




#endif