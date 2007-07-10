/* Display Control Library for AVR Butterfly
 * Filename: lcdcontrol.h
 * Last modification : 31/05/06
 * Authors : Adrian Gin (amg94) and Jack Farley (jfa31)
 *
 * Description: Fuctions prototypes associated with controlling the 
 * LCD display on the ATMega169 AVR Butterfly development board.
 * 
 * All functions described are available for external use.
 *
 */

#define POSITION_OFFSET 2
/* Include the standard integer types*/
#include <stdint.h>
#include <avr/io.h>
#include <avr/iom169.h>


#include "lcdcontrol.h"
#include "lcdinternals.h"

#define    LCD_INITIAL_CONTRAST    (0x12)


#define    LCD_DUTY_STATIC        (0x00)
#define    LCD_DUTY2        	  (0x01)
#define    LCD_DUTY3        (0x02)
#define    LCD_DUTY4         (0x03)

#define    LCD_ALL_SEGMENTS    (0x07)

#define    LCD_CLOCK_DIVIDE(x)    ((x)+0x01)

#define LCD_CLOCK_PRESCALER_16        (0x00)
#define LCD_CLOCK_PRESCALER_64        (0x01)
#define LCD_CLOCK_PRESCALER_128        (0x02)
#define LCD_CLOCK_PRESCALER_256        (0x03)
#define LCD_CLOCK_PRESCALER_512        (0x04)
#define LCD_CLOCK_PRESCALER_1024    (0x05)
#define LCD_CLOCK_PRESCALER_2048    (0x06)
#define LCD_CLOCK_PRESCALER_4096    (0x07)


/* A device specific macro (for the ATmega169) to set contrast of the lcd screen  
 * on a scale from 0 to 15, where 15 is the highest level of contrast. 
 * Macro copied from LCD_Driver.h Created by AMTEL Norway.
 */
#define LCD_CONTRAST_LEVEL(level) LCDCCR=(0x0F & level)

/* The maximum length of a string that can be passed to these function is
 * 254 characters (including the NULL character)
 */ 
#define MAX_STRING_LENGTH 254



/* void lcd_init(void)
* Sets up the LCD display for use and clears the 6 alphanumeric characters
* on the LCD display.
* The function also initialises the display strings as null pointers.
* This function must be called before any other function in our library
* is used.
*/  
void lcd_init(void)    {


   LCD_CONTRAST_LEVEL(LCD_INITIAL_CONTRAST);    //Set the LCD contrast level

   /* For a frame rate of 32Hz, set
    * LCDclk         = 32.768kHz
    * LCDPrescaler     = 16
    * LCDClockDivide    = 8
    * LCDDuty        = 1/4
    */

   /* Select the external 32.768kHz crystal as the LCD clock source, enable all COM pins and enable all
    * segment pins.
    */
   LCDCRB = (1<<LCDCS) | ((LCD_DUTY4)<<LCDMUX0) | ((LCD_ALL_SEGMENTS)<<LCDPM0);

   LCDFRR = (LCD_CLOCK_PRESCALER_16<<LCDPS0) | (LCD_CLOCK_DIVIDE(8)<<LCDCD0);   
   LCDCRA = (1<<LCDEN) | (1<<LCDAB);           // Enable LCD and set low power waveform

#if 0
   //Enable LCD start of frame interrupt
   LCDCRA |= (1<<LCDIE);
#endif

   /*lcd_clear();                   // Clear segment buffer.*/
} 


/* void lcd_clear(void) 
 * Clears the 6 alphanumeric characters on the lcd screen so that they are 
 * all blank.
 */
void lcd_clear(void);

#define	IS_ODD	(0x01)
// DEVICE SPECIFIC!!! (ATmega169)
#define pLCDREG ((uint8_t*)(0xEC))

#define	LCD_DATA_REGISTERS_PER_DIGIT (4)



/* void lcd_dislay_char(char c, uint8_t position) 
 * Displays the character given in 'c' at the position (2 < 'position' < 7) on
 * the lcd screen.
 */
 
/* This code was obtained from LCD_driver.c from ATMEL Norway provided
 * from the Butterfly Rev 06 demonstation code.
 */ 
void lcd_dislay_char(char c, uint8_t position) {
	uint16_t scc = 0;
	uint8_t mask, nibble;
	uint8_t *LCD_Datareg;
	uint8_t i = 0;
	
	uint8_t digit = position - POSITION_OFFSET;
	
	
	// Check position isn't toggled off and that digit position is legal.
	if (set_toggle_values(position, READ) && (digit < LCD_WIDTH)) {
	
		// Convert char to SCC code
		scc = char_to_scc(c);
		
		// Change mask odd/even position
		if (digit & IS_ODD) {
			mask = 0x0F; // Odd position
		} else {
			mask = 0xF0; // Even position
		}
		
		// Get address of starting LCD Data register
		LCD_Datareg = pLCDREG + (digit >> 1);
		
		/* Put nibbles (corresponding to characters) 
		 * into the LCD Data registers
		 */
		for (i = 0; i < LCD_DATA_REGISTERS_PER_DIGIT; i++) 
		{
			nibble = scc & 0x000F;
			scc = (scc >> 4);
			
			/* If the digit is in an odd position (3,5 or 7) move the nibble to the
			 * four most significant bits in the LCD Data register.
			 */
			if (digit & IS_ODD) 
			{
				nibble = (nibble << 4);
			}
			
			*LCD_Datareg = (*LCD_Datareg & mask) | nibble;
			/* Move to the next LCD Data register corresponding to the
			 * LCD digit position.
			 */
			LCD_Datareg += 5;			
		}
	}
}





/* void lcd_display_string(char *str)
 * Loads the passed string into temporary memory and displays the first 6
 * characters of the string on the lcd.
 */ 
void lcd_display_string(char *str);


/* uint8_t lcd_load_strings(char *string1, char *string2) 
 * Makes a copy of the two strings pointed to by 'string1' and 'string2' into
 * memory and then displays the first 6 characters of the string pointed to 
 * by 'string1' on the lcd.
 * A one (1) is returned if both strings are successfully copied. Otherwise
 * a zero (0) will be returned to indicate an unsuccessful copy.  
 */  
uint8_t lcd_load_strings(char *string1, char *string2); 


/* uint8_t lcd_toggle_string(void) 
 * Toggles between the two stored strings initialised by lcd_load_strings. 
 * If both the loaded strings are null pointers, lcd_toggle_string() will have
 * no effect. If only one string has been loaded, lcd_toggle_string will 
 * display the loaded string. lcd_toggle_string always resets the string offset
 * (first 6 characters visible). 
 * The index of the displayed string after the toggle is returned. 
 */
uint8_t lcd_toggle_string(void);







