#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/pgmspace.h>
#include <Util/delay.h>
#include <avr/sleep.h>



#include "I2C/i2c.h"
#include "SPI/spi.h"
#include "hardUart/hardUart.h"
#include "SampleCtrl/SampleCtrl.h"
#include "UI_KP/UI_KP.h"
#include "UI_LCD/UI_LCD.h"
#include "UI/UI.h"
#include "Menu/Menu.h"
#include "GainSensor/GainSensor.h"



#define UART_PORT PORTD
#define UART_DDR  DDRD
#define UART_TX_PIN   PD1
#define UART_RX_PIN   PD0


/* INT0 interrupt is connected to an Active High Interrupt 
 * Thus set MCUCR |= (0x03 << ISC00) */

/* Todo: Menu Handling and Button Presses + RTC interrupts (Low Prio) */
/* Write functions to get and return Sensor data */  

extern uint8_t currentState;

/* Waking up from Power Down requires 6Clock Cycles */ 
uint16_t sampleSetting;



/* To do, MMC add #conditional includes
 * MAX7300 routines.
 */

int main(void)
{
   
   uartInit(0, 1);


   sei();
   UCSRB |= (1 << RXCIE);
   
	i2cInit(1 , 0);

   //GS_Init();
      
   UI_Activate();
   UI_KP_Init();
   UI_LCD_HWInit();
   UI_LCD_Activate();  
   UI_LCD_Init();
      
   /* Reprint Menu */

   DDRD |= (1<<PD5);

   UI_LCD_SetData();
   MCUCR |= (0x03 << ISC00);
   GICR |= (1 << INT0);
   while(1)
   {
      set_sleep_mode(SLEEP_MODE_IDLE);
      sleep_enable();
      sleep_cpu();
   }
   
   return 0;  
   
}

/* To echo the receiver buffer*/
ISR(SIG_UART_RECV)
{

   UI_LCD_Char(UDR);
   
   UI_LCD_Pos( 0 , 0);
   UI_LCD_String_P( PSTR("Line 0") );
 
   UI_LCD_Pos( 1 , 0);
   UI_LCD_String_P( PSTR("Line 1") );

   UI_LCD_Pos( 2 , 0);
   UI_LCD_String_P( PSTR("Line 2") );
   
   UI_LCD_Pos( 3 , 0);
   UI_LCD_String_P( PSTR("Line 3") );         
   
}


/* Counts number of SC_Compare_rate us. */
/* Perhaps use a faster FPU speed ? */
/* For 1MHZ With a presacler of 8, 125 == 1 msec so this is a 1msec counter */
/* For 8MHZ               "     32, 250 = 1 msec */
ISR(TIMER2_COMP_vect)
{
   cli();
   
   static uint8_t counter_ms;
   static uint16_t counter_100ms;

/* Example */
/* Happens every 10 seconds, max seconds = 25.5secs  
 * Although we can use a uint16_t variable to obtain a 6502.5 sec max */
	const uint8_t ControlEvent = 10*SC_SECONDS;
	
   
   counter_ms++;
   
   if( counter_ms == 100*SC_MILLISECOND)
   {
		counter_ms = 0;
		counter_100ms++;
		
		/* Functions which occur every xx*100msecs happen here */
		if( counter_100ms == ControlEvent)
		{
		
			/* Do Control Event */
			
		}
		
      
   } 
   
   /* Functions occuring between 1 to 99msecs occur here */
   
   
   sei();
   
}


/* This is used to parse the KP inputs and RTC inputs */
/* It is important to handle RTC inputs first */
ISR(INT0_vect)
{

   /* Should have a debounce counter... */

   cli();
   
   uint8_t IntResult;   
   IntResult = ~(UI_ReadRegister(MAX7300_PORTINT) >> UI_RTC_INT0) & (0x03); 
   /* Need to reset Interrupt */   
   UI_SetRegister(UI_INTERRUPT, 0);   

   
   /* Check for RTC interrupt */
   switch( IntResult )
   {
      /* RTC_INT0 Triggered */
      case 1:
         /* INT0 Handler */
         uartTxString((uint8_t*)"RTC INT0 Triggered!");
         
         break;
         
      /* RTC_INT1 Triggered */         
      case 2:
         /* INT1 Handler */
         uartTxString((uint8_t*)"RTC INT1 Triggered!");         
         break;
      
      /* Both triggered */
      case 3:
         /* INT1 has priority */
         //uartTxString((uint8_t*)"BOTH RTC INTS Triggered!");         
         /* INT1 Handler */          
         /* INT0 Handler */ 
         break;
      
      
      /* Interrupt must have been from a Button press then */
      default:       
         IntResult = UI_KP_GetPress();
         MenuSetInput(IntResult);
         break;
   }

   IntResult = UI_KP_GetPress();
   
   uartTx(IntResult);
   
   MenuSetInput(IntResult);   
   MenuUpdate();
   
   uartTxString_P( PSTR("SAY MY NAME"));
      
   /* Set the M-bit in the UI Register */
   UI_Activate();
   sei();
}









