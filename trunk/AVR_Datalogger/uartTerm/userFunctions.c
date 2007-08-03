#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/pgmspace.h>
#include <Util/delay.h>
#include <stdlib.h>
#include <string.h>

#include "main.h"

#include "SPI/spi.h"
#include "hardUart/hardUart.h"
#include "SampleCtrl/SampleCtrl.h"
#include "GainSensor/GainSensorFP.h"
#include "ADS1213/ads1213.h"
#include "DS1305/ds1305.h"
#include "RTC/RTCPrint.h"
#include "SD_MMC/sd.h"
#include "uartTerm/uartInput.h"
#include "Menu/Menu.h"
#include "UI_KP/UI_KP.h"
#include "UI_LCD/UI_LCD.h"
#include "MemMan/memman.h"
#include "TinyFS/tff.h"
#include "uartTerm/userFunctions.h"


static const uint8_t SC_RTC0_CONFIG[] = {0x80, 0x80, 0x80, 0x80};


/** These functions are accessed via the UART */

void Reset(void* data)
{
   asm volatile("jmp 0"::);
}

void GetResult(void* data)
{
   uint32_t lastestResult;
   
   lastestResult = ADS1213_GetResult();
   SensorCondition(lastestResult, gain);  
}

void ReadData(void* data)
{
   
   uint16_t i;
   uint8_t j;
   uint8_t  temp_time[3];
   MM_Read(0, MM_Buffer);
   
   /* need to read in the data sector by sector and
    * spit it out */
   
   for( i = 0; i < 512; i++)
   {
      uartTx(MM_Buffer[i]);
   }

   
   
//   for( i = 0; i < (512/3); i++)
//   {
//      RTC_ConvertTime(&MM_Buffer[3*i + 4], temp_time);
//	   for( j = HOURS; j <= HOURS; j--)
//	   {		
//		    printTIMEDATE(temp_time[j], ':');
//      }
//   }      

   
  
}

void GetTime(void* data)
{
   SPCR |= (1 << CPHA);
   DS1305_GetTime(DS1305_TimeDate_config);
   printTime(DS1305_TimeDate_config);
   uartNewLine();
   printDate(DS1305_TimeDate_config);
   uartNewLine();   
  
   _delay_ms(10);
   SD_Write( DS1305_TimeDate_config, 512 , 1);
   MMC_CS_PORT |= (1 << MMC_CS_PIN);    
   
}

void MMC_ReadTimeTest(void* data)
{
   
   uint8_t buffer[20];
   if( SD_Read( buffer, 512 , 1) == 0)
   {
      uartTxString("Read Success!");
        
   }
   else
   {
      uartTxString("Read Fail!");         
   }


   printTime(buffer);
   uartNewLine();
   printDate(buffer);            
   uartNewLine();
         
   MMC_CS_PORT |= (1 << MMC_CS_PIN);
   
}

void MMC_WriteTest(void* data)
{
   SD_Startup();
   uint32_t sector=0;
   uint8_t buffer[0x8] = {"Hello!"};
   
      
   if( SD_Write(buffer , 512, 1 ) == 0)
   {
      uartTxString("Write Success!");
        
   }
   else
   {
      uartTxString("Write Fail!");         
   }
   
   MMC_CS_PORT |= (1 << MMC_CS_PIN);
}

void ChannelUp(void* data)
{
   if( channel == 32 )
   {
      channel = 31;  
   }      
   channel = channel + 1;    
   GS_Channel(channel);
   //uartTx(channel);
}


void ChannelDown(void* data)
{
   if( channel == 1 )
   {
      channel = 2;  
   }      
   channel = channel - 1;    
   GS_Channel(channel);
   //uartTx(channel); 
}



void GainUp(void* data)
{
   if( gain == 9 )
   {
      gain = 8;  
   }      
   gain = gain + 1;
   GS_GainSel( pgm_read_byte( &GS_GAIN[gain])  );
   //uartTx(gain);
}

void GainDown(void* data)
{
   if( gain == 0 )
   {
      gain = 1;  
   }      
   gain = gain - 1;
   GS_GainSel( pgm_read_byte( &GS_GAIN[gain])  );
   //uartTx(gain);   
}


/* Prints out which channels are gains are selected */
void GS_Status(void* data)
{
   uint8_t outputString[11];
   uint8_t* input = (uint8_t*)data;
   int32_t signedData;
   uint32_t lastestResult;      
   
   if( firstEnter == 0 )
   {     
      switch( *input )
      {
         /* Channel Up */
         case 'q':
         case KP_A:
            ChannelUp(0);   
         break;
            
         /* Channel Down */  
         case 'a':                   
         case KP_B:
            ChannelDown(0);
         break;

        /* Gain Up */
        /// case 'w':
         case KP_2:
            GainUp(0);   
         break;
            
         /* Gain Down */  
         case 's':                   
         case KP_5:
            GainDown(0);
         break;         
         
         /* Print raw ADC number */
         case 'g':
         case KP_C:

            lastestResult = ADS1213_GetResult();             
          	signedData = uint24_tSign( (ADS1213Data_t) lastestResult );           
            
         break;
         
         /* Exiting function */
         case KB_BACK:
         case KP_BACK:
          
            MenuSetInput(KP_BACK);
            stateMachine(currentState);
            MenuSetInput(0);
            return;
            
            break;
               
         default:
         break;     
         
      }
   }

   MenuPrint_P( PSTR("Channel: ") );
   uint8toa(channel, outputString);
   MenuPrint(outputString);
   
   MenuNewLine();   

   MenuPrint_P( PSTR("Gain: ") );
   uint8toa(gain, outputString);
   MenuPrint(outputString);   
   MenuNewLine(); 


   ltoa(signedData, outputString, 10);    
   MenuPrint(outputString);         
   MenuNewLine();    
   
   firstEnter = 0;   
}

/** Function to setup each individual channel */
void ChannelSettings(void* data)
{
   uint8_t* input = 0;
   uint8_t outputString[21];
   static int8_t SelectedChannel = 0;
   static int8_t SelectedGain = 0;
   
   input = data;

   if( firstEnter == 0 )
   {      
      switch( *input )
      {
			case KB_UP:
         case KP_UP:
				if( ++SelectedChannel > (SENSOR_COUNT - 1) )
				{
					SelectedChannel = 0;	
				}       
         break;
         
			case KB_DOWN:
         case KP_DOWN:
				if( --SelectedChannel < 0 )
				{
					SelectedChannel = (SENSOR_COUNT - 1);	
				}       
         break;
         
         /* Setting Modifiers */
         case 'A':
         case KP_A:
				SensorToggle(SelectedChannel);
            break;
         
         case 'B':
         case KP_B:
         	SensorTypeToggle(SelectedChannel);
         	break;
         
         case 'C':
			case KP_C:
				SelectedGain = SensorGetGain(SelectedChannel);
				if( ++SelectedGain > (GAIN_COUNT - 1) )
				{
					SelectedGain = 0;
				}
				SensorSetGain( SelectedChannel, SelectedGain);				
				break;
         
         /* Menu Function exit routine */
         case KB_BACK:
         case KP_BACK:
          
            MenuSetInput(KP_BACK);
            stateMachine(currentState);
            MenuSetInput(0);
            return;
            
            break;
            
         default:
            break;
      }
      
   }
   
   firstEnter = 0;	
	
	/* Indicate the channel selected */
	uint8toa(SelectedChannel + 1, outputString);
	MenuPrint_P(PSTR("Channel: "));
	MenuPrint(outputString);          
   MenuNewLine();	
   
   /* Print the status */
	MenuPrint_P(PSTR("Status: "));   
	if( SensorGetState(SelectedChannel) == SENSOR_ON )
	{
		MenuPrint_P( PSTR("On") );
	}
	else
	{
		MenuPrint_P( PSTR("Off") );		
	}
	MenuNewLine();	

   /* Indicate the Channel Type */
	MenuPrint_P(PSTR("Input: "));   
	if( SensorGetType(SelectedChannel) == SENSOR_VOLTAGE )
	{
		MenuPrint_P( PSTR("Voltage") );
	}
	else
	{
		MenuPrint_P( PSTR("Temperature") );		
	}
	MenuNewLine();	   
	
	/* Display the channel 'gain' */
	uint8toa(SensorGetGain(SelectedChannel), outputString);
	MenuPrint_P(PSTR("Gain: "));
	MenuPrint(outputString);          
   MenuNewLine();
}


void BeginRecording(void* data)
{
	uint8_t outputString[10];
	uint8_t* input = (uint8_t*)data;
	
	MenuPrint_P( PSTR("Press A to update") );
	MenuNewLine();		
	MenuPrint_P( PSTR("Press C to stop") );

	
	
	if( firstEnter == 1)
	{
		/* Write file to SD Card */
		
		/* Take a sample */
		SC_Sample();
		
		/* Reset Timers */
		SC_INTLongDelay.timerCounter = 0;
		SC_MasterTimer.timerCounter = 0;
		
		/* Enable the correct timers */
		if( SC_GetMode() == SC_SAMPLE_EXTERNAL )
		{
			DS1305_AlarmControl(DS1305_RTC0, 1);
			DS1305_SetAlarm(SC_RTC0_CONFIG , DS1305_RTC0);
			SC_MasterTimer.timerEnable = TIMER_DISABLE;
			SC_INTLongDelay.timerEnable = TIMER_ENABLE;
		}
		else
		{
			SC_MasterTimer.timerEnable = 1;
			DS1305_AlarmControl(DS1305_RTC0, 0);
			SC_MasterTimer.timerEnable = TIMER_ENABLE;
			SC_INTLongDelay.timerEnable = TIMER_DISABLE;
		}
	}
	
	firstEnter = 0;

	switch( *input )
	{
		case KP_A:
			/* Print the number of samples and sample rate */
			MenuNewLine();
			MenuPrint_P( PSTR("Sample Count: ") );
			ultoa(SC_SampleCount, outputString, 10);
			MenuPrint(outputString);
			MenuNewLine();
			PrintSampleRate();
		break;
		
		case KP_C:
			/* Disable Timers */
			SC_MasterTimer.timerEnable = TIMER_DISABLE;
			SC_INTLongDelay.timerEnable = TIMER_DISABLE;
			
			/* Write rest of cached data */
			
			/* Go back up one menu */   
   		MenuSetInput(KB_BACK);
  			stateMachine(currentState);
  			MenuSetInput(0);
  			MenuReset();
  			executeState(currentState);
		break;
		
	}



}



#define SECONDS_MAX	59
#define MINUTES_MAX	59
#define HOURS_MAX		23

#define MKTIME_SECONDS 	0
#define MKTIME_MINUTES	1
#define MKTIME_HOURS 	2

#define MKTIME_CANCEL  0xFF
#define MKTIME_PENDING 0xFE
#define MKTIME_CONFIRMED 0xFD

void MenuSetTime(void* data)
{
	static int8_t newTime[MKTIME_HOURS+1];
	uint8_t returnVal;
	
	/* Get the time */
	if( firstEnter == 1)
	{
		DS1305_GetTime(DS1305_TimeDate_config);
		newTime[MKTIME_SECONDS] = BCD2DEC(DS1305_TimeDate_config[SECONDS]);
		newTime[MKTIME_MINUTES] = BCD2DEC(DS1305_TimeDate_config[MINUTES]);	
		newTime[MKTIME_HOURS] = BCD2DEC((DS1305_TimeDate_config[HOURS] & 0x3F));
	}
	firstEnter = 0;
	returnVal = MakeTime(data, newTime);
	
	switch( returnVal )
	{
		case MKTIME_CANCEL:
			/* Exit and cancel */
			UI_LCD_ClearCursor();
			MenuSetInput(KB_BACK);
   		stateMachine(currentState);
		break;			
			
		case MKTIME_PENDING:
			return;
		break;
			
		case MKTIME_CONFIRMED:
			/* Exit and save */
			DS1305_TimeDate_config[SECONDS] = DEC2BCD(newTime[MKTIME_SECONDS]);
			DS1305_TimeDate_config[MINUTES] = DEC2BCD(newTime[MKTIME_MINUTES]);
			DS1305_TimeDate_config[HOURS] = DEC2BCD(newTime[MKTIME_HOURS]) | (HOURS24 << 4);
						
			DS1305_SetTime(DS1305_TimeDate_config);
			
			
			UI_LCD_ClearCursor();			
			MenuSetInput(KB_BACK);
   		stateMachine(currentState);
			
		break;

		default:
		break;
	}
}


/** Allow the user to generate a time stamp based on user input */
uint8_t MakeTime(void* data, int8_t* timeComponent )
{
	
   uint8_t outputString[11];
   uint8_t buffer[4];
   uint8_t* input = (uint8_t*)data;
   int8_t i;
   
	const uint8_t timeLimits[MKTIME_HOURS+1] = {SECONDS_MAX, MINUTES_MAX, HOURS_MAX};
	/* Either SECONDS, MINUTE or HOUR */
	static int8_t selectedComponent;

   if( firstEnter == 0 )
   {     
      switch( *input )
      {
         /* Increment selected time */
         case 'q':
         case KP_A:
            ++timeComponent[selectedComponent];   
         break;
            
         /* Deccrement selected time */  
         case 'a':                   
         case KP_B:
            --timeComponent[selectedComponent]; 
         break;
  
         /* Time Component increment function */
         case KB_BACK:
         case KP_BACK:
				if( ++selectedComponent > MKTIME_HOURS )
				{
					selectedComponent = 	MKTIME_HOURS;
					return MKTIME_CANCEL;
				}

         break;
         
         /* Time Component decrement function and exit*/
         case KB_ENTER:
         case KP_ENTER:
         	if(--selectedComponent < 0)
         	{
					selectedComponent = 0;
				}
         break;
         
         case 'c':
         case KP_C:
               /* Return the time here */
               return MKTIME_CONFIRMED;
         break;
               
         default:
         break;     
      }
   }
   
   outputString[0] = 0;
   
   /* Ensure Seconds to Hours are within their limits */
   for( i = MKTIME_HOURS; i >= 0; i--)
   {
		if( timeComponent[i] > timeLimits[i] )
		{
			timeComponent[i] = 0;		
		}
		
		if( timeComponent[i] < 0 )
		{
			timeComponent[i] = timeLimits[i];
		}
		
		/* Write them to a string */
		uint8toa(timeComponent[i], buffer);
		
		if( timeComponent[i] < 10)
		{
			strcat( outputString, "0" );	
		}
						
		strcat( outputString, (const char*)buffer );
		strcat( outputString, ":" );
	}
	
   firstEnter = 0;
   
   /* Get rid of the last ':' */
   outputString[8] = 0;
   
   /* Enable Blinking Cursor */
   UI_LCD_SetCursor();
   
	/* Print instructions */
	MenuPrint_P( PSTR("Press 'C' to save") );
	MenuNewLine();
	MenuPrint_P( PSTR("24 Hour Mode") );	
	MenuNewLine();
	/* Move to centre of screen and print edited time */
	UI_LCD_Pos(2, 5);
	MenuPrint( outputString );
	   
   /* Set position of cursor to the editing component */
   UI_LCD_Pos(2, 12 - (3*selectedComponent) );
   
   

	return MKTIME_PENDING;
   
}


void SetSamplingRate(void* data)
{
	uint8_t* input = (uint8_t*)data;
	static uint8_t firstEnter = 1;
	
		
	if( firstEnter != 1 )
   {     
		stateMachine( currentState );
      switch( *input )
      {
			case KB_BACK:
			case KP_BACK:
				firstEnter = 1;
				return;
			break;
				
			case KB_ENTER:
			case KP_ENTER:
				MenuReset();
		   	executeState(currentState);
				firstEnter = 1;
				return;	
			break;

			default:
			break;
		}	
	}
	
	MenuReset();
	firstEnter = 0;
   PrintSampleRate();
   MenuNewLine(); 
}


void PrintSampleRate(void)
{
	uint8_t outputString[6];
	
	MenuPrint_P( PSTR("S. Rate: ") );	
   if( SC_GetMode() == SC_SAMPLE_INTERNAL)
   {
		uint8toa(SC_GetShortRate(), outputString);
		MenuPrint(outputString);
      MenuPrint_P( PSTR("0 ms"));
   }
   else
   {
		uint16toa(SC_GetLongRate(), outputString, 0);
		MenuPrint(outputString);
      MenuPrint_P( PSTR(" s"));      
   }
}

void SetShortRate(void* data)
{
	uint8_t* input = (uint8_t*)data;
	static uint8_t	tenMillisecDelay;
	uint8_t outputString[4];
	
	if( firstEnter == 1)
	{
		tenMillisecDelay = SC_GetShortRate();
	}
	
	
   if( firstEnter == 0 )
   {     
      switch( *input )
      {
         /* Increment msec delay */
         case 'q':
         case KP_A:
            ++tenMillisecDelay;   
         break;
            
         /* Deccrement msec delay */  
         case 'a':                   
         case KP_B:
            --tenMillisecDelay; 
         break;
  
         /* Time Component increment function */
         case KB_BACK:
         case KP_BACK:
				/* Go back up one menu */   
   			MenuSetInput(KB_BACK);
  				stateMachine(currentState);
  				MenuSetInput(0);
  				executeState(currentState);
  				return;
  				
         break;
                        
         default:
         break;     
      }
   }
   
   firstEnter = 0;
   
   MenuPrint_P( PSTR("Millisecond Delay:"));
	MenuNewLine();
	
	uint8toa( tenMillisecDelay, outputString);
	MenuPrint(outputString);
	MenuPrint_P( PSTR("0 milliseconds") );
	      
	SC_SetSamplingRate( tenMillisecDelay );

}

/* Instead of get time, it is get Alarm */
void SetLongRate(void* data)
{
	static int8_t newAlarm[DS1305_SIZEOFALARM];
	uint16_t totalDelay;
	uint8_t returnVal;
	
	/* Get the current alarm time */
	MenuReset();
	UI_LCD_Pos(3, 0);
	MenuPrint_P( PSTR("Max Delay: 18 Hours") );
	UI_LCD_Home();

	firstEnter = 0;
	returnVal = MakeTime(data, newAlarm);
	
	switch( returnVal )
	{
		case MKTIME_CANCEL:
			/* Exit and cancel */
			UI_LCD_ClearCursor();
			MenuSetInput(KB_BACK);
   		stateMachine(currentState);
			MenuSetInput(0);
			executeState(currentState);
		break;			
			
		case MKTIME_PENDING:
		break;
			
		case MKTIME_CONFIRMED:
			/* Exit and save */
			totalDelay = newAlarm[SECONDS] 
							 + newAlarm[MINUTES] * 60
							 + newAlarm[HOURS] * 3600;
			
			SC_SetSamplingRate_Long( totalDelay ); 
			UI_LCD_ClearCursor();			
			MenuSetInput(KB_BACK);
   		stateMachine(currentState);
			MenuSetInput(0);
  			executeState(currentState);
		break;

		default:
		break;
	}	
	
}

void MenuDisplayMode(void* data)
{
	uint8_t* input = (uint8_t*)data;
	static uint8_t firstEnter = 1;
	
	if( firstEnter != 1 )
   {     
		stateMachine( currentState );	
   	
      switch( *input )
      {
			case KB_BACK:
			case KP_BACK:
				firstEnter = 1;
				MenuReset();
				return;
			break;
				
			case KB_ENTER:
			case KP_ENTER:
		   	executeState(currentState);
				firstEnter = 1;	
			break;

			default:
			break;
		}	
	}
	
	firstEnter = 0;
   MenuPrint_P( PSTR("The current mode is:") );
   MenuNewLine();		
   if( uartMenu == MENU_LCD)
   {
      MenuPrint_P(MT_LCD_MODE);
   }
   else
   {
      MenuPrint_P(MT_UART_MODE);      
   }
   MenuNewLine();   
}

void MenuSetUartMode(void* data)
{
   /* Update the display mode */   
   MenuSetDisplay(MENU_UART);   
   uartMenu = MENU_UART;
   
   /* Go back up one menu */   
   MenuSetInput(KB_BACK);
   stateMachine(currentState);
}

void MenuSetLCDMode(void* data)
{
   /* Update the display mode */
   MenuSetDisplay(MENU_LCD);   
   uartMenu = MENU_LCD;
   /* Go back up one menu */
   MenuSetInput(KB_BACK); 
   stateMachine(currentState);
}

/* Read ADS1213 CMR */
void ADS1213_Status(void* data)
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



void MountSD(void* data)
{

	if( f_mount(0, &filesys) )
	{
		uartTxString_P( PSTR("Mount Failed!") );	
	}
}

static FIL hellotxt;

void OpenSD(void* data)
{

	if( f_open(&hellotxt, "hah.txt", FA_CREATE_ALWAYS | FA_WRITE) )
	{
		uartTxString_P( PSTR("Open Failed!") );	
	}
}

void CloseSD(void* data)
{
	if (f_close(&hellotxt) )
	{
		uartTxString_P( PSTR("Close Failed!") );			
	}
}

void WriteSD(void* data)
{
	uint8_t messageStr[] = "Hi David";
	uint16_t cnt;
	
	if( f_write(&hellotxt, messageStr, 9 , &cnt) )
	{
		uartTxString_P( PSTR("Write Failed!") );			
	}
}

void ReadSD(void* data)
{
	uint16_t cnt;
	uint32_t i;
	uint8_t buffer[129];
	uint16_t fileSize;

	if( f_open(&hellotxt, "hah.txt", FA_READ) )
	{
		uartTxString_P( PSTR("Open Failed!") );	
	}	
	fileSize = hellotxt.fsize;
	
	uartTxString_P( PSTR("File Size = ") );	
	uint16toa(fileSize, buffer, 0);
	uartTxString(buffer);
	
	for( i = 0; i < (uint16_t)(fileSize / 128); i++ )
	{
		//if(f_lseek(&hellotxt, i*128))
		//{
			//uartTxString_P( PSTR("End of File!") );		
		//}
			
		if( f_read(&hellotxt, buffer, 128, &cnt) )
		{
			uartTxString_P( PSTR("Read Failed!") );			
		}
		buffer[128] = 0;
		uartTxString(buffer);
	}

//	if(f_lseek(&hellotxt, i*128))
//	{
//			uartTxString_P( PSTR("End of File!") );		
//	}	
	
	
	if( f_read(&hellotxt, buffer, fileSize % 128, &cnt) )
	{
		uartTxString_P( PSTR("Read Failed!") );			
	}
	buffer[(fileSize % 128)] = 0;
	uartTxString(buffer);
	

}

void UnMountSD(void* data)
{
	f_mount(0, 0);
}
