/* Get Time 
 *
 * FILE: gettime.c
 * AUTHOR : Adrian Gin (amg94@student.canterbury.ac.nz)
 * DATE: 23/06/06 (__DATE__ just kidding :p )
 * 
 * DESCRIPTION: This program writes a header file named gettime.h
 * with the DATE and TIME defined as constants
 *
 *	This header file can be included at compile time so that the DATE and TIME
 * are known as constants.
 *
 * The resulting executable should be run in order to update the 
 * definitions in gettime.h
 *
 *
 *
 */



#include <stdio.h>
#include <time.h>

/* __DATE__ format: Mmm DD YYYY*/
/* __TIME__ format: HH:MM:SS */


/* __TIME__ Data extracts */
#define	BUILD_SECONDS   ((__TIME__[6] - '0')*10 + (__TIME__[7] - '0'))
#define	BUILD_MINUTES   ((__TIME__[3] - '0')*10 + (__TIME__[4] - '0'))
#define	BUILD_HOURS 	 ((__TIME__[0] - '0')*10 + (__TIME__[1] - '0'))


/* __DATE__ Data extracts */

#define	BUILD_YEAR		((__DATE__[9] - '0')*10 + (__DATE__[10] - '0'))
#define	BUILD_DATE		((__DATE__[4] - '0')*10 + (__DATE__[5]  - '0'))

enum months  {JAN = 1, FEB, MAR, APR, MAY, JUN, JUL, AUG, SEP, OCT, NOV, DEC};

/* Look at the last letter in the month to determine it */

#define	BUILD_MONTH		(__DATE__[2] == 'n' ? (__DATE__[1] == 'a' ? JAN : JUN) :\
								__DATE__[2] == 'b' ? FEB :	\
								__DATE__[2] == 'r' ? (__DATE__[0] == 'M' ? MAR : APR) :\
								__DATE__[2] == 'y' ? MAY :\
								__DATE__[2] == 'l' ? JUL :\
								__DATE__[2] == 'g' ? AUG :\
								__DATE__[2] == 'p' ? SEP :\
								__DATE__[2] == 't' ? OCT :\
								__DATE__[2] == 'v' ? NOV : DEC)
								
								
								
enum DAY {SUN = 0, MON, TUES, WED, THURS, FRI, SAT};

#define BUILD_DAY		((	(BUILD_YEAR+2000) \
									+ ((BUILD_YEAR+2000)/4) \
								   - ((BUILD_YEAR+2000)/100) \
								   + ((BUILD_YEAR+2000)/400) + \
								((BUILD_MONTH == JAN) ? 0 : \
								(BUILD_MONTH == FEB) ? 3 : \
								(BUILD_MONTH == MAR) ? 2 : \
								(BUILD_MONTH == APR) ? 5 : \
								(BUILD_MONTH == MAY) ? 0 : \
								(BUILD_MONTH == JUN) ? 3 : \
								(BUILD_MONTH == JUL) ? 5 : \
								(BUILD_MONTH == AUG) ? 1 : \
								(BUILD_MONTH == SEP) ? 4 : \
								(BUILD_MONTH == OCT) ? 6 : \
								(BUILD_MONTH == NOV) ? 2 : 4) + BUILD_DATE) % 7)								

#define 	OUTPUT_FILENAME	"gettime.h"

const	char	DESCRIPTION[] = {
"/* Get Time.h \n"
" * This file is generated by gettime.exe \n"
" * FILE: gettime.h \n"
" * AUTHOR : Adrian Gin (amg94@student.canterbury.ac.nz) \n"
" * DATE: %d/%d/%d \n"
" *\n"
" * DESCRIPTION: This file contains defintions for the date and time for when \n"
" * gettime.exe was last executed. \n"
" * \n"
" * The components of the 'tm' (time) struct are extracted and are defined. \n"
" * The day of the week is also calcuated. \n"
" */ \n\n\n\n\n"
"/* Information on the TM_(DATA) structure fields: \n"
" * TM_HOURS  		 hour (0 - 23)  \n"
" * TM_MINUTES 	 minutes (0 - 59)  \n"
" * TM_SECONDS 	 seconds (0 - 59)  \n *\n *\n"
" * TM_DAY   		 Day of week (0 - 6 : 0 = Sunday)  \n"
" * TM_DATE   		 day of month (1 - 31)  \n"
" * TM_MON 			 month (0 - 11 : 0 = January)  \n"
" * TM_YEAR  		 Year less 1900  \n"
" */ \n\n\n\n\n"};


const char	BUILD_DATA[] = {
"/* __TIME__ components */ \n"
"#define BUILD_SECONDS	(%d) \n"
"#define BUILD_MINUTES	(%d) \n"
"#define BUILD_HOURS		(%d) \n\n"
"/* __DATE__ components */ \n"
"#define BUILD_DAY			(%d) \n"
"#define BUILD_DATE		(%d) \n"
"#define BUILD_MONTH		(%d) \n"
"#define BUILD_YEAR		(%d) \n\n\n"   };


const char	TM_DATA[] = {
"/* TIME components */ \n"
"#define TM_SECONDS	(%d) \n"
"#define TM_MINUTES	(%d) \n"
"#define TM_HOURS		(%d) \n\n"
"/* DATE components */ \n"
"#define TM_DAY			(%d) \n"
"#define TM_DATE		(%d) \n"
"#define TM_MONTH		(%d) \n"
"#define TM_YEAR		(%d) \n\n\n\n\n\n\n\n\n\n"   };


/* tm struct data extracts */

const char* WEEKDAYS[7] = { "Sunday",
									 "Monday",
									 "Tuesday",
									 "Wednesday",
									 "Thursday",
									 "Friday",
									 "Saturday" };

#define	YEAR_OFFSET		(1900)		 
									 
/* Time information */
#define	TM_SECONDS (runtime_tm_struct->tm_sec)
#define	TM_MINUTES (runtime_tm_struct->tm_min)
#define	TM_HOURS	  (runtime_tm_struct->tm_hour)

/* Date information */

#define	TM_DATE	  (runtime_tm_struct->tm_mday)
#define	TM_MONTH	  (runtime_tm_struct->tm_mon)
#define	TM_YEAR	  (runtime_tm_struct->tm_year)
#define	TM_DAY	  (runtime_tm_struct->tm_wday)

int main(void)
{
	FILE* 	output;
	time_t 	runtime_time;
	
	struct tm*	runtime_tm_struct;
	time(&runtime_time);
	runtime_tm_struct = 	localtime(&runtime_time);
	
	/* Print the information of the current time */
	printf("%02d:%02d:%02d of %d/%d/%d\n", 
				TM_HOURS,
				TM_MINUTES,
				TM_SECONDS,
				TM_DATE,
				TM_MONTH,
				TM_YEAR + YEAR_OFFSET);
				
	printf("And Today is : %s\n\n", WEEKDAYS[TM_DAY]);

	/* Overwrite any file called gettime.h */
	if( (output = fopen(OUTPUT_FILENAME, "w")) == NULL)
	{
		printf("COULD NOT OPEN FILE!!!\n\n");
		return 0;	
		
	}
	
	/* Print out the description of gettime.h */
	
	fprintf( output, DESCRIPTION, BUILD_DATE, BUILD_MONTH, BUILD_YEAR);
	
	
	fprintf( output, BUILD_DATA,
						  BUILD_SECONDS,
						  BUILD_MINUTES,
						  BUILD_HOURS,
						  BUILD_DAY,
						  BUILD_DATE,
						  BUILD_MONTH,
						  BUILD_YEAR);
						  
						  
						  
	fprintf( output, TM_DATA,
						  TM_SECONDS,
						  TM_MINUTES,
						  TM_HOURS,
						  TM_DAY,
						  TM_DATE,
						  TM_MONTH,
						  TM_YEAR+YEAR_OFFSET-2000);
	
	
	
	fclose(output);
	
	return 0;	
}






