

#include <Util/delay.h>
#include "UI/UI.h"
#include "MAX7300/max7300.h"
#include "i2c/i2c.h"
#include "pwm/pwm.h"
#include "UI_LCD.h"
#include "MSB2LSB/MSB2LSB.h"

/* Need to provide protection so that data lines are never high when
 * the LCD is in shutdown */

static uint8_t UI_LCD_PowerStatus = LCD_OFF;
static uint8_t UI_LCD_RSStatus = UI_LCD_INSTRUCTION;
/* Use a wrapper for the UI_MAX7300 interface to ensure LCD_Power is enabled
 * if any write commands are used */
void UI_LCD_SetRegister(uint8_t reg, uint8_t data)
{
   if( UI_LCD_PowerStatus == LCD_ON )
   {

      
      if( reg == UI_LCD_PORT )
      {
         data = MSB2LSB(data) >> 4;         
         data &= ~(1 << UI_LCD_PRS);
         data |= (1 << UI_LCD_PPOWER) | (UI_LCD_RSStatus << UI_LCD_PRS); 
      }
      
      UI_SetRegister(reg, data);   
   }
}


/* Internal Functions */


void UI_LCD_SetInstruction(void)
{
   UI_LCD_RSStatus = UI_LCD_INSTRUCTION;
}
   



void UI_LCD_SetData(void)
{
   UI_LCD_RSStatus = UI_LCD_DATA;  
}


/* Setup all of the UI_MAX7300 LCD Pins as an Output */
void UI_LCD_HWInit(void)
{
   /* All ports are by default inputs with no pullups */

   /* When setting ports up as outputs, they must not be high otherwise
    * the LCD Pins will be powering the LCD (BAD!) */
   
   /* Set all LCD Pins to inputs except for LCD_ENABLE */
	UI_LCD_SetRegister(MAX7300_DDRB1, 0x9A);
        

   /* Apply LCD Power */
	UI_LCD_SetRegister(UI_LCD_POWER, 0x01);
   
 

	/* Set all UI_LCD pins to outputs */
	i2cAddress(UI_MAX7300_ADDRESS, TW_WRITE);	
	i2cTransmit(MAX7300_DDRA1);
	/* UI_LCD Pins P12 - P15 as Outputs */
	i2cTransmit(0x55);
	
	/* UI_LCD pins P16-P18 to Outputs leave P19 as Input*/
	i2cTransmit(0x95);
   i2cStop();

   /* Set UI_LCD pins to to output LOW */
	UI_LCD_SetRegister(UI_LCD_PORT, 0x00);   

}



/* Assumes 4-bit Mode */
void UI_LCD_Write(uint8_t code)
{
	UI_LCD_SetRegister(UI_LCD_PORT, (code >> 4) & (0x0F) );
   UI_LCD_Strobe();
	UI_LCD_SetRegister(UI_LCD_PORT, (code) & (0x0F) );   
   UI_LCD_Strobe();
}




void UI_LCD_Strobe(void)
{  
	UI_LCD_SetRegister(UI_LCD_E, 0x01); 
   _delay_ms(2);   
	UI_LCD_SetRegister(UI_LCD_E, 0x00);    
}

/* Clears the screen, sets up the LCD to accept commands */
void UI_LCD_Init(void)
{

   UI_LCD_SetInstruction();


   /* Init to use 4 bit mode */
   UI_LCD_SetRegister(UI_LCD_PORT, (LCD_FUNCTION_DEFAULT >> 4) & (0x0F) );
   UI_LCD_Strobe();
   _delay_ms(10);         
   UI_LCD_Write( LCD_FUNCTION_DEFAULT );
   _delay_ms(4);   
   UI_LCD_Write( LCD_DISPLAY_DEFAULT );
   _delay_ms(2);   
   UI_LCD_Write( LCD_MODE_DEFAULT );   
 
  
   UI_LCD_Clear();
   _delay_ms(2);    
   UI_LCD_Home();
   _delay_ms(2);    
}




/* Public Functions */
void UI_LCD_Home(void)
{
   UI_LCD_SetInstruction();   
   UI_LCD_Write( (1 << LCD_HOME ) );   
}


void UI_LCD_Clear(void)
{
   UI_LCD_SetInstruction();   
   UI_LCD_Write( (1 << LCD_CLR ) );
}


/* Prints a character to the LCD at the current position */

/*
void UI_LCD_Char(uint8_t data)
{
   UI_LCD_Write(data);
}
*/


/* Prints a string to the LCD at the current position 
 * If the line overflows, the data continues to the next address */
void UI_LCD_String(uint8_t* string)
{
   UI_LCD_SetData();
   
   while( *string )
   {
      UI_LCD_Write(*string++);      
   }
}

/* New Lines are done by using UI_LCD_Pos( row+1, 0); function */

/* Prints a string to the LCD at the current position 
 * If the line overflows, the data continues to the next address */
void UI_LCD_String_P(const char* string_P)
{

   uint8_t c;
   UI_LCD_SetData();
   
   while( (c = pgm_read_byte(string_P++)) )
   {
      UI_LCD_Write(c);
   }   
}


/* Max Row is 3 and Max Col is 0 -> 19 (Dec) */
void UI_LCD_Pos(uint8_t row, uint8_t col)
{
   uint8_t DDRAMAddr;
   
   UI_LCD_SetInstruction();   
   
	// remap lines into proper order
	switch(row)
	{
	  case 0: DDRAMAddr = LCD_LINE0_DDRAMADDR + col; break;
	  case 1: DDRAMAddr = LCD_LINE1_DDRAMADDR + col; break;
	  case 2: DDRAMAddr = LCD_LINE2_DDRAMADDR + col; break;
	  case 3: DDRAMAddr = LCD_LINE3_DDRAMADDR + col; break;
	  default: DDRAMAddr = LCD_LINE0_DDRAMADDR + col;
	}

	// set data address
	UI_LCD_Write(1<<LCD_DDRAM | DDRAMAddr);

}


void UI_LCD_Activate(void)
{

   UI_LCD_PowerStatus = LCD_ON;

   /* Set UI_LCD pins to to output LOW except for LCD Power which is high*/
	UI_SetRegister(UI_LCD_POWER, 0x01);    
   
   
   /* Need to wait 40ms after applying power */
   _delay_ms(40);
   
}




void UI_LCD_Shutdown(void)
{

   /* Set UI_LCD pins to to output LOW */
	UI_SetRegister(UI_LCD_PORT, 0x00);   
   UI_SetRegister(UI_LCD_POWER, 0x00); 
   UI_LCD_PowerStatus = LCD_OFF;
}
   
   
/* Back light control don't need to use PWM, use the 16-bit timer for
 * something more useful
 */
void UI_LCD_BL_On(void)
{
   
   uint8_t  dutyCycle;
   
   pwmTimer1Initialise(255, 1);
   
   for( dutyCycle = 0; dutyCycle < 255; dutyCycle++ )
   {
      pwmTimer1AEnable(dutyCycle);
      _delay_ms(20);      
   } 
   

   pwmTimer1ADisable();
   PORTD |= (1 << PD5);

}

void UI_LCD_BL_Off(void)
{
   
   uint8_t  dutyCycle;   
   
   pwmTimer1Initialise(255, 1);
   for( dutyCycle = 255; dutyCycle != 0; dutyCycle-- )
   {
      pwmTimer1AEnable(dutyCycle);
      _delay_ms(20);      
   } 
   
   pwmTimer1ADisable();   
   PORTD &= ~(1 << PD5);   
}




