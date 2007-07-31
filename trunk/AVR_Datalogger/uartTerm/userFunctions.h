
#include "ADS1213/ads1213.h"

void Reset(void* data);
void GetResult(void* data);
void GetTime(void* data);

void ReadData(void* data);
void MMC_ReadTimeTest(void* data);
void MMC_WriteTest(void* data);
void ADS1213_Status(void* data);



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
void ReadSD(void* data);
void UnMountSD(void* data);
