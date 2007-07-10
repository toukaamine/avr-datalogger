/* pause.c
 * Delay and pause Routines for the AVR Mega8
 *
 * Date: 16/04/06
 * Author : Adrian Gin (amg94@student.canterbury.ac.nz)
 *
 *
 */
 


 
#include <stdint.h>
#include <avr/io.h>
#include <avr/iom169.h>
 
#define F_CPU		8000000UL 
#include	<util/delay.h>

#define RESET 	  0x00
#define clk64	  0x03
#define clk256   0x04
#define clk1024  0x05

#define CLK 1   /*Speed of micro in MHz*/
#define _INCLUDE_TIMER_DELAY	0


#if _INCLUDE_TIMER_DELAY
/* pause: Set 8Bit Timer0 to clock at 256th the internal clock speed*/
void pause (uint16_t PDELAY)
{
      uint16_t i;
      TCCR0     =      clk256;
      for (i = 0; i < PDELAY; i++)
      {
       TCNT0    =      RESET;
       while (TCNT0 < 4) {;}
      }	  
}
#endif


/* pausems:
 * Do nothing for the passed number of milliseconds
 *
 * This function depends on the </util/delay.h> header file.
 */
#define TIMEMS 2045 /*for 1Mhz (91)*/

void pausems(uint16_t  Delay)
{
    uint16_t  i;
    
    for(i = 0; i < Delay; i++)
    {
        _delay_loop_2(TIMEMS);
    }
}

