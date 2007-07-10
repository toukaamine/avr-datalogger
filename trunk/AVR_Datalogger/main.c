

#include <avr/io.h>
#include <avr/interrupt.h>

#include "SPI/spi.h"
#include "hardUart/hardUart.h"
#include "SampleCtrl/SampleCtrl.h"
#include "UI_KP/UI_KP.h"
#include "UI/UI.h"
#include "Menu/Menu.h"

/* INT0 interrupt is connected to an Active High Interrupt 
 * Thus set MCUCR |= (0x03 << ISC00) */

/* Todo: Menu Handling and Button Presses + RTC interrupts (Low Prio) */
/* Write functions to get and return Sensor data */  

extern uint8_t currentState;

/* Waking up from Power Down requires 6Clock Cycles */ 
uint16_t sampleSetting;



/* Counts number of SC_Compare_rate us. */
/* Perhaps use a faster FPU speed ? */
/* With a presacler of 8, 125 == 1 msec so this is a 1msec counter */
ISR(TIMER2_COMP_vect)
{
   cli();
   
   static uint16_t counter;
   counter = counter + 1;
   
   if( counter == SC_MILLISECOND)
   {
      
   } 
   
   
   
   sei();
   
}


/* This is used to parse the KP inputs and RTC inputs */
/* It is important to handle RTC inputs first */
ISR(INT0_vect)
{

   cli();
   
   uint8_t IntResult;   
   IntResult = ~(UI_ReadRegister(MAX7300_PORTINT) >> UI_RTC_INT0) & (0x03); 
   
   /* Check for RTC interrupt */
   switch( IntResult )
   {
      /* RTC_INT0 Triggered */
      case 1:
         /* INT0 Handler */
         
         
         break;
         
      /* RTC_INT1 Triggered */         
      case 2:
         /* INT1 Handler */
         
         break;
      
      /* Both triggered */
      case 3:
         /* INT1 has priority */
         
         /* INT1 Handler */          
         /* INT0 Handler */ 
         break;
      
      
      /* Interrupt must have been from a Button press then */
      default:       
         IntResult = UI_KP_GetPress();
         MenuSetInput(IntResult);
         break;
   }
   


   sei();
   
}


/* To do, MMC add #conditional includes
 * MAX7300 routines.
 */

int main(void)
{
   
   /* Reprint Menu */

   
   return 0;  
   
}







