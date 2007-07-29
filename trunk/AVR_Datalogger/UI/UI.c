


#include "MAX7300/max7300.h"
#include "I2C/i2c.h"
#include "UI.h"

/* To do, do a switch case based on the the return of 
 * UI_InterruptEvent most likely be in the INT0 vector.*/

void UI_Init(void)
{
   /* Should call UI_KP? */
   
	UI_Activate();
}

/* Turns the UI MAX7300 on and turns on interrupts */
void UI_Activate(void)
{       
   

   
   /* Enable Transition detection on RTC inputs and Keypad Columns */   
   UI_SetRegister(MAX7300_TRANSITION_MASK, 0xFF & ~(1 << MAX7300_TM_P24) );
	   
   /* Set Config to turn on and Enable Transition detect */
   UI_SetRegister(MAX7300_CONFIG, (1 << MAX7300_SHUTDOWN_CONTROL) | (1 << MAX7300_TRANSITION_ENABLE));

}







/* OBSOLETE (NEARLY) */
/* When the transition detect trips... return which pin tripped / went to 'state'*/
/* User the 'Transition Mask Bits' to decipher what it was */
/* State is either UI_HIGH or UI_LOW  (usually use LOW )*/
/* It is important to handle RTC inputs first */
uint8_t UI_InterruptEvent(uint8_t state)
{
   uint8_t IntResult;
   uint8_t i;
   

   IntResult = UI_ReadRegister(MAX7300_PORTINT) & (0x7F);	
 	
 	
 	for( i = 0; i < 8 ; i++ )
   {
      if( ( (IntResult << i) & (0x80) ) == state )
      {
         return i;  
      }
   } 
 	
 	/* If there was no pin which is in the passed state */
 	return UI_INVALID_TRANSITION;
 	
}


