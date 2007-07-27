/* DS1305 Routines for the ATMEGA Micro
 * Author: Adrian Gin
 * Date: 27/06/07
 *
 * Code based off the DS1307 RTC Module.
 */

#include <Util/delay.h>
#include <avr/io.h>
#include "ds1305.h"
#include "SPI/spi.h"
#include "RTC/RTCPrint.h"

/* To do: Write a function which updates the time
 * Provide Alarm setting and re-setting functions. **Not Prio**
 *
 */

uint8_t DS1305_TimeDate_config[] =       {BCD_SECONDS, 
												   	BCD_MINUTES,
														((BCD_HOURS) | (HOURS24)),
														(((BCD_DAY+6)%7)+1),
												  		BCD_DATE,
												  		BCD_MONTH+1,
												  		BCD_YEAR};		
 
 
/* Need to enable oscillator */
void DS1305_Init(void)
{
   /* Set Chip Select as Output */
   DS1305_CE_DDR |= (1 << DS1305_CE_PIN);

   /* Enable Chip */
   DS1305_CE_PORT |= (1 << DS1305_CE_PIN);
   _delay_us(11);   
   
   SPI_RxByte();
   /* Set the control registers */
   /* Disable the WP */
   DS1305_WriteByte( DS1305_CTRL, 0 );
   
   /* Enable the Oscillator and Interrupt */
   DS1305_WriteByte( DS1305_CTRL, 
                     (1 << DS1305_INTCN));   

   
   /* Release Chip */
   DS1305_CE_PORT &= ~(1 << DS1305_CE_PIN);
   _delay_us(11); 
}



void DS1305_SetTime(uint8_t* DS1305_config)
{
   /* Enable Chip */
   DS1305_CE_PORT |= (1 << DS1305_CE_PIN);
   _delay_us(11); 
  
   SPI_TxByte( DS1305_SECS | (1 << DS1305_RW) );
   SPI_TxBlock(DS1305_config , 7);
   
   /* Release Chip */
   DS1305_CE_PORT &= ~(1 << DS1305_CE_PIN);
   _delay_us(11); 
}


/* getTime:
 * Obtain the time and date data from the DS1305
 * The data is to be stored in time.
 * Where time[] = {SECONDS,
 *						 MINUTES,
 *						 HOURS,
 *						 DAY,
 *						 DATE,
 *						 MONTH,
 * 					 YEAR};
 */
void DS1305_GetTime(uint8_t* time)
{
	/* Enable Chip */
   DS1305_CE_PORT |= (1 << DS1305_CE_PIN);
   _delay_loop_1(11);   
  
   SPI_TxByte( DS1305_SECS );
   SPI_RxBlock(time , 7);
   
   /* Release Chip */
   DS1305_CE_PORT &= ~(1 << DS1305_CE_PIN);
   _delay_loop_1(11); 
}


/* Transfers the data to address */
void DS1305_WriteByte(uint8_t address, uint8_t data)
{
   /* Enable Chip */
   DS1305_CE_PORT |= (1 << DS1305_CE_PIN);
   _delay_loop_1(11);
   
   SPI_TxByte( address | (1 << DS1305_RW) );
   SPI_TxByte( data );   
 
   /* Release Chip */
   DS1305_CE_PORT &= ~(1 << DS1305_CE_PIN);
   _delay_loop_1(11); 
}

/* Reads the data from address */
uint8_t DS1305_ReadByte(uint8_t address)
{
   uint8_t returnVal;
   /* Enable Chip */
   DS1305_CE_PORT |= (1 << DS1305_CE_PIN);
   _delay_loop_1(11);
   
   SPI_TxByte( address );
   returnVal = SPI_RxByte();   
 
   /* Release Chip */
   DS1305_CE_PORT &= ~(1 << DS1305_CE_PIN);
   _delay_loop_1(11);
   
   return returnVal;
    
}
   
