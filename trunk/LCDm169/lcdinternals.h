/* Display Control Library for AVR Butterfly
 * Filename: lcdinternals.h
 * Last modification : 31/05/06
 * Authors : Adrian Gin (amg94) and Jack Farley (jfa31)
 *
 * Description: Contains the functions which are called by the LCD Control library
 * functions (implemented in lcdcontrol.c).
 *
 * All functions described are not to be called by any user written function.
 *
 */




#include <stdint.h>


/* The internal functions for the library are described below
 * These functions are accessed by the functions prefixed with 'lcd',
 * and are not to be explicitly called by any user written function */



#define POSITION_OFFSET 2

#ifndef NULL
#define	NULL 0
#endif

#define LCD_WIDTH 6


#define 	READ	0
#define	WRITE	1
/* char *store_string(char *string, uint8_t str_num, uint8_t write) 
 * Performs read and write operations to strings stored in memory. 
 * 
 * Passing 'write' a 1, will write 'string' to a location indexed by 'str_num'.
 * Passing 'write' a 0, will return a pointer to the string at the location indexed by 'str_num'.
 */
char *store_string(char *str, uint8_t str_num, uint8_t write);


/* uint8_t set_string_offset(uint8_t direction) 
 * Adjusts and returns the offset of the currently displyed string.
 * 
 * Setting 'direction' to READ_OFFSET (255) will return the offset of the 
 * currently displayed string.
 * Otherwise, the offset will set to the passed value. An offset of 0 will
 * display the first 6 characters of the currently displayed string.
 *    
 */
#define READ_OFFSET 255
uint8_t set_string_offset(uint8_t direction);


/* uint8_t set_string_index(uint8_t str_num) 
 * Stores the index number of the currently selected string.
 * If a 255 (READ) is passed, the function will return the currently selected string.
 * Otherwise, the string index will be set to the passed value, and the index of the
 * selected string will be returned.
 */
uint8_t set_string_index(uint8_t str_num);

/* uint8_t set_toggle_values(uint8_t position, unint8 write)
 * Toggles and stores the toggle_value at the lcd 'position'.
 * If is write is 0, it will only return the toggle_value at that postion. 
 */ 
uint8_t set_toggle_values(uint8_t position, uint8_t write);


/* void display_string(void)
 * Displays on the LCD, 6 characters from current string starting from the string offset
 */
void display_string(void);


/* uint16_t char_to_scc(char character)
 * Converts a given ASCII character to the SCC equivalent. The character will be
 * converted to uppercase and if it is a character not supported it will return
 * a blank character.
 */   
uint16_t char_to_scc(char character);




