

#include <avr/pgmspace.h>
#include "uartInput.h"
#include "userFunctions.h"
#include "hardUart/hardUart.h"
#include "main.h"



static const char uartReset[] PROGMEM = "Reset";

/* ADC Functions */
static const char uartADCInit[] PROGMEM = "Init ADC";
static const char uartADCStatus[] PROGMEM = "Status ADC";
static const char uartADCCalibP[] PROGMEM = "Calib ADC";
static const char uartADCReset[] PROGMEM = "Reset ADC";

/* Time Functions */
static const char uartGetResult[] PROGMEM = "Get Sample";
static const char uartGetSample[] PROGMEM = "G";
static const char uartGetTime[] PROGMEM = "Get Time";

static const char uartReadTime[] PROGMEM = "Read Time";
static const char uartTestMMCRead[] PROGMEM = "Read MMC";
static const char uartTestMMCWrite[] PROGMEM = "Write MMC";

static const char uartFAT16Mount[] PROGMEM = "Mount SD";
static const char uartFAT16UnMount[] PROGMEM = "Unmount";
static const char uartFAT16Open[] PROGMEM = "Open";
static const char uartFAT16Close[] PROGMEM = "Close";
static const char uartFAT16Write[] PROGMEM = "Write";
static const char uartFAT16Read[] PROGMEM = "Read";

static const char uartTestMenuUart[] PROGMEM = "Set UART";
static const char uartHelp[] PROGMEM = "Help";

/* Gain and Sensor Select */
static const char uartCHinc[] PROGMEM = "4";
static const char uartCHdec[] PROGMEM = "1";
static const char uartGaininc[] PROGMEM = "5";
static const char uartGaindec[] PROGMEM = "2";


static const UartCompare UartFunctions[] PROGMEM= { 
   {uartReset, 1, Reset},
   {uartGetResult, 1, GetResult},
   {uartGetSample, 1, GetResult},   
   {uartADCInit, 1, ADS1213_Init},
   {uartADCStatus, 1, ADS1213_Status},   
   {uartADCCalibP, 1, ADS1213_PsuedoCalib},
   {uartADCReset, 1, ADS1213_Reset},
   
   {uartTestMMCRead, 1, MMC_ReadTimeTest},
   {uartTestMMCWrite, 1, MMC_WriteTest},   
   {uartReadTime, 1, ReadData},
   
   {uartGetTime, 1, GetTime},
   {uartCHinc, 1, ChannelUp},
   {uartCHdec, 1, ChannelDown},   
   {uartGaininc, 1, GainUp},
   {uartGaindec, 1, GainDown},      
    
   {uartTestMenuUart, 1, MenuSetUartMode},       
   {uartHelp, 1, uartTermHelp}, 

   {uartFAT16UnMount, 1, UnMountSD},   
   {uartFAT16Mount, 1, MountSD},
   {uartFAT16Open, 1, OpenSD},
   {uartFAT16Close, 1, CloseSD},	   
   {uartFAT16Write, 1, WriteSD},
   {uartFAT16Read, 1, ReadRecording},   
   {0,0,0}
};






/** Returns a Uart Compare type given an address in PGM space */
UartCompare pgm_read_uartFunction(uint16_t* address_short)
{
   UartCompare returnUartFn;
   UartCompare* uartFnPtr;
   
   uartFnPtr = (UartCompare*)address_short;
 

   returnUartFn.compareString = pgm_read_word( &uartFnPtr->compareString );
   returnUartFn.activated     = pgm_read_byte( &uartFnPtr->activated );
   returnUartFn.function      = pgm_read_word( &uartFnPtr->function );        
        
   return returnUartFn;   
   
}

/** Receives input from the Uart, byte by byte and determines
 * the function to be called */
void switch_uart_input(uint8_t nextChar)
{
   static uint8_t charCounter = 0;
   static uint8_t inputBuffer[UART_COMPARE_MAX_LENGTH+1];
   
   /** Ensure the maximum input length is not exceeded */
   if( charCounter > UART_COMPARE_MAX_LENGTH)
   {
      charCounter = 0;   
   }
   
   
   inputBuffer[charCounter] = nextChar;
   /* *A compare is initiated once a new line char is received */
   if( nextChar == UART_LINEFEED || nextChar == UART_CARRIAGE_RETURN)
   {
      
      inputBuffer[charCounter] = UART_NULL;  
      charCounter = 0;
      
      branch_input(inputBuffer);
      return;
   }

   if( nextChar == UART_DELETE)
   {
      inputBuffer[charCounter] = UART_NULL;  
      
      if(charCounter == 0)
      {
         charCounter = 1;
      } 
      charCounter -= 1;
      return;
   } 

   charCounter++;
   

}
   
/** Looks through all the valid Uart Commands and tests against the input string
  */
void branch_input(uint8_t* inputStr)
{
   uint8_t i = 0;
   UartCompare compareUnit;
   
   compareUnit = pgm_read_uartFunction(&UartFunctions[i]);

   for( i = 0; 
        compareUnit.compareString; 
        (compareUnit = pgm_read_uartFunction(&UartFunctions[++i])))
   {
      
      
      if(!strcmp_P( (const char*)inputStr, (compareUnit.compareString)))
      {
         compareUnit.function(0);
         return;
      }
   }
   
   
   uartTxString_P( PSTR("Invalid Command!") );
   uartNewLine();
   uartTxString_P( PSTR("Type 'Help' for a list of commands") );   
   uartNewLine();   
}

void uartTermHelp(void)
{
   uint8_t i = 0;
   UartCompare compareUnit;   
   
   uartNewLine();
   uartTxString_P( PSTR("Valid Commands are:") );     
   
   compareUnit = pgm_read_uartFunction(&UartFunctions[i]);

   for( i = 0; 
        compareUnit.compareString; 
        (compareUnit = pgm_read_uartFunction(&UartFunctions[++i])))
   {
      
      uartNewLine();
      uartTxString_P(compareUnit.compareString);

   }   
}
