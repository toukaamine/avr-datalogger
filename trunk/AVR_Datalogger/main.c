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
#include "GainSensor/GainSensorFP.h"
#include "ADS1213/ads1213.h"


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




void printSample(void);

/* To do, MMC add #conditional includes
 * MAX7300 routines.
 */

int main(void)
{
   
   /* Good for 250kbit */
   uartInit(3, 1);
    


   UCSRB |= (1 << RXCIE);
   
	i2cInit(2 , 0);

   GS_Init(); 
   UI_Activate();    
   UI_KP_Init();  
   
   UI_LCD_HWInit();
   UI_LCD_Shutdown();
   _delay_ms(10);
       
   UI_LCD_Activate();    
   UI_LCD_Init();
      
   MenuSetDisplay(MENU_LCD);

   /* Enable Keypad Presses */
   UI_LCD_SetData();
   MCUCR |= (0x03 << ISC00);
   GICR |= (1 << INT0);
   
   /* Sample Control */
   SC_Init();
   SC_EnableTimer();
   
   /* Menu Setup */
   MenuSetInput(0);   
   /* Reprint Menu */   
   MenuUpdate();
   
   SPI_Init();


   sei();
   UI_SetRegister(MAX7300_CONFIG, (1 << MAX7300_SHUTDOWN_CONTROL) | (1 << MAX7300_TRANSITION_ENABLE));    
   
 
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

   static uint8_t rcvdByte = 0;
   static uint8_t lastInput = 0;
   static uint8_t uartMenu = 0;
   static uint8_t channel = 1;
   static uint8_t gain = 0;
   
   uint32_t lastestResult;
   rcvdByte = UDR;
   
   //UI_LCD_Char(rcvdByte);
   

   /* Update the menu if we are in UART mode */
   if( uartMenu )
   {
      MenuSetInput(rcvdByte);   
      MenuUpdate();  
   }
   
   if( rcvdByte == 'G' )
   {
     lastestResult = ADS1213_GetResult();
     SensorCondition(lastestResult, gain);
      
   }
   
   if( rcvdByte == 'W' )
   {
      ADS1213_Startup();  
   }
   
   if( rcvdByte == 'i' )
   {
      ADS1213_Init();  
   }
      
   if( rcvdByte == 'S')
   {
      ADS1213_Shutdown();  
   }
   
   if( rcvdByte == 'l')
   {
      MenuSetDisplay(MENU_LCD);
      uartMenu = 0;
      MenuUpdate(); 
   }   

   if( rcvdByte == 'u')
   {
      MenuSetDisplay(MENU_UART);
      uartMenu = 1;
      MenuUpdate();
   }   
   
   /* Dec Channel */
   if( rcvdByte == '1' )
   {      
      if( channel == 1                         )
      {
         channel = 2;  
      }      
      channel = channel - 1;    
      GS_Channel(channel);
      uartTx(channel);
   }   
      
   if( rcvdByte == '4' )
   {      
      if( channel == 32 )
      {
         channel = 31;  
      }      
      channel = channel + 1;    
      GS_Channel(channel);
      uartTx(channel);      
   } 
   
   /* Gain Selects */
   if( rcvdByte == '5' )
   {      
      if( gain == 9 )
      {
         gain = 8;  
      }      
      gain = gain + 1;
      GS_GainSel( pgm_read_byte( &GS_GAIN[gain])  );
      uartTx(gain);      
   }
   
   
   if( rcvdByte == '2' )
   {      
      if( gain == 0 )
      {
         gain = 1;  
      }      
      gain = gain - 1;
      GS_GainSel( pgm_read_byte( &GS_GAIN[gain])  );
      uartTx(gain);      
   }              
                       
      
      
   if( rcvdByte == 'q')
   {
      
      uartTx( UI_ReadRegister(MAX7300_CONFIG) );
      UI_SetRegister(MAX7300_CONFIG, (1 << MAX7300_SHUTDOWN_CONTROL) | (1 << MAX7300_TRANSITION_ENABLE));
   }      
   
   if( rcvdByte == 'R' )
   {
      asm volatile("jmp 0"::);
   }
   
   /* Read ADS1213 CMR */
   if( rcvdByte == 'r' )
   {
      
      uint8_t ADS1213Byte;
      
      /* Read 4 byte, that is 4 bytes of CMR */
      
      ADS1213_CS_PORT &= ~(1 << ADS1213_CS_PIN);   
      
      ADS1213_TxByte( (1 << ADS1213_RW) 
                      | (1 << ADS1213_A2) 
                      | (1 << ADS1213_MB0)
                      | (1 << ADS1213_MB1) );  
      
      ADS1213Byte = ADS1213_RxByte();
      uartTx(ADS1213Byte);
      ADS1213Byte = ADS1213_RxByte();
      uartTx(ADS1213Byte);
      ADS1213Byte = ADS1213_RxByte();
      uartTx(ADS1213Byte);
      ADS1213Byte = ADS1213_RxByte();
      uartTx(ADS1213Byte);                        
      ADS1213_CS_PORT |= (1 << ADS1213_CS_PIN);   
   }

   if( rcvdByte == 'p' )
   {
      ADS1213_PsuedoCalib();
   }
   
   
}





/* Counts number of SC_Compare_rate us. */
/* Perhaps use a faster FPU speed ? */
/* For 1MHZ With a presacler of 8, 125 == 1 msec so this is a 1msec counter */
/* For 8MHZ               "     32, 250 = 1 msec */
ISR(TIMER2_COMP_vect)
{
   cli();
   
   static uint8_t counter_ms;

/* Example */
/* Happens every 10 seconds, max seconds = 25.5secs  
 * Although we can use a uint16_t variable to obtain a 6502.5 sec max */
	static SoftTimer_8 ControlEvent = {5*SC_SECONDS, 0, 1};
	
   
   counter_ms++;
   
   if( counter_ms == 100*SC_MILLISECOND)
   {
		counter_ms = 0;
      ControlEvent.timerCounter++;
		
		/* Functions which occur every xx*100msecs happen here */
		if( ControlEvent.timerCounter == ControlEvent.timeCompare 
          && ControlEvent.timerEnable)
		{
			/* Do Control Event */
			//ADS1213_Init();
			//LCD_BL_PORT ^= (1 << LCD_BL_PIN);
			ControlEvent.timerCounter = 0;
			ControlEvent.timerEnable = 0;
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
         break;
   }

   IntResult = UI_KP_GetPress();
   
   if( IntResult == KP_D )
   {
      LCD_BL_PORT ^= (1 << LCD_BL_PIN);  
   }
   
   
   
   uartTx(IntResult);
   if( IntResult != KP_INVALID)
   {
      MenuSetInput(IntResult);   
      MenuUpdate();
   }
   /* Set the M-bit in the UI Register */
   UI_Activate();
   sei();
}









