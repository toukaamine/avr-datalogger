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
#include "DS1305/ds1305.h"
#include "RTC/RTCPrint.h"
#include "SD_MMC/sd.h"
#include "uartTerm/uartInput.h"
#include "MemMan/memman.h"

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
uint8_t channel = 1;
uint8_t gain = 0;
uint8_t uartMenu = 0;
FATFS filesys;


void printSample(void);
void Channel_Setup(void);

/* To do, MMC add #conditional includes
 * MAX7300 routines.
 */
int main(void)
{
 
   
   /* Wait for power to resume */
   for( uint8_t i = 0; i < 32; i++)
   {
      _delay_ms(30);
   }    
   
   /* Good for 250kbit */
   uartInit(0, 1);
    
   //SD_Shutdown();

   UCSRB |= (1 << RXCIE);
   
	i2cInit(3 , 0);

   GS_Init(); 

   UI_Activate();    
   UI_KP_Init();
      
   UI_LCD_HWInit();
   UI_LCD_Shutdown();
   _delay_ms(10);
       
   UI_LCD_Activate();    
   UI_LCD_Init();
      
   MenuSetDisplay(MENU_LCD);

   /* Enable Keypad Presses Disable INT0 and use INT2 */
   UI_LCD_SetData();
   DDRB &= ~(1 << PB2);
   MCUCSR |= (1 << ISC2);
   GICR |= (1 << INT2);
   
   /* Sample Control */
   SC_Init();
   SC_EnableTimer();
   
   /* Menu Setup */
   MenuSetInput(0);   
   /* Reprint Menu */   
   MenuUpdate();
   
   /* Set speed to 500kHz */
   SPI_Init();


   /* Setup ADC, perform offset calibration */
   ADS1213_Init();
   GS_Channel(3);
//   GS_GainSel( pgm_read_byte( &GS_GAIN[GAIN01X]) );
//   ADS1213_PsuedoCalib();
   
   GS_GainSel( pgm_read_byte( &GS_GAIN[GAIN01X]) );
   ADS1213_PsuedoCalib();   

   
	/* Write to the DS1305 The time and date */
	/* Max frequency is 600kHz */
   DS1305_Init();
   DS1305_SetTime(DS1305_TimeDate_config);

   UI_SetRegister(MAX7300_CONFIG, (1 << MAX7300_SHUTDOWN_CONTROL) | (1 << MAX7300_TRANSITION_ENABLE));    
 
 
   /** Initialise SD Card */
   if( SD_Init() == SD_SUCCESS )
   {
      /* Mount the drive */
      f_mount(0, &filesys);		
      uartTxString_P( PSTR("SD Card Initialised!") );

      
   }
   else
   {
      uartTxString_P( PSTR("SD Card Failed!") ); 
      MMC_CS_PORT |= (1 << MMC_CS_PIN);     
   }
  

   
   MM_CreateRecording(0);
   Channel_Setup();
   sei();

 
   while(1)
   {
      /* Need to reset Interrupt */     
      set_sleep_mode(SLEEP_MODE_IDLE);
      sleep_enable();
      sleep_cpu();
      sleep_disable();
      sei();
   }
   
   return 0;  
   
}


/* To echo the receiver buffer*/
ISR(SIG_UART_RECV)
{
   cli();
   uint8_t rcvdByte = 0;
   
   rcvdByte = UDR;

   /* Update the menu if we are in UART mode */
   if( uartMenu )
   {
      MenuSetInput(rcvdByte);   
      MenuUpdate();  
   }
   
   /* Use the UART Terminal Interface */
   
   else
   {
      switch_uart_input(rcvdByte);
      return; 
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
	
	/* Restart after 2 seconds */
	static SoftTimer_16 RestartEvent = {10000, 0, 1};
		
   float32_t conditionedResult;
   static uint32_t SD_Sector = 0;
   
   counter_ms++;   
   
   if( counter_ms == 10*SC_MILLISECOND)
   {
		counter_ms = 0;
		
		/* Clock the Master Timer at a 10ms Resolution */
      RestartEvent.timerCounter++;	
   	SC_MasterTimer.timerCounter++;   	
   	
		/* Functions which occur every xx*10msecs happen here */
		if( SC_MasterTimer.timerCounter == SC_MasterTimer.timeCompare 
          && SC_MasterTimer.timerEnable)
		{
			/* Take a sample */
         SC_Sample();
         /* Reset the timer */
			SC_MasterTimer.timerCounter = 0;
		}
		
      if( RestartEvent.timerCounter == RestartEvent.timeCompare 
          && RestartEvent.timerEnable)
      {
         uartTxString("STOP THE CLOCK!!!");
         SC_MasterTimer.timerEnable = 0;  
      }	
		
      
   } 
   
   /* Functions occuring between 1 to 99msecs occur here */
//   uint32_t lastestResult;
//
//         uint8_t temp_time[3];
//         static uint16_t sampleCnt = 0;
//         uint8_t i;
//         uint8_t outputString[10];
//      
//         if( sampleCnt < 512 )
//         {
//            /* Update the time */
//            DS1305_GetTime( DS1305_TimeDate_config );
//            RTC_ConvertTime(DS1305_TimeDate_config, temp_time);
//            
//            for( i = SECONDS; i <= HOURS; i++)
//            {
//               MM_Write( temp_time[i] );                  
//               uartTxString_P( PSTR("Sample #:") );            
//               uint16toa(sampleCnt, outputString, 0);
//               uartTxString(outputString);
//               uartNewLine();
//               sampleCnt++;                    
//            }
//         }		


		  
}



/* This is used to parse the KP inputs and RTC inputs */
/* It is important to handle RTC inputs first */
ISR(INT2_vect)
{

   /* Should have a debounce counter... */
   cli();

   uint8_t IntResult;
	uint8_t outputString[4];
	 
   IntResult = ~(UI_ReadRegister(MAX7300_PORTINT) >> UI_RTC_INT0) & (0x03); 
   /* Need to reset Interrupt */   
   UI_SetRegister(UI_INTERRUPT, 0);   
   UI_SetRegister(MAX7300_CONFIG, (1 << MAX7300_SHUTDOWN_CONTROL));
   

   /* Check for RTC interrupt */
   switch( IntResult )
   {
      /* RTC_INT0 Triggered */
      case 1:
         /* INT0 Handler */
         /* Reset the RTC0 IRQ Flag */
         DS1305_ReadByte(DS1305_A0_SECS);
         uartTxString((uint8_t*)"RTC INT0 Triggered!");
         uint16toa( SC_INTLongDelay.timerCounter, outputString, 0);
         uartTxString(outputString);
         
         if( (SC_INTLongDelay.timerEnable && 
				 ++SC_INTLongDelay.timerCounter == SC_INTLongDelay.timeCompare))
         {
				/* Take a sample */
				SC_Sample();
				SC_INTLongDelay.timerCounter = 0;				
			}
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
         break;
   }


   /* Set the M-bit in the UI Register */
   UI_Activate();
   sei();
}


void Channel_Setup(void)
{
//   SensorOn(2); // DC Voltages
   SensorOn(1); // Sine Wave
//   SensorOn(2); // SHORT
//   SensorOn(3); // OPEN
   
   SensorSetGain(0, GAIN01X);
   SensorSetGain(1, GAIN5X);
   SensorSetGain(2, GAIN01X);      
   SensorSetGain(3, GAIN05X);
   
}





