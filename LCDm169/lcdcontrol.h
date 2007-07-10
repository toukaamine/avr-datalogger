/* Display Control Library for AVR Butterfly
 * Filename: lcdcontrol.h
 * Last modification : 12/07/06
 * Authors : Adrian Gin (amg94) and Jack Farley (jfa31)
 *
 * Target: AVR Butteryfly (ATMEGA169 MPU)
 *
 * Description: Fuctions prototypes associated with controlling the
 * LCD display on the ATMega169 AVR Butterfly development board.
 *
 * All functions described are available for external use.
 *
 */

#ifndef  _LCD_CONTROL
#define  _LCD_CONTROL

/* Include the standard integer types*/
#include <stdint.h>

#ifndef NULL
#define  NULL                               (0)
#endif

#define  IS_ODD                             (0x01)

/* LCD alphanumeric control definitions
 * character
 * DEVICE SPECIFIC!!! (ATmega169)
 */
#define  LCD_DATA_REGISTER_START_ADDRESS    ((uint8_t*)(0xEC))
#define  LCD_DATA_REGISTER_END_ADDRESS      ((uint8_t*)(0xFD))
#define  LCD_DATA_REGISTERS_PER_DIGIT       (4)
#define  LCD_DATA_REGISTER_SPACING          (5)


/* LCD string definitions */
#define  DEFAULT_NUMBER_OF_STRINGS          (3)
#define  LCD_NUMBER_OF_STRINGS              (DEFAULT_NUMBER_OF_STRINGS)
#define  LCD_NUMBER_OF_STORED_STRINGS       (2)
#define  LCD_NO_SELECTED_STRING             (255)
#define  LCD_COPY_UNSUCCESSFUL              (0)
#define  LCD_COPY_SUCCESSFUL                (1)
#define  LCD_STRING_CYCLE_SIZE              (2)
#define  DEFAULT_STRING                     (STRING_A)
#define  MAX_STRING_LENGTH                  (50)
#define  BLANK_STRING                       ("      ")

/* String Scroll Defintions */
#define  READ_OFFSET                        (255)
#define  MAX_OFFSET                         (254)
#define  LEFT                               (0)
#define  RIGHT                              (1)

/* LCD characteristic definitions */
#define  LCD_WIDTH                          (6)
#define  LCD_PAIRS_OF_DIGITS                (LCD_WIDTH / 2)
#define  POSITION_OFFSET                    (2)


/* Definitions used in toggling lcd characters */
#define  LCD_TOGGLE_MASK                    (0x3F)
#define  LCD_POSITION_ON                    (1)
#define  LCD_POSITION_OFF                   (0)


/* LCD scroll definitions */
#define  RESET_OFFSET                       (0x06)


/* LCD contrast definitions
 * DEVICE SPECIFIC!!! (ATmega169)
 */
#define  LCD_INITIAL_CONTRAST               (12)
#define  LCD_MAX_CONTRAST                   (0x0F)
#define  LCD_MIN_CONTRAST                   (0x00)
/* A device specific macro (for the ATmega169) to set contrast of the lcd screen
 * on a scale from 0 to 15, where 15 is the highest level of contrast.
 * Macro copied from LCD_Driver.h Created by AMTEL Norway.
 */
#define  LCD_CONTRAST_LEVEL(level)          LCDCCR=(0x0F & level)

/* Function Name: lcd_init
 * Returns:     none
 * Parameters:  none
 *
 * Purpose:     Sets up the LCD display for use
 *              Clears the 6 alphanumeric characters on the LCD display
 *              Initialises the display strings as null pointers
 *              Must be called before any other function in library is used
 */
void lcd_init(void);


/* Function Name: lcd_clear
 * Returns:     none
 * Parameters:  none
 *
 * Purpose:     Clears the 6 alphanumeric characters on the lcd screen
 */
void lcd_clear(void);


/* Function Name: lcd_dislay_char
 * Returns:     none
 * Parameters:  c: The character to be displayed
 *
 *              position: The position on the lcd where the character
 *                 will be shown (2 - 7)
 *
 * Purpose:     To display a single character on the lcd screen
 *              NB: This code is based on code from LCD_driver.c
 *                 from ATMEL Norway
 */
void lcd_display_char(char c, uint8_t position);


/* Function Name: lcd_display_string
 * Returns:     none
 * Parameters:  str: Pointer to string that is to be displayed
 *
 * Purpose:     Loads the passed string into temporary memory and displays
 *                 the first 6 characters of the string on the lcd
 */
void lcd_display_string(char *str);


/* Function Name: lcd_load_strings
 * Returns:     (1) for total success, (0) for any failure
 * Parameters:  string1 - pointer to string that will be stored and shown
 *
 *              string2 - pointer to string that will be stored
 *
 * Purpose:     Makes a copy of the two strings into memory and displays
 *                 the first 6 characters of the first string on the lcd
 */
uint8_t lcd_load_strings(char *string1, char *string2);


/* Function Name: lcd_toggle_string
 * Returns:     returns the string id of the string being
 *                 displayed (uint8_t)
 * Parameters:  none
 *
 * Purpose:     Toggles between the two stored strings by lcd_load_strings
 *              If both the loaded strings are null pointers, will have
 *                 no effect
 *              If only one string has been loaded, lcd_toggle_string will
 *                 display the loaded string
 *              The string offset will always be reset
 */
uint8_t lcd_toggle_string(void);


/* Function Name: lcd_toggle_position
 * Returns:     (1) for position is visible, (0) for position is not visible
 * Parameters:  position - Postion on lcd that is to be toggled
 *
 * Purpose:     Toggles (between on and off) a alphanumeric lcd character
 */
uint8_t lcd_toggle_position(uint8_t position);


/* Function Name: lcd_scroll
 * Returns:     new string offset (uint8_t)
 * Parameters:  direction - (LEFT) to scroll left one postion
 *                          (RIGHT) to scroll right one position
 *
 * Purpose:     Scrolls the current string being displayed on lcd one
 *                 position left or right
 */
uint8_t lcd_scroll(uint8_t direction);





#endif
