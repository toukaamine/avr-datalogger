#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/pgmspace.h>
#include <Util/delay.h>
#include <stdlib.h>

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
#include "MemMan/memman.h"
#include "TinyFS/tff.h"

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


void SetSamplingRate(void* data)
{
	
	
	MenuPrint_P( PSTR("Samp. Rate: ") );
   
	
	MenuNewLine();
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


void SetPrimarySamplingRate(void* data)
{
		
	
}

void MenuDisplayMode(void* data)
{
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
   /* Update the menu again */   
   MenuReset();
   executeState(currentState);   

}

void MenuSetLCDMode(void* data)
{
   /* Update the display mode */
   MenuSetDisplay(MENU_LCD);   
   uartMenu = MENU_LCD;
   /* Go back up one menu */
   MenuSetInput(KB_BACK); 
   stateMachine(currentState);
   /* Update the menu again */
   MenuReset();
   executeState(currentState); 

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

FATFS filesys;

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
	uint8_t buffer[10];
	if( f_read(&hellotxt, buffer, 8, &cnt) )
	{
		uartTxString_P( PSTR("Read Failed!") );			
	}
	
	uartTxString(buffer);
}

void UnMountSD(void* data)
{
	f_mount(0, 0);
}
