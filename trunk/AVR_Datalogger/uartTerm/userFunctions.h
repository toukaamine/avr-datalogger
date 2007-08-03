
#include "ADS1213/ads1213.h"

void BeginRecording(void* data);

/** Function to setup each individual channel */
void ChannelSettings(void* data);
void SetSamplingRate(void* data);
/* Instead of get time, it is get Alarm */
void SetLongRate(void* data);
void SetShortRate(void* data);

void Reset(void* data);
void GetResult(void* data);
void GetTime(void* data);
void MenuSetTime(void* data);
uint8_t MakeTime(void* data, int8_t* timeComponent );

void ReadData(void* data);
void MMC_ReadTimeTest(void* data);
void MMC_WriteTest(void* data);
void ADS1213_Status(void* data);

void PrintSampleRate(void);

void ChannelUp(void* data);
void ChannelDown(void* data);
void GainUp(void* data);
void GainDown(void* data);

void GS_Status(void* data);

void MenuSetUartMode(void* data);
void MenuSetLCDMode(void* data);
void MenuDisplayMode(void* data);




void MountSD(void* data);
void OpenSD(void* data);
void CloseSD(void* data);
void WriteSD(void* data);
void ReadRecording(void* data);
void UnMountSD(void* data);
