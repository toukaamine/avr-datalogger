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
 
 #include "lcdinternals.h"

#define BLANK_SCC 0x0000
// Look-up table used when converting ASCII to
// LCD display data (segment control)
__flash unsigned int LCD_character_table[] =
{
    0x0A51,     // '*' (?)
    0x2A80,     // '+'
    BLANK_SCC,     // ',' (Not defined)
    0x0A00,     // '-'
    0x0A51,     // '.' Degree sign
    0x4008,     // '/'
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
    BLANK_SCC,  // ':' (Not defined)
    BLANK_SCC,  // ';' (Not defined)
    BLANK_SCC,  // '<' (Not defined)
    BLANK_SCC,  // '=' (Not defined)
    BLANK_SCC,  // '>' (Not defined)
    BLANK_SCC,  // '?' (Not defined)
    BLANK_SCC,  // '@' (Not defined)
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
    0x8020,     // '\'
    BLANK_SCC,  // ']' (Not defined)
    BLANK_SCC,  // '^' (Not defined)
    0x1000      // '_'
};




#enum (STRING_A = 0, STRING_B, STRING_T, STRING_AMOUNT)

/* char *store_string(char *string, uint8_t str_num, uint8_t read) 
 * Performs read and write operations to strings stored in memory. 
 * 
 * Passing 'read' (WRITE), will write 'string' to a location indexed by 'str_num'.
 * Passing 'read' (READ), will return a pointer to the string at the location indexed by 'str_num'.
 */
char *store_string(char *str, uint8_t str_num, uint8_t read) {
	static char *strings[STRING_AMOUNT] = NULL;
	
	// TODO Check for valid str_num
	
	// If reading, return pointer
	if (read) { 
		return strings[str_num];
	}
	
	strings[str_num] = 
}












/* void display_string(void)
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

/* uint16_t char_to_scc(char character)
 * Converts a given ASCII character to the SCC equivalent. The character will be
 * converted to uppercase and if it is a character not supported it will return
 * a blank character.
 */   
uint16_t char_to_scc(char character) {
	// Convert from lowercase to uppercase
	if (character >= 'a' && character <= 'z') {
		character -= 'a' - 'A';
	}
	
	// Check in range of characters
	if (character >= '_' || character <= '*') {
		// if not in range change it to a blank character (0x0000)
		return BLANK_SCC;
	}
	
	// remove ASCII offset
	character -= '*';
	
	return LCD_character_table[character];
}
