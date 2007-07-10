/* Functions require the use of the UART */
/* Used to write time data to the UART */

#include <avr/pgmspace.h>

#include "I2C/i2c.h"
#include "hardUart/hardUart.h"
#include "RTCPrint.h"
#include "mmculib/uint8toa.h"




static const prog_char Monday[] = "Monday";
static const prog_char Tuesday[] = "Tuesday";
static const prog_char Wednesday[] = "Wednesday";
static const prog_char Thursday[] = "Thursday";
static const prog_char Friday[] = "Friday";
static const prog_char Saturday[] = "Saturday";
static const prog_char Sunday[] = "Sunday";

static const PGM_P WEEKDAYS[7] PROGMEM = {   Monday,
									                  Tuesday,
									                  Wednesday,
									                  Thursday,
									                  Friday,
									                  Saturday,
									                  Sunday};
									 
									 
							 


/* printTIMEDATE: */
/* Print out variables with a separator 
 * Each variable is converted to ASCII before being printed
 *
 */
void printTIMEDATE(uint8_t timeDATA, uint8_t separator)
{
   uint8_t	OutputString[10];
	uint8toa(timeDATA, OutputString);
	if(timeDATA < 10)
	{
		uartTx('0');
	}
		
		//pausems(2);
				
	uartTxString(OutputString);
	uartTx(separator);

}







/* printTime:
 * Print out the time in the format HH:MM:SS
 * when passed the time array pointer
 */
void printTime(uint8_t* time)
{

	uint8_t temp_time[3];
	uint8_t i;
	
	/*Convert all times from BCD to decimal */
	for( i = SECONDS; i <= MINUTES; i++)
	{
		temp_time[i] = ((time[i] & TENS_MASK) >> 3)*5;
		temp_time[i] = temp_time[i] + (time[i] & ONES_MASK);
	}

	temp_time[HOURS] = ((time[HOURS] & HOUR_MASK) >> 3)*5;
	temp_time[HOURS] = temp_time[HOURS] + (time[HOURS] & ONES_MASK);

	/* Print out the time in the format HH:MM:SS */
	uartTxString_P( PSTR("\rThe current time is: "));
	for( i = HOURS; i <= HOURS; i--)
	{		
		printTIMEDATE(temp_time[i], ':');
	}
	
}


/* printDate:
 * Print out the Day and Date in the format <DAY OF WEEK> DD:MM:YY
 * when passed the time array pointer
 */
void printDate(uint8_t* time)
{
	
	uint8_t temp_time[4];
	uint8_t i;
	
	/*Convert all dates from BCD to decimal */
	for( i = DAY; i <= YEAR; i++)
	{
		temp_time[i-DAY] = ((time[i] & TENS_MASK) >> 3)*5;
		temp_time[i-DAY] = temp_time[i-DAY] + (time[i] & ONES_MASK);
	}
	
	/* Print out the day of the week*/
	uartTxString_P( PSTR("\rThe current date is: ") );
	
	uartTxString_P( WEEKDAYS[temp_time[DAY-DAY]-1] );

	uartTx(' ');
	
	/* Print out the Date in the format DD/MM/YY*/
	for( i = DATE; i <= YEAR; i++)
	{		
		printTIMEDATE(temp_time[i-DAY], '/');
	}

}
