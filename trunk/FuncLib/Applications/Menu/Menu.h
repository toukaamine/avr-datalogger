
#ifndef	_MENU_ROUTINES
#define	_MENU_ROUTINES

#define MENU_DEBUG 0

#if MENU_DEBUG == 0
#include <avr/pgmspace.h>
#define PRINT_FUNC   UI_LCD_String_P
#define MENU_TEXT    prog_char
#endif

#if MENU_DEBUG == 1
#include "stdint.h"
#define PSTR(x) (x)
#define PRINT_FUNC   printf
#define MENU_TEXT    char
#endif

#define NO_STATE     0
#define INVALID_STATE 255
#define INVALID_SEQUENCE 255

#define MAIN_MENU    ST_MAIN
#define MENU_LCD  0
#define MENU_UART 1



/* Could use enumeration */
#define ST_MAIN      10
#define ST_MESSAGES  11
#define ST_TEXT      12
#define ST_VOICE     13
#define ST_SETTINGS  14
#define ST_CALL_SETTINGS    15
#define ST_PHONE_SETTINGS  16 
#define ST_PROFILES  17
#define ST_GENERAL   18
#define ST_SILENT 19
#define ST_OUTDOOR 20
#define ST_MEETING 21
#define ST_PAGER 22
#define ST_OTHER 23
#define ST_QUIET 24

#define WINDOW_SIZE 3

#if MENU_DEBUG == 1

#define KP_1   '1'
#define KP_2   '2'
#define KP_3   '3'
#define KP_4   '4'
#define KP_5   '5'
#define KP_6   '6'
#define KP_7   '7'
#define KP_8   '8'
#define KP_9   '9'



#endif

#define KB_UP '8'
#define KB_DOWN '2'
#define KB_ENTER '6'
#define KB_BACK  '4'

#define KP_UP  KP_2
#define KP_DOWN KP_8
#define KP_ENTER KP_6
#define KP_BACK  KP_4


void message(void* data);

typedef struct
{
   uint8_t  parent;
   uint8_t  child;
   uint8_t  sequence;
   
} menu_list;


typedef struct
{
   uint8_t  menu_item;
   
#if MENU_DEBUG == 1   
   const char* descriptor;
#else
   PGM_P descriptor;   
#endif
   void (*function)(void* data);

} menu_data;


void LCD_NewLine(void);
void LCD_Reset(void);

/* Menu Uart Functions */
void MenuUart_NewLine(void);
void MenuUartTxString(uint8_t* string);
void MenuUartTxString_P(const char* string);
void MenuUart_Reset(void);


void MenuSetDisplay(uint8_t display);

void MenuSetInput(uint8_t NewInput);

void MenuUpdate(void);
char* MenuDescriptor(uint8_t menuItem);
void stateMachine(uint8_t CurrentState);
uint8_t GetMenuState(uint8_t state, uint8_t Sequence);
uint8_t GetParent(uint8_t state);
uint8_t SubItems(uint8_t state);
uint8_t GetIndex(uint8_t parent);
void executeState(uint8_t state);





#endif








