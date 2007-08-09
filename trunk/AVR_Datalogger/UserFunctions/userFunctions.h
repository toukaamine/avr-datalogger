/** \file userFunctions.h
	 \brief User Functions
*/

/**	 

	\ingroup avr_datalogger
 	\defgroup userFunctions User Functions
 	\code #include "userFunctions.h" \endcode

 	 
	 \par Description
    Library of User functions. Most of these functions are
    accessed via the UART terminal or the Menu System.
*/
//@{
   


#include "ADS1213/ads1213.h"

#define SECONDS_MAX	59
#define MINUTES_MAX	59
#define HOURS_MAX		23

#define MKTIME_SECONDS 	0
#define MKTIME_MINUTES	1
#define MKTIME_HOURS 	2

#define MKTIME_CANCEL  0xFF
#define MKTIME_PENDING 0xFE
#define MKTIME_CONFIRMED 0xFD

#define CALIBRATION_CHANNEL	(3)
#define CALIBRATION_GAIN		(GAIN_COUNT - 1)

void BeginRecording(void* data);

/** Function to setup each individual channel */
void ChannelSettings(void* data);
void SetSamplingRate(void* data);
/* Instead of get time, it is get Alarm */
void SetLongRate(void* data);
void SetShortRate(void* data);

void Reset(void* data);
void MenuSetTime(void* data);
uint8_t MakeTime(void* data, int8_t* timeComponent );

void ADS1213_Status(void* data);

void PrintSampleRate(void);


void GS_Status(void* data);

void MenuSetUartMode(void* data);
void MenuSetLCDMode(void* data);
void MenuDisplayMode(void* data);

void MediumSelect(void* data);
void MediumEEPROM(void* data);
void MediumSDCard(void* data);


void ReadRecording(void* data);


void Calibrate(void* data);


void SetDecimation(void* data);


void printAmbientTemperature(void* data);


void GS_Status2(void* data);

