/* Display Control Library for AVR Butterfly
 * Filename: lcdcontrol.c
 * Last modification : 12/07/06
 * Authors : Adrian Gin (amg94) and Jack Farley (jfa31)
 *
 * Target: AVR Butteryfly (ATMEGA169 MPU)
 *
 * Description: Fuction library associated with controlling the
 * LCD display on the ATMega169 AVR Butterfly development board.
 *
 * The functions listed in lcdcontrol.h are available for external use.
 * All other functions are not for external use.
 *
 */

/* Include the standard integer types*/
#include <stdint.h>

/* Include avr */
#include <avr/io.h>
#include <avr/iom169.h>

#include <string.h>
#include <stdlib.h>

#include "lcdcontrol.h"


/* LCD clock definitions
 * DEVICE SPECIFIC!!! (ATmega169)
 */
#define  LCD_ALL_SEGMENTS           (0x07)

#define  LCD_DUTY_STATIC            (0x00)
#define  LCD_DUTY2                  (0x01)
#define  LCD_DUTY3                  (0x02)
#define  LCD_DUTY4                  (0x03)

#define  LCD_CLOCK_DIVIDE(x)        ((x)+ 0x01)

#define  LCD_CLOCK_PRESCALER_16     (0x00)
#define  LCD_CLOCK_PRESCALER_64     (0x01)
#define  LCD_CLOCK_PRESCALER_128    (0x02)
#define  LCD_CLOCK_PRESCALER_256    (0x03)
#define  LCD_CLOCK_PRESCALER_512    (0x04)
#define  LCD_CLOCK_PRESCALER_1024   (0x05)
#define  LCD_CLOCK_PRESCALER_2048   (0x06)
#define  LCD_CLOCK_PRESCALER_4096   (0x07)


/* Definitions used in clearing LCD screen */
#define  LCD_FIRST_CLEARMASK        (0x99)
#define  LCD_CLEARMASK              (0xFF)
#define  LCD_ODD_MASK               (0x0F)
#define  LCD_EVEN_MASK              (0xF0)

/* Definition of a blank LCD character */
#define  BLANK_SCC                  (0x0000)


/* String id */
enum  string_index  {STRING_A = 0, STRING_B, STRING_TEMPORARY, STRING_AMOUNT};

/* READ / WRITE definitions used in function calls */
typedef enum {WRITE=0, READ=255} rw_byte_t;


/* Look-up table used when converting a ASCII character to the
 * equivalent LCD display data (SCC character)
 */
const uint16_t LCD_character_table[] =
{
    0xEAA8,     /* '*' (?) */
    0x2A80,     /* '+' */
    BLANK_SCC,  /* ',' (Not defined) */
    0x0A00,     /* '-' */
    0x0A51,     /* '.' Degree sign */
    0x4008,     /* '/' */
    0x5559,     /* '0' */
    0x0118,     /* '1' */
    0x1e11,     /* '2 */
    0x1b11,     /* '3 */
    0x0b50,     /* '4 */
    0x1b41,     /* '5 */
    0x1f41,     /* '6 */
    0x0111,     /* '7 */
    0x1f51,     /* '8 */
    0x1b51,     /* '9' */
    BLANK_SCC,  /* ':' (Not defined) */
    BLANK_SCC,  /* ';' (Not defined) */
    BLANK_SCC,  /* '<' (Not defined) */
    BLANK_SCC,  /* '=' (Not defined) */
    BLANK_SCC,  /* '>' (Not defined) */
    BLANK_SCC,  /* '?' (Not defined) */
    BLANK_SCC,  /* '@' (Not defined) */
    0x0f51,     /* 'A' (+ 'a') */
    0x3991,     /* 'B' (+ 'b') */
    0x1441,     /* 'C' (+ 'c') */
    0x3191,     /* 'D' (+ 'd') */
    0x1e41,     /* 'E' (+ 'e') */
    0x0e41,     /* 'F' (+ 'f') */
    0x1d41,     /* 'G' (+ 'g') */
    0x0f50,     /* 'H' (+ 'h') */
    0x2080,     /* 'I' (+ 'i') */
    0x1510,     /* 'J' (+ 'j') */
    0x8648,     /* 'K' (+ 'k') */
    0x1440,     /* 'L' (+ 'l') */
    0x0578,     /* 'M' (+ 'm') */
    0x8570,     /* 'N' (+ 'n') */
    0x1551,     /* 'O' (+ 'o') */
    0x0e51,     /* 'P' (+ 'p') */
    0x9551,     /* 'Q' (+ 'q') */
    0x8e51,     /* 'R' (+ 'r') */
    0x9021,     /* 'S' (+ 's') */
    0x2081,     /* 'T' (+ 't') */
    0x1550,     /* 'U' (+ 'u') */
    0x4448,     /* 'V' (+ 'v') */
    0xc550,     /* 'W' (+ 'w') */
    0xc028,     /* 'X' (+ 'x') */
    0x2028,     /* 'Y' (+ 'y') */
    0x5009,     /* 'Z' (+ 'z') */
    BLANK_SCC,  /* '[' (Not defined) */
    0x8020,     /* '\' */
    BLANK_SCC,  /* ']' (Not defined) */
    BLANK_SCC,  /* '^' (Not defined) */
    0x1000      /* '_' */
};


/* Internal Function Prototypes */
void display_string(void);
void display_char(char c, uint8_t position);
uint16_t char_to_scc(char character);
uint8_t set_toggle_values(uint8_t new_toggle_values, rw_byte_t read);
uint8_t set_string_index(uint8_t str_num);
uint8_t set_string_offset(uint8_t offset);
char* store_string(char *string, uint8_t str_num, rw_byte_t read);


/* Function Name: lcd_init
 * Returns:         none
 * Parameters:      none
 *
 * Purpose:         Sets up the LCD display for use
 *                  Clears the 6 alphanumeric characters on the LCD display
 *                  Initialises the display strings as null pointers
 *                  Must be called before any other function in library is used
 */
void lcd_init(void)
{
    /* Set the LCD contrast level */
    LCD_CONTRAST_LEVEL(LCD_INITIAL_CONTRAST);

    /* For a frame rate of 32Hz, set
     * LCDclk           = 32.768kHz
     * LCDPrescaler     = 16
     * LCDClockDivide   = 8
     * LCDDuty          = 1/4
     */

    /* Select the external 32.768kHz crystal as the LCD clock source, enable all
     * COM pins and enable all segment pins.
     */
    LCDCRB = (1<<LCDCS) | ((LCD_DUTY4)<<LCDMUX0) | ((LCD_ALL_SEGMENTS)<<LCDPM0);

    LCDFRR = (LCD_CLOCK_PRESCALER_16<<LCDPS0) | (LCD_CLOCK_DIVIDE(8)<<LCDCD0);

    /* Enable LCD and set low power waveform */
    LCDCRA = (1<<LCDEN) | (1<<LCDAB);

}


/* Function Name: lcd_clear
 * Returns:         none
 * Parameters:      none
 *
 * Purpose:         Clears the 6 alphanumeric characters on the lcd screen
 */
void lcd_clear(void)
{
    uint8_t* i = (LCD_DATA_REGISTER_START_ADDRESS);

    /* Clear the alpha-numeric segments in registers LCDDR0,1 and 2 */
    for(i = (LCD_DATA_REGISTER_START_ADDRESS) ;
        i < (LCD_DATA_REGISTER_START_ADDRESS) + LCD_PAIRS_OF_DIGITS;
        i++)
    {
        *i =   (*i) & (~(LCD_FIRST_CLEARMASK));
    }

    /* Clear registers LCDDR5 -> LCDDR17 */
    for( i = (LCD_DATA_REGISTER_START_ADDRESS) + LCD_DATA_REGISTER_SPACING ;
         i <= LCD_DATA_REGISTER_END_ADDRESS;
         i= i+LCD_DATA_REGISTER_SPACING)
    {
        *(i)   &=   (uint8_t)(~(LCD_CLEARMASK));
        *(i+1) &=   (uint8_t)(~(LCD_CLEARMASK));
        *(i+2) &=   (uint8_t)(~(LCD_CLEARMASK));
    }

}


/* Function Name: lcd_display_char
 * Returns:         none
 * Parameters:      c: The character to be displayed
 *
 *                  position: The position on the lcd where the character
 *                     will be shown (2 - 7)
 *
 * Purpose:         To change display a single character on the lcd screen
 */
void lcd_display_char(char c, uint8_t position)
{
    char* string = NULL;
    uint8_t offset = 0;

    /* Check if a string is currently being displayed */
    if (set_string_index(READ) == (LCD_NO_SELECTED_STRING))
    {
        /* If no strings have been displayed set up a temporary string */
        lcd_display_string(BLANK_STRING);
    }

    /* Get pointer to currently displayed string */
    string = store_string(NULL, set_string_index(READ), READ);

    /* Get current string offset */
    offset = set_string_offset(READ);


    /* Add postion to the string offset to get where to change character */
    offset = offset + position - POSITION_OFFSET;


    /* Change character to new character */
    string[offset] = c;

    display_char(c, position);

}


/* Function Name: lcd_display_string
 * Returns:         none
 * Parameters:      str: Pointer to string that is to be displayed
 *
 * Purpose:         Loads the passed string into temporary memory and displays
 *                     the first 6 characters of the string on the lcd
 */
void lcd_display_string(char *str)
{
    /* Write the string into temporary memory */
    store_string(str, STRING_TEMPORARY, WRITE);

    set_string_offset(RESET_OFFSET);
    set_string_index(STRING_TEMPORARY);

    display_string();

}


/* Function Name: lcd_load_strings
 * Returns:         1 for total success, 0 for any failure
 * Parameters:      string1: pointer to string that will be stored and shown
 *
 *                  string2: pointer to string that will be stored
 *
 * Purpose:         Makes a copy of the two strings into memory and displays
 *                     the first 6 characters of the first string on the lcd
 */
uint8_t lcd_load_strings(char *string1, char *string2)
{
    uint8_t* string_state[LCD_NUMBER_OF_STORED_STRINGS];
    uint8_t  copy_status = LCD_COPY_SUCCESSFUL;

    /* Attempt to store the passed strings into memory*/
    string_state[STRING_A] = store_string( string1, STRING_A, WRITE);
    string_state[STRING_B] = store_string( string2, STRING_B, WRITE);

    /* If either copy fails, return with 'LCD_COPY_UNSUCCESSFUL'
     * to represent an unsuccessful copy
     */
    if(    (string_state[STRING_A] == LCD_COPY_UNSUCCESSFUL)
       ||  (string_state[STRING_B] == LCD_COPY_UNSUCCESSFUL) )
    {
        copy_status = LCD_COPY_UNSUCCESSFUL;
    }

    set_string_offset(RESET_OFFSET);
    set_string_index(DEFAULT_STRING);

    display_string();

    return copy_status;

}



/* Function Name: lcd_toggle_string
 * Returns:         returns the string id of the string being displayed
 * Parameters:      none
 *
 * Purpose:         Toggles between the two stored strings by lcd_load_strings
 *                  If both the loaded strings are null pointers, will have
 *                     no effect
 *                  If only one string has been loaded, lcd_toggle_string will
 *                     display the loaded string
 *                  The string offset will always be reset
 */
uint8_t lcd_toggle_string(void)
{
    uint8_t new_index;
    uint8_t* string_state[LCD_NUMBER_OF_STORED_STRINGS];

    /* Check to see which strings are NULL pointers */
    string_state[STRING_A] = store_string(NULL, STRING_A, READ);
    string_state[STRING_B] = store_string(NULL, STRING_B, READ);


    /* If neither strings have been initialised, then do nothing */
    if( (string_state[STRING_A] == NULL) && (string_state[STRING_B] == NULL) )
    {
        return LCD_NO_SELECTED_STRING;
    }

    /* Toggle the displayed string between the strings loaded
     * via lcd_load_strings(..)
     */
    if( (string_state[STRING_A] != NULL) && (string_state[STRING_B] != NULL) )
    {
        new_index = ((set_string_index(READ) + 1 ) % LCD_STRING_CYCLE_SIZE);
        set_string_index(new_index);
    }
    else
    {
        if( (string_state[STRING_B] == NULL) )
        {
            set_string_index(STRING_A);
            new_index =  STRING_A;
        }
        else
        {
            set_string_index(STRING_B);
            new_index =  STRING_B;
        }
    }

    /* Reset the string offset, then display the new string
     * and return the index of the displayed string
     */
    set_string_offset(RESET_OFFSET);

    display_string();
    return new_index;

}


/* Function Name: lcd_toggle_position
 * Returns:         1 for position is visible, 0 for position is not visible
 * Parameters:      position: Postion on lcd that is to be toggled (2-7)
 *
 * Purpose:         Toggles (between on and off) a alphanumeric lcd character
 */
uint8_t lcd_toggle_position(uint8_t position)
{
    uint8_t toggle_values = LCD_TOGGLE_MASK;

    /* Read toggle positions. */
    toggle_values = set_toggle_values(0, READ);

    /* Toggle the passed LCD Position */
    toggle_values = toggle_values ^ (1<<(position - POSITION_OFFSET));

    /* Write the new toggle values to the LCD */
    set_toggle_values(toggle_values, WRITE);

    /* Redisplay current string onto LCD */
    display_string();

    /* Return the state of the passed LCD Position */
    if( toggle_values & (1<<(position - POSITION_OFFSET)))
    {
      return LCD_POSITION_ON;
    }
    else
    {
      return LCD_POSITION_OFF;
    }

}


/* Function Name: lcd_scroll
 * Returns:     new string offset
 * Parameters:  direction - (LEFT) to scroll left one postion
 *                          (RIGHT) to scroll right one position
 *
 * Purpose:     Scrolls the current string being displayed on lcd one
 *                 position left or right
 */
uint8_t lcd_scroll(uint8_t direction)
{
    uint8_t string_length;
    uint8_t current_offset;

    /* Get current string information */
    string_length = strlen( store_string(NULL, set_string_index(READ), READ) );
    current_offset = set_string_offset(READ);


    if (direction == RIGHT)
    {
        if ( (current_offset) > 0)
        {
            /* Scroll Right one position */
            set_string_offset(set_string_offset(READ) - 1);
        }
        else
        {
            /* Move string to far left of lcd screen */
            set_string_offset(string_length + LCD_WIDTH);
        }
    }
    else
    if (direction == LEFT)
    {
        if (current_offset < (string_length + LCD_WIDTH))
        {
            /* Check not going to overflow string_offset */
            if (current_offset <= MAX_OFFSET)
            {
                /* Scroll left one position */
                set_string_offset(set_string_offset(READ) + 1);
            }
        }
        else
        {
            /* Move string to far right of lcd screen */
            set_string_offset(0);
        }
    }

    /* Redisplay current string onto LCD */
    display_string();

    return set_string_offset(READ);

}



/* --- START OF INTERNAL FUNCTIONS --- */

/*
 * Functions in this section should not be called directly by the user.
 */



/* Funciton Name: store_string
 * Returns:     Pointer to stored string
 * Parameters:  string - Pointer to string to be copied and stored
 *
 *              str_num: String index to store string into.
 *                 (The valid range is 0 -> LCD_NUMBER_OF_STRINGS-1)
 *
 *              read: (WRITE) to store a new string
 *                 (READ) to only read currently stored string
 *
 * Purpose:     Performs read and write operations to strings stored
 *                 in memory.
 */
char* store_string(char *string, uint8_t str_num, rw_byte_t read)
{
    /* Initialise the pointers to the copies as NULL pointers */
    static char copied_strings[LCD_NUMBER_OF_STRINGS][MAX_STRING_LENGTH] = { {0}, {0}, {0} };

    /* Return the address of the selected string */
    if (read == READ)
    {
        return copied_strings[str_num];
    }

    /* Stop illegal string indexing
     * (The valid range is 0 -> LCD_NUMBER_OF_STRINGS-1)
     */
    if( str_num >= (LCD_NUMBER_OF_STRINGS))
    {
        return LCD_COPY_UNSUCCESSFUL;
    }


    uint8_t  stringLength = (uint8_t)(strlen(string));

    /* If the length of the passed string is zero, then set the
     * string pointer to NULL, and return NULL.
     */
    if(stringLength == 0)
    {
        copied_strings[str_num][0] = 0;
        return NULL;
    }

    /* Make a copy of the original string and return the address of the
     * copied string
     */
    strcpy(copied_strings[str_num], string);

    return copied_strings[str_num];

}


/* Function Name: set_string_offset
 * Returns:     Current string offset (uint8_t)
 * Parameters:  offset - value to change string offset to
 *                 NB: Sending (READ) will not write to string offset
 *
 * Purpose:     Sets and returns values for the current string offset used
 *                 to determine which characters will be displayed on lcd
 *              An offset value of (RESET_OFFSET) will mean the first 6
 *                 characters will be displayed
 */
uint8_t set_string_offset(uint8_t offset)
{
    static uint8_t string_offset = RESET_OFFSET;

    if (offset != READ)
    {
        string_offset = offset;
    }

    return string_offset;

}


/* Function Name: set_string_index
 * Returns:     The index of the updated string id (uint8_t), or the index
 *                 of the currently displayed string if a READ is requested
 * Parameters:  str_num - value to change the string id to
 *                 NB: Sending (READ) will not write to string id
 *
 * Purpose:     Stores the index number of the currently displayed string
 */
uint8_t set_string_index(uint8_t str_num)
{
    static uint8_t string_index = LCD_NO_SELECTED_STRING;


    if (str_num == READ)
    {
        return string_index;
    }

    /* If the selected string is larger than the largest string index,
     * return the string with the highest index */
    if( str_num > (LCD_NUMBER_OF_STRINGS-1) )
    {
        return (LCD_NUMBER_OF_STRINGS-1);
    }

    string_index = str_num;
    return str_num;

}


/* Function Name: set_toggle_values
 * Returns:     Current toggle values of the LCD (uint8_t)
 * Parameters:  new_toggle_values - The state of the LCD character positions
 *                 is set to this
 *                 NB: this parameter is needed if 'WRITING' toggle value
 *
 *                 The diagram below represents how the toggle_values are
 *                 related to the LCD character positions.
 *
 *                 BIT7  BIT6  BIT5  BIT4  BIT3  BIT2  BIT1  BIT0
 *                  0     0    LCD7  LCD6  LCD5  LCD4  LCD3  LCD2
 *
 *                 A '1' means the respective character position on the LCD
 *                    is ON (character visible).
 *                 A '0' means the respective character position on the LCD
 *                    is OFF (character hidden).
 *
 *              read - (READ) The status of the LCD positions are returned
 *                     (WRITE) The status of the LCD positions are set to
 *                        'new_toggle_values'
 *
 * Purpose:     Stores which character positions on the LCD are on or off.
 *
 *              See Atmel Application Note:
 *                 AVR065 'LCD Driver for the STK502 and the AVR Butterfly'
 *                 Page 6 Figure 2-6 for the LCD character positions
 */
uint8_t set_toggle_values(uint8_t new_toggle_values, rw_byte_t read)
{
    static uint8_t toggle_values = LCD_TOGGLE_MASK; /* all default ON */


    if (read == WRITE)
    {
        /* Set toggle_values to new value */
        toggle_values = new_toggle_values;
    }

    return (toggle_values & LCD_TOGGLE_MASK);

}


/* Function Name: char_to_scc
 * Returns:     SCC equivalent of the given ASCII character
 * Parameter:   character - ASCII character to be converted
 *
 * Purpose:     Converts a given ASCII character to the SCC equivalent
 *              NB: The character will be converted to uppercase and
 *                 if it is a character not supported it will return
 *                 a blank ' ' character.
 */
uint16_t char_to_scc(char character)
{
    /* Convert from lowercase to uppercase */
    if (character >= 'a' && character <= 'z')
    {
        character -= 'a' - 'A';
    }

    /* Check in range of characters */
    if (character > '_' || character < '*')
    {
        /* if not in range return a blank character (BLANK_SCC) */
        return BLANK_SCC;
    }

    /* remove ASCII offset */
    character -= '*';

    /* return SCC code for adjusted ASCII character */
    return LCD_character_table[(uint16_t)(character)];

}


/* Function Name: dislay_char
 * Returns:     none
 * Parameters:  c - The character to be displayed
 *
 *              position - The position on the lcd where the character
 *                 will be shown (2 - 7)
 *
 * Purpose:     To display a single character on the lcd screen
 *              NB: This code is based on code from LCD_driver.c
 *                 from ATMEL Norway
 */
void display_char(char c, uint8_t position)
{
    uint16_t scc = BLANK_SCC;
    uint8_t mask, nibble;
    uint8_t *LCD_Datareg;
    uint8_t i = 0;

    uint8_t digit = position - POSITION_OFFSET;
    uint8_t toggle_value;

    toggle_value = set_toggle_values(0, READ) & (1<<digit);

    /* Check LCD position is toggled on and that the digit position is legal */
    if ( (toggle_value == LCD_POSITION_OFF) && (digit < LCD_WIDTH))
    {
        c = ' ';
    }


    /* Convert char to SCC code */
    scc = char_to_scc(c);

    /* Change mask odd/even position */
    if (digit & IS_ODD) {
        mask = LCD_ODD_MASK; /* Odd position */
    }
    else
    {
        mask = LCD_EVEN_MASK; /* Even position */
    }

    /* Get address of starting LCD Data register */
    LCD_Datareg = LCD_DATA_REGISTER_START_ADDRESS + (digit >> 1);

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
            nibble = (nibble << LCD_DATA_REGISTERS_PER_DIGIT);
        }

        *LCD_Datareg = (*LCD_Datareg & mask) | nibble;
        /* Move to the next LCD Data register corresponding to the
         * LCD digit position.
         */
        LCD_Datareg += LCD_DATA_REGISTER_SPACING;
    }

}


/* Function Name: display_string
 * Returns:     none
 * Parameters:  none
 *
 * Purpose:     Displays on the LCD, 6 characters from the currently
 *                 selected string starting from the position given by the
 *                 stored string offset
 */
void display_string(void)
{
    uint8_t i = 0;
    uint8_t index;
    uint8_t offset;
    char *string;

    /* Get index of string to be displayed */
    index = set_string_index(READ);

    /* Get offset of string to be displayed */
    offset = set_string_offset(READ);

    /* Get pointer to string */
    string = store_string(NULL, index, READ);

    /* start printing character loop */
    for (i = 0; i < LCD_WIDTH; i++)
    {
        /* Check that not getting -ve array element */
        if ((int16_t)(i + offset - LCD_WIDTH) < 0)
        {
        /* Display ' ' character instead of -ve array element */
        display_char(' ', i + POSITION_OFFSET);
        }
        else
        {
            /* Check haven't reached end of string */
            if (string[i + offset - LCD_WIDTH] == '\0')
            {
                /* Fill rest of lcd with blanks */
                for ( ; i < LCD_WIDTH; i++)
                {
                    /* Display ' ' character */
                    display_char(' ', i + POSITION_OFFSET);
                }
            }
            else
            {
                /* Display character in the string */
                display_char(string[i + offset - LCD_WIDTH], i + POSITION_OFFSET);
            }
        }

    }

}



/* --- END OF INTERNAL FUNCTIONS --- */
