/* pause.h
 * Delay and pause Routines for the AVR Mega8
 *
 * Date: 16/04/06
 * Author : Adrian Gin (amg94@student.canterbury.ac.nz)
 *
 *
 */

#ifndef	_PAUSE_ROUTINES
#define	_PAUSE_ROUTINES

/* nop();
 * waste 1 clock cycle
 */


#define nop() __asm__ __volatile__ ("nop" ::)

/* pausems:
 * Do nothing for the passed number of milliseconds
 *
 * This function depends on the </util/delay.h> header file.
 */
void pausems(uint16_t Delay);



#endif

