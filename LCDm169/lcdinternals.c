/* Display Control Library for AVR Butterfly
 * Filename: lcdinternals.c
 * Last modification : 27/06/06
 * Authors : Adrian Gin (amg94) and Jack Farley (jfa31)
 *
 * Description: Contains the functions which are called by the LCD Control library
 * functions (implemented in lcdcontrol.c).
 *
 * All functions described are not to be called by any user written function.
 *
 */
 
#include <stdlib.h>
#include <string.h>
#include <stdint.h> 

#include <avr/io.h>
#include <avr/iom169.h>
 
#include "lcdinternals.h"
#include "lcdcontrol.h"

// Look-up table used when converting ASCII to
// LCD display data (segment control)
const uint16_t LCD_character_table[] =
{
    0x0A51,     // '*' (?)
    0x2A80,     // '+'
    0x0000,     // ',' (Not defined)
    0x0A00,     // '-'
    0x0A51,     // '.' Degree sign
    0x0000,     // '/' (Not defined)
    0x5559,     // '0'
    0x0118,     // '1'
    0x1e11,     // '2
    0x1b11,     // '3
    0x0b50,     // '4
    0x1b41,     // '5
    0x1f41,     // '6
    0x0111,     // '7
    0x1f51,     // '8
    0x1b51,     // '9'
    0x0000,     // ':' (Not defined)
    0x0000,     // ';' (Not defined)
    0x0000,     // '<' (Not defined)
    0x0000,     // '=' (Not defined)
    0x0000,     // '>' (Not defined)
    0x0000,     // '?' (Not defined)
    0x0000,     // '@' (Not defined)
    0x0f51,     // 'A' (+ 'a')
    0x3991,     // 'B' (+ 'b')
    0x1441,     // 'C' (+ 'c')
    0x3191,     // 'D' (+ 'd')
    0x1e41,     // 'E' (+ 'e')
    0x0e41,     // 'F' (+ 'f')
    0x1d41,     // 'G' (+ 'g')
    0x0f50,     // 'H' (+ 'h')
    0x2080,     // 'I' (+ 'i')
    0x1510,     // 'J' (+ 'j')
    0x8648,     // 'K' (+ 'k')
    0x1440,     // 'L' (+ 'l')
    0x0578,     // 'M' (+ 'm')
    0x8570,     // 'N' (+ 'n')
    0x1551,     // 'O' (+ 'o')
    0x0e51,     // 'P' (+ 'p')
    0x9551,     // 'Q' (+ 'q')
    0x8e51,     // 'R' (+ 'r')
    0x9021,     // 'S' (+ 's')
    0x2081,     // 'T' (+ 't')
    0x1550,     // 'U' (+ 'u')
    0x4448,     // 'V' (+ 'v')
    0xc550,     // 'W' (+ 'w')
    0xc028,     // 'X' (+ 'x')
    0x2028,     // 'Y' (+ 'y')
    0x5009,     // 'Z' (+ 'z')
    0x0000,     // '[' (Not defined)
    0x0000,     // '\' (Not defined)
    0x0000,     // ']' (Not defined)
    0x0000,     // '^' (Not defined)
    0x0000      // '_'
};





#define READ_OFFSET 255




#ifndef THIS_NEEDS_WORK
/* void display_string()
 * Displays on the LCD, 6 characters from current string starting from the string offset
 */
void display_string(void){
	uint8_t i = 0;
	// Get index of string to be displayed
	uint8_t index = set_string_index(0);
	// Get offset of string to be displayed
	uint8_t offset = set_string_offset(READ_OFFSET);
	// Get pointer to string
	char *string = store_string(null, index, 0);
	
	// start printing character loop
	for (i = 0; i < LCD_WIDTH; i++) {
		// Check haven't reached end of string
		if (string[i + offset] = '\0') {
			// Fill rest of lcd with blanks
			for (i = i; i < LCD_WIDTH; i++) {
				// Display ' ' character
				lcd_dislay_char(' ', i + POSTION_OFFSET);
			}
			break;
		}
		
		// Display character
		lcd_dislay_char(string[i + offset], i + POSTION_OFFSET);
	
	
	}
}
#endif







/* char *store_string(char *string, uint8_t str_num, uint8_t read)
* Performs read and write operations to strings stored in memory.
*
* Passing 'read' (WRITE), will store 'string' to a location indexed by 'str_num' and return the pointer
* to the stored string.
* Passing 'read' (READ), will return a pointer to the string at the location indexed by 'str_num'.
*/
#define DEFAULT_NUMBER_OF_STRINGS 	(3)
#define LCD_NUMBER_OF_STRINGS	DEFAULT_NUMBER_OF_STRINGS

char* store_string(char *string, uint8_t str_num, uint8_t read) 
{
   /* Initialise the pointers to the copies */	
   static char* copied_strings[LCD_NUMBER_OF_STRINGS];

   /* Number of bytes required (including the null terminator) 
	 * to allocate memory for this string.
	 */
   uint8_t	stringLength = (uint8_t)(strlen(string)+1);

	/* Stop illegal string indexing */
	if( str_num > (LCD_NUMBER_OF_STRINGS-1))
	{
		return LCD_COPY_UNSUCCESSFUL;	
	}

	/* Return the address of the selected string */
   if (read == READ) 
   {
       return copied_strings[str_num];
   }
   
	/* Set aside some free space large enough to copy 
	 * the 'string' to copied_strings[str_num]
	 */
   copied_strings[str_num] = (char*)(calloc( stringLength,  sizeof(uint8_t) ));
   
   /* Check whether the memory allocation was successful or not */
	if(copied_strings[str_num] == NULL)
   {
		return LCD_COPY_UNSUCCESSFUL;	
	}
   
   /* Make a copy of the original string and return the address of the
	 * copied string
	 */
	strcpy(copied_strings[str_num], string);
	         
   return copied_strings[str_num];
} 


/* uint8_t set_string_offset(uint8_t offset) 
 * Adjusts and returns the offset of the currently displyed string.
 * 
 * Setting 'offset' to (READ) will return the offset of the 
 * currently displayed string.
 * Otherwise, the offset will set to the passed value. An offset of 0 will
 * display the first 6 characters of the currently displayed string.
 *    
 */
uint8_t set_string_offset(uint8_t offset){
	static uint8_t string_offset = 0;

	if (offset != READ) {
		string_offset = offset;
	}
	
	return string_offset;
}


/* uint8_t set_string_index(uint8_t str_num) 
 * Stores the index number of the currently selected string.
 * If (READ) is passed, the function will return the currently selected string.
 * Otherwise, the string index will be set to the passed value, and the index of the
 * selected string will be returned.
 */
uint8_t set_string_index(uint8_t str_num){
	static uint8_t string_index = 0;
	

	if (str_num == READ){
		return string_index;
	}
	
	/* If the selected string is larger than the largest string index,
	 * return the string with the highest index */
	if( str_num > (LCD_NUMBER_OF_STRINGS-1) )
	{
		return (LCD_NUMBER_OF_STRINGS-1)	
	}

	string_index = str_num;
	return str_num;

}



/* uint8_t set_toggle_values(uint8_t position, uint8_t read)
 * Toggles and stores the toggle_value at the lcd 'position'.
 * If 'read' is (READ), it will only return the toggle_value at that postion. 
 */ 
uint8_t set_toggle_values(uint8_t position, uint8_t read) {
	static uint8_t toggle_values = 0x3F;
	uint8_t mask = 0x01;
	
	// Shift mask to correct position
	mask <<= (position - POSTION_OFFSET);
	
	if (read == WRITE) { 
		// toggle bit
		toggle_values = toggle_values ^ mask;
	}
	
	// Return postion is toggled off
	if (toggle_values & mask) {
		return 1;
	} else {
		return 0;
	}
}



/* uint16_t char_to_scc(char character)
 * Converts a given ASCII character to the segment control code (SCC) equivalent. 
 * The lowercase characters will be converted to uppercase.
 * If the passed character is not displayable it will return
 * a blank character.
 */   
uint16_t char_to_scc(char character) {
	// Convert from lowercase to uppercase
	if (character >= 'a' && character <= 'z') {
		character = character - 'a' + 'A';
	}
	
	// Check in range of characters
	if (character >= '_' || character <= '*') {
		// if not in range change it to a blank character
		character = '_';
	}
	
	// remove ASCII offset so it can be looked up from the character table
	character -= '*';
	
	return LCD_character_table[(uint16_t)(character)];
}
