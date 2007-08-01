/* For delays larger than 'x' msecs, use the RTC Timer 1 */
/* The other RTC Timer 0 will be used for alarms (multiple timers can be used 
 * through software */
 
/* When the RTC is being used to sample, Timer2 Compare interrupt is disabled */
/* SC_DisableTimer is called */

/* Have all interrupts in the main function */

/* Sets up the required timers etc */


#include <avr/io.h>
#include <stdlib.h>
#include <util/delay.h>

#include "SampleCtrl.h"
#include "GainSensor/GainSensorFP.h"
#include "hardUart/hardUart.h"
#include "RTC/RTCPrint.h"

/* Disable Sampling Timer */
SoftTimer_8	SC_MasterTimer = {0,0,0};
uint8_t SampleMode;
static uint8_t SC_RTC_Alarm[3];

void SC_Init(void)
{
   /* The primary sample timer will use the 8-bit Timer 2 */
   /* Use CTC Mode and clock at FCPU / 32  */
   TCCR2 = (1 << WGM21) | (1<< CS21) | (1<< CS20);    
   /* Set Compare mode to 250 so a compare occurs every 250us */
   OCR2 = SC_COMPARE_RATE;
   TCNT2 = 0x00;
}


/** Samples the Activated Channels with their respective gains 
 * and then writes them to memory */
void SC_Sample(void)
{
   uint8_t i;
   uint8_t chGain;
   static uint32_t ADCValue;
   float32_t sample;
   uint8_t outputString[10];

   for( i = 0; i < SENSOR_COUNT; i++)
   {
      if( SensorGetState(i) )
      {
         /*
         uartNewLine();         
         uartTxString_P( PSTR("Channel: ") );
         uint8toa(i, outputString);
         uartTxString( outputString );
         uartNewLine(); */
         
         /* Set the channel */
         GS_Channel( i + 1 );
         
         /** Get the corresponding CH Gain and set it */
         chGain = SensorGetGain(i);
         GS_GainSel( pgm_read_byte( &GS_GAIN[chGain]) );
         
         /** Condition the data from the ADC */
         ADCValue = ADS1213_GetResult();
         
         if( ADCValue != ADS1213_BUSY )
         {
            sample = SensorCondition(ADCValue, chGain); 

            /* Debugging */
            uint8toa(i , outputString);
				uartTxString_P("Channel: ");
				uartNewLine();
				uartTxString(outputString);
				uartNewLine();       
            printFloat(sample.FP);
            uartNewLine();   
         }
         /* End of Debugging */
         
         /** Write data to buffer */
      }  
   }   
}

/* Valid up to 2 seconds */
void SC_SetSamplingRate(uint8_t tensMilliseconds)
{
	
	SC_MasterTimer.timeCompare = tensMilliseconds;
	SC_MasterTimer.timerEnable = TIMER_ENABLE;	
}

/* This function uses the RTC to provide sampling interrupts */
void SC_SetSamplingRate_Long(uint8_t seconds, uint8_t minutes, uint8_t hours)
{
	SC_MasterTimer.timerEnable = TIMER_DISABLE;
	SC_RTC_Alarm[SECONDS] = seconds;
	SC_RTC_Alarm[MINUTES] = minutes;	
	SC_RTC_Alarm[HOURS] = hours;	
}
