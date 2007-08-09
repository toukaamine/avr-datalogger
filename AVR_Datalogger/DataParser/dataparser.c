#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "stdint.h"

#define DATE_ELEMENTS	4
#define TIME_ELEMENTS	4
#define FLOAT_ELEMENTS	4

#define DAY		0
#define DATE 	1
#define MONTH	2
#define YEAR	3

#define HOUR	0
#define MINUTE 1
#define SECOND 2

#define CHANNEL_COUNT 32
#define HOURBIT_24	6

#define CHANNEL_ON 	1
#define CHANNEL_OFF 	0
#define TYPE_VOLTAGE 		1
#define TYPE_TEMPERATURE 	0
/* BCD to Decimal macro */
/* These are used to convert the tm structure values to 
 * the format accepted by the Dallas RTCs */
 
#define BCD2DEC(x)		((((x >> 4) & 0x0F)*10) + (x & 0x0F))
 
#define	DEC2BCD_HI(x)	((x)/10)
#define	DEC2BCD_LO(x)	((x)%10)
#define	DEC2BCD(x)		(((DEC2BCD_HI(x)) << 4) + (DEC2BCD_LO(x)))


const char outputFileName[] = "Output.csv";
const char* WEEKDAYS[] = { "Sunday",
									"Monday",
									"Tuesday",
									"Wednesday",
									"Thursday",
									"Friday",
									"Saturday"
									
								};


typedef struct _DATE_DATA
{
	/* Monday to Sunday */
	uint8_t	day;
	
	/* 1 to 31st */
	uint8_t	date;
	
	/* 1 to 12 */
	uint8_t	month;
	uint8_t 	year;
} date_t;


typedef struct _TIME_DATA
{
	/* 0 to 23 */
	uint8_t	hour;
	
	/* 0 to 59 */
	uint8_t	minute;
	uint8_t	second;
} TimeStamp_t;

typedef union _FLOAT_DATA
{
	uint8_t byte[4];
	float	FP;	
} float32_t;

typedef union _32bitData
{
	uint8_t 	byte[4];
	uint32_t data;
} uint32_T;


int main(void)
{
	uint32_T channelState;
	uint32_T channelType;	
	date_t dataStartDate;	
	FILE* dataFile;
	FILE* outputFile;
	TimeStamp_t timestamp;	
	float32_t channelResult;
	
	char	inputFileName[20];
	unsigned char  inputBuffer[5000];
	int	i;
	int	sampleCount = 0;
	int numberOfChannels = 0;
	
	printf("Please enter the avr-datalogger file: \n");
	
	scanf("%s", inputFileName);
	
	printf("Attempting to open: %s\n", inputFileName);
	dataFile = fopen(inputFileName, "r");
	if( dataFile == 0 )
	{
		printf("File not found!\n");
		return 1;
	} 
	
	printf("Parsing data..........\n"
			 "Creating Output file: %s\n", outputFileName);
	
	outputFile = fopen(outputFileName, "w+");
	if( outputFile == 0 )
	{
		printf("Could not create output file!\n");
		return 1;
	}
	
	printf("Reading Date..........\n");	

	
	//rewind(dataFile);
	/* Read the first 4 bytes into the date struct */
	fread(inputBuffer, sizeof(char), DATE_ELEMENTS, dataFile);
	
	dataStartDate.day = BCD2DEC( inputBuffer[DAY] );
	dataStartDate.date = BCD2DEC( inputBuffer[DATE] );
	dataStartDate.month = BCD2DEC( inputBuffer[MONTH] );
	dataStartDate.year = BCD2DEC( inputBuffer[YEAR] );			
	
	fprintf(outputFile, "Recording started on: %s %d/%d/%d\n",
		WEEKDAYS[dataStartDate.day - 1],
		dataStartDate.date, dataStartDate.month, dataStartDate.year + 2000);
	
				  	
	/* Read the channel state config (4 bytes)  */
	fread(inputBuffer, sizeof(char), 4, dataFile);	
	/* Determine which channels are activated */
	for( i = 0 ; i < 4; i++)
	{
		channelState.byte[3-i] = inputBuffer[i];
	}

	/* Read the channel type config (4 bytes)  */
	fread(inputBuffer, sizeof(char), 4, dataFile);	
	/* Determine which channels are voltages / temperature */
	for( i = 0 ; i < 4; i++)
	{
		channelType.byte[3-i] = inputBuffer[i];
	}
	
	/* Print the time stamp heading */
	fprintf( outputFile, "Time Stamp, ");
	
	/* Print the headings of the channels which are on */
	for( i = 1; i <= CHANNEL_COUNT; i++)
	{
		if( channelState.data & (1 << (i - 1)) )
		{
			fprintf(outputFile, "Channel %d ", (i) );	
				
			if( (channelType.data & (1 << (i - 1) )) == TYPE_TEMPERATURE )
			{
				fprintf(outputFile, "Temperature, ");					
			}
			else
			{
				fprintf(outputFile, "Voltage, ");	
			}
			numberOfChannels++;
		}
	}
	
	fprintf( outputFile, "\n" );	

	



	/* Read the timestamp data */	
	fread(inputBuffer, sizeof(char), 3, dataFile);

	timestamp.hour = BCD2DEC( (inputBuffer[HOUR] & ~(1 << HOURBIT_24)) );
	timestamp.minute = BCD2DEC(inputBuffer[MINUTE]);	
	timestamp.second = BCD2DEC(inputBuffer[SECOND]);	
	
	printf("Outputing floating point data...\n");
	
	/* File is considered finished when received hour > 150 (ie. 0xFF)*/
	while( ( timestamp.hour < 24 ) )
	{		
		/* Print Time stamp data */
		fprintf(outputFile, "%d:%d:%d, ", 
				  timestamp.hour, timestamp.minute, timestamp.second);
						
		/* Read in channel float data */
		for( i = 0; i < numberOfChannels; i++)
		{
			/* For each channel, read in one float */
			fread(inputBuffer, sizeof(float), 1, dataFile);			
			
			channelResult.byte[3] = inputBuffer[0];
			channelResult.byte[2] = inputBuffer[1];
			channelResult.byte[1] = inputBuffer[2];
			channelResult.byte[0] = inputBuffer[3];
			
			fprintf(outputFile, "%f, ", channelResult.FP);
			
		}
		
		fprintf(outputFile, "\n");

		/* Read the timestamp data */	
		fread(inputBuffer, sizeof(char), 3, dataFile);

		timestamp.hour = BCD2DEC( (inputBuffer[HOUR] & ~(1 << HOURBIT_24)) );
		timestamp.minute = BCD2DEC(inputBuffer[MINUTE]);	
		timestamp.second = BCD2DEC(inputBuffer[SECOND]);		
		sampleCount++;	

		
	}
	
	printf("Read in %d samples from %d channels\n", sampleCount, numberOfChannels);	
	printf("Closing files...\n");
	
	fclose(outputFile);
	fclose(dataFile);
	
	printf("Done!\n"
			 "Parsing Completed!\n");	

	return 0;	
}
