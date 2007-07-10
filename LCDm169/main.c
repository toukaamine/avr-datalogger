/* Display Control Library for AVR Butterfly
 * Filename: main.c
 * Last modification : 12/07/06
 * Authors : Adrian Gin (amg94) and Jack Farley (jfa31)
 *
 * Target: AVR Butteryfly (ATMEGA169 MPU)
 *
 * Description: Contains fuctions associated with controlling the
 * Namecard test application.
 *
 * The Namecard allows the user to:
 * Input their name via the 5-way joystick
 * Display their name in either 'Flashing mode' or 'Scrolling' Mode
 * Alter the contrast of the LCD screen on the AVR Butterfly.
 *
 * For details of operation please read the 'Namecard Manual.doc'
 */



#include <avr/io.h>
#include <avr/iom169.h>

#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <avr/pgmspace.h>
/* All string constants are stored in program memory space
 * to save the Atmega169's RAM (The Atmega169 has only 1KByte of SRAM)
 */

/* Define the speed of the CPU to be 1MHz */
#define F_CPU 1000000UL
#include <util/delay.h>

#include "lcdcontrol.h"

/* JOYSTICK defines */

/* Joystick mask constants */
#define  JOYSTICK_PB_MASK               (0xD0)
#define  JOYSTICK_PE_MASK               (0x0C)
#define  ENABLE_PULL_UPS                (0x01)
#define  JOYSTICK_ON                    (0)

/* Joystick connection pins */
#define  JOYSTICK_PUSH                  (!((PINB)&(1<<PB4)))
#define  JOYSTICK_UP                    (!((PINB)&(1<<PB6)))
#define  JOYSTICK_DOWN                  (!((PINB)&(1<<PB7)))
#define  JOYSTICK_LEFT                  (!((PINE)&(1<<PE2)))
#define  JOYSTICK_RIGHT                 (!((PINE)&(1<<PE3)))

/* Joystick direction enumeration */
enum joystick_direction {NO_BUTTON = 0, JS_PUSH = 1,
                                                     JS_UP,
                                                     JS_DOWN,
                                                     JS_LEFT,
                                                     JS_RIGHT};

#define  DELAY_SHORTEST                 (60)
#define  DELAY_SHORT                    (100)
#define  DELAY_MEDIUM                   (200)
#define  DELAY_LONG                     (1000)

#define  START_CHARACTER                ('A')
#define  BEFORE_ASCII_A                 (0)
#define  AFTER_ASCII_A                  (1)

#define  INITIAL_SCROLL_PAUSE           (100)
#define  SCROLL_PAUSE_STEP              (20)
#define  END_OF_STRING_PAUSE_MULTIPLIER (4)
#define  MAX_SCROLL_PAUSE               (1000)
#define  MIN_SCROLL_PAUSE               (20)
#define  MAX_STR_LENGTH                 (20)
#define  MAX_CONTRAST_DIGITS            (3)
#define  NO_NAME_ENTERED                (0)

/* First and Last name structures */
typedef struct
{
    uint8_t  name_ptr[MAX_STR_LENGTH+1];
    uint8_t  name_length;
} name;

/* Menu item structures */
typedef struct
{
    uint8_t* function_descriptor;
    void (*function_pointer)(void);
} menu_item;

/* Main menu Indexes */
enum function_indexes { NAME_INPUT_MODE = 0,
                        DISPLAY_MODE,
                        SET_CONTRAST_MODE,
                        MAX_MENU_ELEMENTS};

/* First and Last Name enumerations */
enum name_index {FIRST_NAME = 0, LAST_NAME, NUMBER_OF_NAMES};

/* Change character enumerations */
enum change_direction {UP=0, DOWN, INVALID_DIRECTION};


/* Display Modes enumerations */
enum {FLASH = 0, SCROLL, NUMBER_OF_DISPLAY_MODES};

/* Function Prototypes */
void all_lcd_positions_on(void);
void initialise_joystick(void);
uint8_t get_joystick_state(void);
void menu_handler(void);
void input_name(void);
void get_name(name* name_index);
void scroll_to_end_of_string(uint8_t* OutputString);
void scroll_name(void);
void flash_name(void);
uint8_t* printProgramString(PGM_P program_memory_ptr, uint16_t pausetime);
void display_name(void);
void set_contrast(void);
uint8_t  change_character(uint8_t new_direction);
uint8_t* create_name(uint8_t* initial_string);
void pausems(uint16_t  Delay);

/* Main menu descriptions */
const prog_char input_name_text[] = {"INPUT NAME"};
const prog_char display_mode_text[] = {"DISPLAY NAME"};
const prog_char set_contrast_text[] = {"SET CONTRAST"};
PGM_P function_descriptions[] =
{
    input_name_text,
    display_mode_text,
    set_contrast_text
};

/* Input Mode descriptors */
const prog_char first_name_str[] = {"ENTER FIRST NAME"};
const prog_char last_name_str[] = {"ENTER LAST NAME"};
PGM_P  enter_name_message[] = {first_name_str, last_name_str};

/* Display Mode descriptors */
const prog_char flashing_mode[] = {"FLASHING MODE"};
const prog_char scrolling_mode[] = {"SCROLLING MODE"};
PGM_P display_mode_strings[] = {flashing_mode, scrolling_mode};
const prog_char display_mode_no_strings_error[] = {"ERROR NO NAME FOUND"};

/* Set Contrast Mode descriptors */
const prog_char contrast_prefix[]  = {"Levl"};

/* Global Variables */
uint8_t  OutputString[50];
static name first =  { {NO_NAME_ENTERED}, 0};
static name last  =  { {NO_NAME_ENTERED}, 0};


/* Main function:
 * Initialises the LCD display and Joystick input pins on the AVR Butterfly.
 * It then enters an infinite loop to exectute the Namecard Menu system.
 */
int main(void)
{
    /* Initialise the LCD Screen */
    lcd_init();
    lcd_clear();

    /* Initialise the joystick inputs */
    initialise_joystick();

    printProgramString( function_descriptions[NAME_INPUT_MODE], DELAY_MEDIUM);

    while(1)
    {
        menu_handler();
    }

    return 0;

}


/* Funciton Name: all_lcd_positions_on
 * Returns:     none
 * Parameters:  none
 *
 * Purpose:     Activates alphanumeric LCD positions 2 to 7 so that
 *                 they can display a character.
 *              NB: This lcd_init must be called prior to this function.
 */
void all_lcd_positions_on(void)
{
    uint8_t i;
    uint8_t toggle_state;

    /* For the six alphanumeric LCD positions on the AVR Butterfly LCD */
    for( i = POSITION_OFFSET ; i <= LCD_WIDTH+1; i++)
    {
        /* Read the LCD Position state */
        toggle_state = lcd_toggle_position(i);

        /* If the state is off, then toggle the LCD Position back on again */
        if( toggle_state == LCD_POSITION_OFF )
        {
            lcd_toggle_position(i);
        }
    }

}


/* Funciton Name: initialise_joystick
 * Returns:     none
 * Parameters:  none
 *
 * Purpose:     Enables the joystick pins on the AVR as inputs, sets up
 *                 the internal pull up resistors.
 */
void initialise_joystick(void)
{
    /* Set the PortE and PortB's pins which are connected to the joystick
     * to inputs
     */
    DDRB &= ~(JOYSTICK_PB_MASK);
    DDRE &= ~(JOYSTICK_PE_MASK);

    /* Enable the internal pull up on the input pins */
    PORTB |= (JOYSTICK_PB_MASK);
    PORTE |= (JOYSTICK_PE_MASK);

    MCUCR = (MCUCR & (~(1<<PUD)));

}

/* Funciton Name: get_joystick_state
 * Returns:     Joystick direction
 * Parameters:  none
 *
 * Purpose:     Returns which direction the joystick is currently in.
 *                 (see enum joystick_direction).
 *              If no button is pushed, a zero is returned.
 */
uint8_t get_joystick_state(void)
{
    if(JOYSTICK_PUSH)
        return JS_PUSH;

    if(JOYSTICK_UP)
        return JS_UP;

    if(JOYSTICK_DOWN)
        return JS_DOWN;

    if(JOYSTICK_LEFT)
        return JS_LEFT;

    if(JOYSTICK_RIGHT)
        return JS_RIGHT;

    else
        return NO_BUTTON;

}


/* Funciton Name: menu_handler
 * Returns:     none
 * Parameters:  none
 *
 * Purpose:     Changes the selected menu item depending on the input of
 *                 the joystick.
 *
 *              Moving the joystick 'up' will select the previous menu item.
 *              Moving the joystick 'down' will select the next menu item.
 *              Moving the joystick 'right' will activate the selected menu
 *                 item.
 *              Any other joystick input will have no effect.
 *
 *              intitialise_joystick(void) and lcd_init(void) must be called
 *                 prior to the use of this function as this function takes
 *                 the input from the joystick and displays messages to the
 *                 LCD screen.
 *
 *              The selected function descriptor is scrolled left across the
 *                 screen.
 */
void menu_handler(void)
{
    static uint8_t  function_index = 0;

    menu_item   main_menu[3] =
    {
        { (uint8_t*)function_descriptions[NAME_INPUT_MODE],   (&input_name)},
        { (uint8_t*)function_descriptions[DISPLAY_MODE],      (&display_name)},
        { (uint8_t*)function_descriptions[SET_CONTRAST_MODE], (&set_contrast)}
    };

    uint8_t joystick_state = get_joystick_state();

    switch(joystick_state)
    {
        case JS_PUSH:
            break;

        /* If the joystick movesup, then decrement the function index.
         * Do not allow the function index to go beyond it's minimum.
         * If an attempt it made to go below the minimum,
         * set the function index to its minimum
         */
        case JS_UP:
            if(function_index == NAME_INPUT_MODE)
            {
                function_index = NAME_INPUT_MODE+1;
            }
            function_index--;
            printProgramString( (PGM_P)function_descriptions[function_index] ,
                                DELAY_MEDIUM );
            break;

        /* If the joystick moves down, then increment the function index.
         * Do not allow the function index to go beyond it's maximum.
         * If an attempt it made to go above the maximum
         * set the function index to its maximum
         */
        case JS_DOWN:
            function_index++;

            if(function_index >= MAX_MENU_ELEMENTS)
            {
            function_index = MAX_MENU_ELEMENTS - 1;
            }
            printProgramString( (PGM_P)function_descriptions[function_index] ,
                                DELAY_MEDIUM );
            break;

        case JS_LEFT:
            break;

        case JS_RIGHT:
            (*main_menu[function_index].function_pointer)();
            printProgramString( (PGM_P)function_descriptions[function_index] ,
                                DELAY_MEDIUM );
            break;

        default:
            break;

    }

    pausems(DELAY_MEDIUM);
    lcd_scroll(LEFT);

}


/* Funciton Name: input name
 * Returns:     none
 * Parameters:  none
 *
 * Purpose:     To accept two names (a first an a last) generated by the
 *                 joystick.
 *              The name selected for generation is displayed on the LCD.
 *              The name being edited is shown on the screen.
 *              The letter in the name being edited flashes to signal the
 *                 user which letter is being edited.
 */
void input_name(void)
{
    uint8_t* buffer;
    buffer = printProgramString(enter_name_message[FIRST_NAME], 1);
    scroll_to_end_of_string(buffer);
    get_name(&first);

    buffer = printProgramString(enter_name_message[LAST_NAME], 1);
    scroll_to_end_of_string(buffer);
    get_name(&last);

    return;

}


/* Funciton Name: get name
 * Returns:     none
 * Parameters:  A pointer to the name struct which is to have it's
 *                 stored name updated.
 *
 * Purpose:     Updates the passed name structure's stored name
 *                 and name length using the 'create_name' function.
 */
void get_name(name* name_index)
{
    uint8_t* buffer;
    buffer = create_name(name_index->name_ptr);
    name_index->name_length = strlen(buffer);
    strcpy(name_index->name_ptr, buffer);
    return;

}


/* Funciton Name: scroll_to_end_of_string
 * Returns:     none
 * Parameters:  Pointer to the string that will be displayed and scrolled
 *                 across the LCD screen.
 *
 * Purpose:     The passed string is displayd on the LCD screen and then
 *                 (only if the string length is longer than the number of
 *                 alphanumeric characters on the LCD) the passed string is
 *                 scrolled across the LCD screen until the last character
 *                 of the string is shown.
 *
 *              Any inputs from the joystick will halt the scrolling and
 *                 return to the calling function.
 *              NB: lcd_init() and initialise_joystick() need to be called
 *                 prior to calling this function.
 */
void scroll_to_end_of_string(uint8_t* outputbuffer)
{
    uint8_t i;
    uint8_t joystick_state;
    lcd_display_string(outputbuffer);
    pausems(DELAY_LONG);

    if( (strlen(outputbuffer)) <= LCD_WIDTH)
    {
        return;
    }


    for(  i = 0;
          i < strlen(outputbuffer)-LCD_WIDTH;
          i++ )
    {
        lcd_scroll(LEFT);
        pausems(DELAY_MEDIUM);
        joystick_state = get_joystick_state();
        if(joystick_state != NO_BUTTON)
            return;
    }
    pausems(DELAY_LONG);
}


/* Funciton Name: scroll_name
 * Returns:     none
 * Parameters:  Pointers to the first and last name structures.

 * Purpose:     Appends the last name to the first name and scrolls the
 *                 resulting string across the LCD. The speed and the
 *                 direction of the scrolling can be adjusted using the
 *                 joystick.
 *
 *              The initial scroll direction is left and the initial scroll
 *                 pause is set to 100ms per shift.
 *
 *              Moving the joystick left will set the scroll direction to
 *                 scroll left.
 *              Moving the joystick right will set the scroll direction to
 *                 scroll right.
 *              Moving the joystick up will increase the speed of the
 *                 scrolling name.
 *              Moving the joystick down will decrease the speed of the
 *                 scrolling name.
 *
 *              Pushing down on the joystick will exit the scrolling mode
 *                 and return to the parent menu (Display Mode select).
 */
void scroll_name(void)
{
    uint8_t joystick_direction;
    /* Append the last name to the first name with a space separator */
    strcpy( OutputString, first.name_ptr);
    strcat( OutputString, " ");
    strcat( OutputString, last.name_ptr);

    /* Set up the initial scroll speed and scroll direction */
    uint16_t scroll_pause = INITIAL_SCROLL_PAUSE;
    uint8_t  direction = LEFT;

    /* Display the first and last name on the LCD screen */
    lcd_display_string(OutputString);
    pausems(DELAY_LONG);

    /* Constantly parse the joystick inputs and adjust the scrolling
     * characteristics accordingly
     */
    while( 1 )
    {
        joystick_direction = get_joystick_state();
        lcd_scroll(direction);
        pausems(scroll_pause);

        switch(joystick_direction)
        {
            /* Exit scrolling mode if the joystick is pressed */
            case JS_PUSH:
                return;
                break;

            /* Increase the speed of the scroll if the
             * joystick is pushed up
             */
            case JS_UP:
                if(scroll_pause <= (2*SCROLL_PAUSE_STEP))
                {
                    scroll_pause = (2*MIN_SCROLL_PAUSE);
                }
                scroll_pause = scroll_pause - SCROLL_PAUSE_STEP;
                break;

            /* Decrease the speed of the scroll if the
             * joystick is pushed down
             */
            case JS_DOWN:
                scroll_pause = scroll_pause + SCROLL_PAUSE_STEP;
                if(scroll_pause >= MAX_SCROLL_PAUSE)
                {
                    scroll_pause = MAX_SCROLL_PAUSE-1;
                }
                break;

            /* Change the direction of the scroll accordingly */
            case JS_LEFT:
                direction = LEFT;
                break;

            case JS_RIGHT:
                direction = RIGHT;
                break;


            default:
                break;
        }
    }

}


/* Funciton Name: flash_name
 * Returns:     none
 * Parameters:  Pointers to the first and last name structures.

 * Purpose:     Flashes between the first and last name on the LCD screen.
 *              The speed of the flash rate can be adjusted using the joystick.
 *
 *              If the length of the first or last name is longer than six
 *                 characters the respective name will be scrolled left until
 *                 all the characters of the name have been displayed on the
 *                 LCD screen.
 *
 *              The initial flash pause is set to 100ms per shift.
 *
 *              Moving the joystick up will increase the speed of the scrolling
 *                 name and decrease the time each name is displayed on
 *                 the screen.
 *
 *              Moving the joystick down will decrease the speed of the
 *                 scrolling name and increase the time each name is displayed
 *                 on the screen.
 *
 *              Pushing down on the joystick will exit the flashing mode and
 *                 return to the parent menu (Display Mode select).
 */
void flash_name(void)
{
    uint8_t joystick_direction;

    /* If the strings cannot be loaded successfully
     * Clear the screen and return.
     */
    if( (lcd_load_strings(first.name_ptr, last.name_ptr)) == LCD_COPY_UNSUCCESSFUL )
    {
        lcd_clear();
        return;
    }

    uint16_t scroll_pause = INITIAL_SCROLL_PAUSE;
    uint8_t current_name = FIRST_NAME;
    uint8_t scroll_position = first.name_length;

    pausems(DELAY_LONG);

    while(1)
    {
        /* Scroll to the end of the string if it is longer than 6 characters */
        if( scroll_position > LCD_WIDTH )
        {
            lcd_scroll(LEFT);
            scroll_position--;
            pausems(scroll_pause);
        }

        /* Toggle the name if all name characters have been displayed */
        if( scroll_position <= LCD_WIDTH )
        {
            pausems(END_OF_STRING_PAUSE_MULTIPLIER * scroll_pause);
            current_name = lcd_toggle_string();
            pausems(END_OF_STRING_PAUSE_MULTIPLIER * scroll_pause);

            switch(current_name)
            {
                case FIRST_NAME:
                scroll_position = first.name_length;
                break;

                case LAST_NAME:
                scroll_position = last.name_length;
                break;
            }
        }

        /* Check the inputs of the joystick so the flashing mode
         * may be altered
         */
        joystick_direction = get_joystick_state();
        switch(joystick_direction)
        {
            /* Exit flashing mode if the joystick is pressed */
            case JS_PUSH:
                return;
                break;

            /* Increase the speed of the scroll and flash rate if the
             * joystick is pushed up
             */
            case JS_UP:
                if(scroll_pause <= (2*SCROLL_PAUSE_STEP))
                {
                    scroll_pause = (2*MIN_SCROLL_PAUSE);
                }
                scroll_pause = scroll_pause - SCROLL_PAUSE_STEP;
                break;

            /* Decrease the speed of the scroll and flash rate if the
             * joystick is pushed down
             */
            case JS_DOWN:
                scroll_pause = scroll_pause + SCROLL_PAUSE_STEP;

                if(scroll_pause >= MAX_SCROLL_PAUSE)
                {
                    scroll_pause = MAX_SCROLL_PAUSE - 1;
                }
                break;

            /* Change the direction of the scroll accordingly */
            case JS_LEFT:
                break;

            case JS_RIGHT:
                break;

            default:
                break;
        }
    }

}


/* Funciton Name: printProgramString
 * Returns:     Pointer to the OutputString global variable.
 * Parameters:  program_memory_ptr - Pointer to string in program memory,
 *              pausetime - The time to wait (in milliseconds) after the string
 *                 is displayed.
 *
 * Purpose:     Prints out on the LCD the string stored in program memory
 *                 pointed to by 'program_memory_ptr'. Once displayed, a wait of
 *                 'pausetime' milliseconds is executed.
 */
uint8_t* printProgramString(PGM_P program_memory_ptr, uint16_t pausetime)
{
    strcpy_P( OutputString, program_memory_ptr);
    lcd_display_string(OutputString);
    pausems(pausetime);

    return OutputString;

}


/* Funciton Name: display name
 * Returns:     none
 * Parameters:  Pointers to the first and last name structures.
 *
 * Purpose:     The handler for the display mode sub menu.
 *
 *              In this submenu, the user can select the way s/he wants the
 *                 entered name to be displayed.
 *              If this menu item is selected and their name has not yet been
 *                 entered, display name will show an error message.
 *              After the error message has been shown, it return to the main
 *                 menu.
 *
 *              Move the joystick up or down to switch between 'Flashing mode'
 *                 and 'Scrolling Mode'.
 *              Pushing the joystick or moving the joystick right will activate
 *                 the selected display mode.
 *              Move back to the main menu by moving the joystick left.
 *
 */
void display_name(void)
{
    uint8_t selected_display_mode = FLASH;
    uint8_t joystick_direction;
    menu_item display_menu[2] =
    {
        {(uint8_t*)display_mode_strings[FLASH],  (&flash_name)   },
        {(uint8_t*)display_mode_strings[SCROLL], (&scroll_name)}
    };

    /* If the first and last name strings have not been initialised
     * then print out the error message.
     */
    if( (first.name_ptr[0] == NO_NAME_ENTERED) ||
        (last.name_ptr[0] == NO_NAME_ENTERED) )
    {
        strcpy_P(OutputString, display_mode_no_strings_error);
        scroll_to_end_of_string(OutputString);
        return;
    }
    printProgramString(display_mode_strings[selected_display_mode], DELAY_LONG);

    /* Parse the joystick inputs */
    while(1)
    {
        joystick_direction = get_joystick_state();
        switch(joystick_direction)
        {
            case JS_UP:
                selected_display_mode = FLASH;
                printProgramString((PGM_P)display_mode_strings[selected_display_mode],
                                   DELAY_LONG);
                break;

            case JS_DOWN:
                selected_display_mode = SCROLL;
                printProgramString((PGM_P)display_mode_strings[selected_display_mode],
                                   DELAY_LONG);
                break;

            case JS_LEFT:
                return;
                break;

            case JS_PUSH:
            case JS_RIGHT:
                (*display_menu[selected_display_mode].function_pointer)();
                printProgramString((PGM_P)display_mode_strings[selected_display_mode],
                                   DELAY_LONG);

                break;

            default:
                break;
        }
        /*Constantly scroll the function description left */
        lcd_scroll(LEFT);
        pausems(DELAY_MEDIUM);
    }

}


/* Funciton Name: set_contrast
 * Returns:     none
 * Parameters:  none
 *
 * Purpose:     The LCD contrast is adjusted via this function.
 *
 *              The contrast level is on a scale between 0-15.
 *
 *              Moving the joystick 'up' increases the contrast.
 *              Moving the joystick 'down' decreases the contrast.
 *              Moving the joystick 'left' returns the user back to the
 *                 'main' menu.
 *
 *              The value of the contrast is displayed after the prefix
 *                 'Levl' (short for Level).
 */
void set_contrast(void)
{
    static uint8_t contrast_level = LCD_INITIAL_CONTRAST;
    uint8_t  ascii_contrast_level[MAX_CONTRAST_DIGITS];
    /* Contrast Control strings */
    lcd_clear();

    /* Parse joystick information */
    while(1)
    {
        /* If the joystick moves up, then increase the contrast */
        /* Do not let the contrast to go beyond the maximum */
        if( JOYSTICK_UP )
        {
            contrast_level++;
            if(contrast_level > LCD_MAX_CONTRAST)
            {
                contrast_level = LCD_MAX_CONTRAST;
            }
        }

        /* If the joystick moves up, then decrease the contrast */
        /* Do not let the contrast to go beyond the minimum */
        if( JOYSTICK_DOWN )
        {
            if(contrast_level == LCD_MIN_CONTRAST)
                contrast_level = LCD_MIN_CONTRAST +1;

            contrast_level--;
        }

        /* Update the contrast level */
        LCD_CONTRAST_LEVEL(contrast_level);

        /* Copy the contrast prefix string to the output buffer */
        strcpy_P(OutputString, contrast_prefix);

        /* Convert the integer number to ASCII */
        utoa( contrast_level+1, ascii_contrast_level, 10);

        /* If the contrast level is less than 10 enter a space */
        if( (contrast_level+1) < 10 )
            strcat(OutputString, " ");

        /* Append the contrast level (in ASCII) to the output buffer */
        strcat(OutputString, ascii_contrast_level);

        /* Print the string in the output buffer to the LCD */
        lcd_display_string(OutputString);
        pausems(DELAY_MEDIUM);

        /* Return to the main menu if the joystick moves left */
        if( JOYSTICK_LEFT || JOYSTICK_PUSH )
            return;
    }

}


/* Funciton Name: change_character
 * Returns:     The selected character. If the selected character cannot be
 *                 displayed on the LCD, an 'A' is returned.
 * Parameters:  character - The desired to-be selected character,
 *                 or 'UP' to select the next character in the sequence.
 *                 or 'DOWN' to select the previous character in the sequence.
 *
 * Purpose:     It returns next/previous character in the LCD to ASCII lookup
 *                 table (defined in lcdcontrol.c).
 *              It essentially skips all the LCD codes assigned to 'BLANK SCC'
 *                 execpt for one - which is used for a space.
 */
uint8_t  change_character(uint8_t new_character)
{
    static   uint8_t  character_index = START_CHARACTER;
    static   uint8_t  character_jump_flag = AFTER_ASCII_A;

    /* If moving up one character */
    if(new_character == UP)
    {
        character_index++;
        /* Skip ASCII character codes between '9' and 'A' */
        if( (character_index > '9') && (character_jump_flag == BEFORE_ASCII_A) )
        {
            character_index = 'A';
            character_jump_flag = AFTER_ASCII_A;
        }

        /* Wrap around back to the start after '_' */
        if( character_index > '_')
        {
            character_index = '*';
            character_jump_flag = BEFORE_ASCII_A;
        }

        /* Skip the ASCII character codes between 'Z' and '_' */
        if(character_index > 'Z')
        {
            character_index = '_';
            character_jump_flag = AFTER_ASCII_A;
        }

        return character_index;
    }

    /* If moving down one character */
    if(new_character == DOWN)
    {
        character_index--;

        /* Wrap around to ASCII code '_' if the user tries to go beyond '*' */
        if( character_index < '*')
        {
        character_index = '_';
        character_jump_flag = AFTER_ASCII_A;
        }

        /* Skip ASCII codes between '_' and 'Z' */
        if( (character_index < '_') && (character_index > 'Z'))
        {
        character_index = 'Z';
        character_jump_flag = AFTER_ASCII_A;
        }

        /* Skip ASCII codes between 'A' and '9' */
        if( (character_index < 'A') && (character_jump_flag == AFTER_ASCII_A) )
        {
        character_index = '9';
        character_jump_flag = BEFORE_ASCII_A;
        }

        return character_index;
    }

    /* If the desired character is not a valid character in
     * LCD_character_table (defined in lcdcontrol.c) then return an 'A'.
     * Otherwise return the selected character.
     */
    if( !((character_index >= '*') && (character_index <= '_')) )
    {
        character_index = START_CHARACTER;
        character_jump_flag = AFTER_ASCII_A;
    }
    else
    {
        character_index = new_character;
        character_jump_flag = (new_character >= 'A') ?  AFTER_ASCII_A : BEFORE_ASCII_A;
    }
    return  character_index;

}

/* Funciton Name: create_name
 * Returns:     Pointer to newly created string
 * Parameters:  The initial string to be shown on the LCD
 *                 (first 6 characters only).
 *
 * Purpose:     To create a new string with the inputs of joystick on the
 *                 AVR Butterfly.
 *
 *              Move the joystick 'UP' to cycle through to the next character in
 *                 the LCD character table (defined in lcdcontrol.c).
 *              All but one 'BLANK_SCC' character is skipped through the cycle.
 *
 *              Move the joystick 'DOWN' to cycle back to the previous character
 *                 in the LCD character table (defined in lcdcontrol.c).
 *
 *              Once an attempt to cycle beyond the last or first character will
 *                 result in a wrap-around.
 *
 *              Move the joystick 'LEFT' to backspace and edit the previously
 *                 entered character. There is always at least one character on
 *                 the LCD display.
 *
 *              Move the joystick 'RIGHT' to edit the next character.
 *              The previous character is automatically loaded into memory.
 *              The maximum number of characters per string is defined by
 *                 'MAX_STR_LENGTH'.
 */
uint8_t* create_name(uint8_t* initial_string)
{
    uint8_t  character_index = START_CHARACTER;
    uint8_t  joystick_direction;
    static uint8_t  name_length = 1;
    static uint8_t  name_ptr[MAX_STR_LENGTH+1];

    /* If there is an initial string, copy it into the output buffer */
    strcpy( name_ptr, initial_string);
    name_length = strlen(initial_string);

    /* Ensure that the length of the name is always at least 1 */
    if(name_length == 0)
    {
        name_length = 1;
        character_index = change_character(character_index);
    }
    else
    {
        character_index = change_character(initial_string[name_length-1]);
    }


    /* Clear the display */
    lcd_clear();
    pausems(DELAY_MEDIUM);

    /* Parse the joystick inputs and display the output buffer
    * on the LCD screen*/
    while(1)
    {
        /* Initialise the first letter of the output buffer */
        name_ptr[name_length-1] = character_index;

        /*Set the null character*/
        name_ptr[name_length] = 0;

        /* Display the output buffer */

        /* Scroll across the the length of the output buffer exceeds
        * the number of alphanumeric characters on the LCD */
        if( name_length > LCD_WIDTH )
        {
        lcd_display_string( &name_ptr[name_length-LCD_WIDTH]);
        }
        else
        {
        lcd_display_string(name_ptr);
        }


        /* Constantly toggle the current character which is being edited
        * by the user */
        if( (name_length) >= LCD_WIDTH+1 )
        {
        lcd_toggle_position(7);
        }
        else
        {
        lcd_toggle_position(name_length+1);
        }


        /* Parse joystick information as described in function description */
        joystick_direction = get_joystick_state();
        switch(joystick_direction)
        {
            /* Return back to main menu and reload the function descriptor
             * and ensure all LCD positions are left in their 'ON' state
             */
            case JS_PUSH:
                name_ptr[name_length] = 0;
                all_lcd_positions_on();
                lcd_display_string(name_ptr);
                scroll_to_end_of_string(name_ptr);

                return name_ptr;
                break;


            case JS_UP:
                character_index = change_character(UP);
                all_lcd_positions_on();
                pausems(DELAY_SHORTEST);
                break;

            case JS_DOWN:
                character_index = change_character(DOWN);
                all_lcd_positions_on();
                pausems(DELAY_SHORTEST);
                break;

            /* Do not allow the name_length to equal zero */
            case JS_LEFT:
                if(name_length == 1)
                    name_length = 2;

                name_length--;
                character_index = change_character(name_ptr[name_length-1]);
                break;

            case JS_RIGHT:
                name_length++;
                if(name_length >= MAX_STR_LENGTH)
                    name_length = MAX_STR_LENGTH;

                all_lcd_positions_on();
                break;

            default:
                break;
        }
        pausems(DELAY_SHORT);
    }

}


/* Funciton Name: pausems
 * Returns:     none
 * Parameters:  delay - Number of milliseconds to delay for.
 *
 * Purpose:     Do nothing and waste CPU cycles for the passed number
 *                 of seconds.
 */
void pausems(uint16_t  delay)
{
    uint16_t  i;
    for(i = 0; i < delay; i++)
    {
        _delay_ms(1);
    }
}
