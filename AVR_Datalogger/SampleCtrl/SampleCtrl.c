/* For delays larger than 'x' msecs, use the RTC Timer 1 */
/* The other RTC Timer 0 will be used for alarms (multiple timers can be used 
 * through software */
 
/* When the RTC is being used to sample, Timer2 Compare interrupt is disabled */
/* SC_DisableTimer is called */

/* Have all interrupts in the main function */

/* Sets up the required timers etc */


#include <avr/io.h>
#include "SampleCtrl.h"

void SC_Init(void)
{
   /* The primary sample timer will use the 8-bit Timer 2 */
   /* Use CTC Mode and clock at FCPU / 32  */
   TCCR2 = (1 << WGM21) | (1<< CS21) | (1<< CS20);    
   /* Set Compare mode to 250 so a compare occurs every 250us */
   OCR2 = SC_COMPARE_RATE;
   TCNT2 = 0x00;
}

