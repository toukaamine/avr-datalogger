

#include "Menu.h"
#include "hardUart/hardUart.h"
#include "uartTerm/userFunctions.h"

#if MENU_DEBUG == 1
#include <stdio.h>
#include <string.h>
#include "stdint.h"
#endif


#if MENU_DEBUG == 0
#include <stdint.h>
#include "UI_LCD/UI_LCD.h"
#include "UI_KP/UI_KP.h"
#endif



enum {  
   ST_MAIN = 10,
   ST_NEW_RECORDING,
   ST_VIEW_CHANNELS,
   ST_STATISTICS,
   ST_SD_CARD_SIZE,
   ST_TOTAL_SAMPLES,
   ST_UPTIME,
   ST_DATA_DOWNLOAD,
   ST_OPTIONS,
   ST_SET_TIME,
   ST_CALIBRATE,
   ST_FORMAT_SD,
   ST_RESET,
   ST_VERSION_INFO,
   ST_DISPLAY_MODE,
   ST_UART_MODE,
   ST_LCD_MODE,
   ST_EXTRA_MODE,
} menuIds;

uint8_t currentState = ST_MAIN;
uint8_t RowPosition = 0;
static uint8_t MenuInput;
uint8_t selectedItem = 0;
uint8_t upperLimit = WINDOW_SIZE;
uint8_t lowerLimit = 0;
uint8_t firstEnter = 1;

const MENU_TEXT  MT_NEW_RECORDING[] = "Start New Recording";
const MENU_TEXT  MT_VIEW_CHANNELS[] = "View Channels";
const MENU_TEXT  MT_STATISTICS[] = "Statistics";
const MENU_TEXT  MT_SD_CARD_SIZE[] = "SD Card Usage";
const MENU_TEXT  MT_TOTAL_SAMPLES[] = "Total Samples Taken";
const MENU_TEXT  MT_UPTIME[] = "Uptime";
const MENU_TEXT  MT_DATA_DOWNLOAD[] = "Data Download";
const MENU_TEXT  MT_OPTIONS[] = "Options";
const MENU_TEXT  MT_SET_TIME[] = "Set Time";
const MENU_TEXT  MT_CALIBRATE[] = "Calibrate";
const MENU_TEXT  MT_FORMAT_SD[] = "Format Memory";
const MENU_TEXT  MT_RESET[] = "Reset";
const MENU_TEXT  MT_VERSION_INFO[] = "Version ID";
const MENU_TEXT  MT_DISPLAY_MODE[] = "Set Display Mode";
const MENU_TEXT  MT_UART_MODE[] = "Terminal Mode";
const MENU_TEXT  MT_LCD_MODE[] = "Keypad Mode";
const MENU_TEXT  MT_EXTRA_MODE[] = "EXTRA Mode";

void MenuSetDisplay(uint8_t display)
{
   if(display == MENU_LCD)
   {
      MenuPrint = UI_LCD_String;
      MenuPrint_P = UI_LCD_String_P;
      MenuNewLine = LCD_NewLine;
      MenuReset = LCD_Reset;
   }
   /* Route output to UART */
   else
   {
      MenuPrint = MenuUartTxString;
      MenuPrint_P = MenuUartTxString_P;
      MenuNewLine = MenuUart_NewLine;
      MenuReset = MenuUart_Reset;      
   }
}







/* Once a menu item is selected, it will either end in
 * 1) Another Menu or
 * 2) A function
 * */
#if MENU_DEBUG == 1
const menu_list MenuState[] = {
#else
const menu_list MenuState[] = {
#endif

   {ST_MAIN,   ST_NEW_RECORDING,   0},
   {ST_MAIN,   ST_VIEW_CHANNELS,   1},
   {ST_MAIN,   ST_DATA_DOWNLOAD,   2},
   {ST_MAIN,   ST_OPTIONS,   3},
   {ST_MAIN,   ST_STATISTICS,   4},   
   
   {ST_STATISTICS, ST_SD_CARD_SIZE,     0},
   {ST_STATISTICS, ST_TOTAL_SAMPLES,    1},
   {ST_STATISTICS, ST_UPTIME,    2},
      
   {ST_OPTIONS, ST_SET_TIME,  0},
   {ST_OPTIONS, ST_CALIBRATE, 1},
   {ST_OPTIONS, ST_FORMAT_SD, 2},
   {ST_OPTIONS, ST_VERSION_INFO, 3},
   {ST_OPTIONS, ST_RESET, 4},
   {ST_OPTIONS, ST_DISPLAY_MODE, 5},  
   
   {ST_DISPLAY_MODE, ST_UART_MODE,  2},
   {ST_DISPLAY_MODE, ST_LCD_MODE, 3},   
   {ST_DISPLAY_MODE, ST_EXTRA_MODE, 4},    
   
   {0, 0, 0}
};





#if MENU_DEBUG == 1
const menu_data MenuData[] = {
#else
const menu_data MenuData[] = {
#endif
   {ST_MAIN, 0, 0},
   {ST_NEW_RECORDING, MT_NEW_RECORDING, message},
   {ST_VIEW_CHANNELS, MT_VIEW_CHANNELS, 0},
   {ST_STATISTICS, MT_STATISTICS, 0},
   {ST_SD_CARD_SIZE, MT_SD_CARD_SIZE, 0},
   {ST_TOTAL_SAMPLES, MT_TOTAL_SAMPLES, 0},
   {ST_UPTIME, MT_UPTIME, 0},
   {ST_DATA_DOWNLOAD, MT_DATA_DOWNLOAD, 0},
   {ST_OPTIONS, MT_OPTIONS, 0},
   {ST_SET_TIME, MT_SET_TIME, 0},
   {ST_CALIBRATE, MT_CALIBRATE, 0},
   {ST_FORMAT_SD, MT_FORMAT_SD, 0},
   {ST_RESET, MT_RESET, Reset},
   {ST_VERSION_INFO, MT_VERSION_INFO, 0},
   {ST_DISPLAY_MODE, MT_DISPLAY_MODE, MenuDisplayMode},
   {ST_UART_MODE, MT_UART_MODE, MenuSetUartMode},
   {ST_LCD_MODE, MT_LCD_MODE, MenuSetLCDMode},
   {ST_EXTRA_MODE, MT_EXTRA_MODE, 0},   
   {0, 0, 0}
};


void LCD_NewLine(void)
{
   UI_LCD_Pos(++RowPosition, 0);
}

void LCD_Reset(void)
{
   UI_LCD_Clear();
   UI_LCD_Pos(0, 0);
   RowPosition = 0;
}

/* Uart Functions also route to the LCD */
void MenuUart_NewLine(void)
{
   uartTxString_P( PSTR("\n\r") );
   LCD_NewLine();
}


void MenuUartTxString(uint8_t* string)
{
   uartTxString(string);
   UI_LCD_String(string);
}

void MenuUartTxString_P(const char* string)
{
   uartTxString_P(string);
   UI_LCD_String_P(string);
}

void MenuUart_Reset(void)
{
   uint8_t i;
 
   for( i = 0; i < 30; i++)
   {
      MenuUart_NewLine();
   }
   
   LCD_Reset();
   
}



/* Example of a menu function. Each menu function needs a way of 'getting'
 * back to the main menu system. It is done like so.
 */
/* All printf's should be changed to UI_LCD_String("x") */
void message(void* data)
{
   uint8_t* input = 0;
   char haha = 0;
   
    
   MenuPrint_P( PSTR("Hello!"));
   MenuNewLine();  
   input = data;

   if( firstEnter == 0 )
   {      
      switch( *input )
      {
         case KP_6:
            MenuPrint_P(PSTR("You typed 6!"));
            MenuNewLine();
            
         break;
         
         case 'a':
            MenuPrint_P(PSTR("Yo WTF is up?"));
            MenuNewLine();
         break;
         
         case 'e':
            MenuPrint_P(PSTR("Exiting UART Mode..."));
            MenuSetLCDMode();
            break;
         
         
         /* Menu Function exit routine */
         case KB_BACK:
         case KP_BACK:
          
            MenuSetInput(KP_BACK);
            stateMachine(currentState);
            MenuSetInput(0);
            return;
            
            break;
            
         
         default:
            break;
      }
      
   }
   
   firstEnter = 0;
   
}


void MenuUpdate(void)
{
   uint8_t i;   
   uint8_t sequenceIndex = 0;
   uint8_t sequenceParent;
   char* outputString;
   
   MenuReset();

   /* Only switch Menu input IF we are in a menu item which has NO associated
    * function */
   /*
   if( MenuData[ GetIndex(currentState) ].function == 0 )
   {
      stateMachine( currentState ); 
   } */
   
   stateMachine( currentState );       

   /* Run the associated function */      
   /* And run its function if it has one ? */   
   executeState(currentState);    
   
   /** Print out the menu's sub-menu's */   
   /* Ensures that the screen limits are not exceeded */
   for( i = 0, sequenceIndex = 0;  (MenuState[i].parent != 0) ; i++)
   {  
      /* Find the current state's sub children. */        
      if( MenuState[i].parent == currentState )
      {  
         outputString = MenuDescriptor(MenuState[i].child);
         sequenceIndex = MenuState[i].sequence;
         
         
         if( selectedItem > upperLimit )
         {
            upperLimit = selectedItem;
            lowerLimit = upperLimit - WINDOW_SIZE;   
         }
            
         if( selectedItem < lowerLimit )
         {
            lowerLimit = selectedItem;
            upperLimit = lowerLimit + WINDOW_SIZE;               
         }
         
         /* If this is the selected item then prefix an asterix */
         if( (sequenceIndex <= upperLimit) && (sequenceIndex >= lowerLimit) )
         {
            if(MenuState[i].sequence > WINDOW_SIZE)
            {
               UI_LCD_Pos(0, 19);
               MenuPrint_P( PSTR("^") );               
            }
            
            if( SubItems(currentState) - MenuState[i].sequence  > WINDOW_SIZE)
            {
               UI_LCD_Pos(3, 19);
               MenuPrint_P( PSTR("v") );
            }
            
            UI_LCD_Pos(RowPosition, 0); 
            
            if(MenuState[i].sequence == selectedItem)
            {
#if MENU_DEBUG == 1  
               printf("*");    
            }
            else
            {
               printf(" ");   
            }
#else
               MenuPrint_P( PSTR("*") );    
            }
            else
            {
               MenuPrint_P( PSTR(" ") );   
            }
#endif
                       

#if MENU_DEBUG == 1                  
            if( outputString )
            {
               PRINT_FUNC("%s\n", (uint8_t*)outputString );
            }
#else
            MenuPrint((uint8_t*)outputString);
            MenuNewLine();            
#endif            
         }
      }  
   }
      
   //UI_LCD_Char('\r');
   
   /* Make input a global function/variable which is changed by the button parser */
        
   //scanf("%c", &MenuInput);
   
    
}


/* Determines the new state depending on the user input and passed state */
void stateMachine(uint8_t state)
{
   uint8_t maxStateItems;
   uint8_t parentIndex = 0;
   
   
   
   maxStateItems = SubItems(state);
   
   

   switch( MenuInput )
   {
      case KB_UP:
      case KP_UP:
         if(!(selectedItem <= SmallestSequence(currentState)) )
         {
            selectedItem--;
         }
      break;
         
      case KB_DOWN:   
      case KP_DOWN:
         selectedItem++;          
         if( selectedItem - SmallestSequence(currentState) > maxStateItems )
         {
            selectedItem = LargestSequence(currentState);
         }
      break;
      
      case KB_ENTER:
      case KP_ENTER:
         /* Go into child sub menu */
         currentState = GetMenuState(currentState, selectedItem);
         selectedItem = MenuState[currentState].sequence;
         upperLimit = WINDOW_SIZE;
         lowerLimit = 0;
         
      break;
      
      case KB_BACK:
      case KP_BACK: 
         /** Need to reset the 'first' enter flag */
         /** This is so that the commands of a function are not
          * executed on entering the associated sub-menu */
         firstEnter = 1;
         
                    
         parentIndex = GetParent(currentState);
         
         if(parentIndex != INVALID_STATE)
         {
            upperLimit = WINDOW_SIZE;
            lowerLimit = 0;
            
            currentState = MenuState[ parentIndex ].parent;
            selectedItem = MenuState[ parentIndex ].sequence; 
         }
      break;     
      
      default:
      break;   
   }

   /* Revert back to initial state */
   if(currentState == NO_STATE || parentIndex == INVALID_STATE)
   {
      currentState = state;       
   }
}

/* Returns the Menu descriptor given the menu Item / Index */
char* MenuDescriptor(uint8_t menuItem)
{

   uint8_t index;
   static char buffer[21];
      
   index = GetIndex(menuItem);
   
   if( index  != INVALID_STATE )
   {
      
#if MENU_DEBUG == 1     
      strcpy( buffer, MenuData[index].descriptor);
#else
      strcpy_P(buffer, MenuData[index].descriptor);
#endif
      return buffer;
   }
   return 0;
}


/* Returns the corresponding MenuState 
 * given the Parent State and its sequnce. */
uint8_t GetMenuState(uint8_t state, uint8_t Sequence)
{
   int i;
   for( i = 0; MenuState[i].parent; i++)
   {
      if( (MenuState[i].parent == state) 
       && (MenuState[i].sequence == Sequence) ){      
         return MenuState[i].child;
      }
   }
   return NO_STATE;
}

/* Get out the first instance of where the given state
 * origninates from */
uint8_t GetParent(uint8_t state)
{
 
   int i;  
   for( i = 0; MenuState[i].parent; i++)
   {
      if(MenuState[i].child == state) {      
         return i;
      }
   }
   return INVALID_STATE;
}

void MenuSetInput(uint8_t NewInput)
{

   MenuInput = NewInput;    
   
}

void executeState(uint8_t state)
{
   uint8_t index;
   index = GetIndex(state);
   
   if(index != INVALID_STATE)
   {
      if( MenuData[index].function != 0)
      {
         MenuData[index].function(&MenuInput);
      }
   }
   
   
}

/* Get the element in MenuData which has 'parent' */
uint8_t GetIndex(uint8_t parent)
{
   uint8_t i;
   for( i = 0; MenuData[i].menu_item; i++)
   {
      if(MenuData[i].menu_item == parent)
      {
         return i;   
      } 
   }
   
   return INVALID_STATE;
   
}

/* Get the number of sub items in the passed state */
uint8_t SubItems(uint8_t state)
{
   int i;
   uint8_t StateItems = 0;    
   for( i = 0; MenuState[i].parent; i++)
   {
      if(MenuState[i].parent == state)
      {
         StateItems++;
      }
   }
   return (StateItems - 1);
}

/* Get the maximum sequence of the the passed state */
uint8_t LargestSequence(uint8_t state)
{
   int i;
   uint8_t StateItem = 0;    
   for( i = 0; MenuState[i].parent; i++)
   {
      if(MenuState[i].parent == state)
      {
         /* Obtain the number of Menu Items in the given state */
         if( MenuState[i].sequence >= StateItem )
         {
            StateItem = MenuState[i].sequence;
         } 
      }
   }
   return (StateItem);
}

uint8_t SmallestSequence(uint8_t state)
{
   int i;
   uint8_t StateItem = 0xFF;    
   for( i = 0; MenuState[i].parent; i++)
   {
      if(MenuState[i].parent == state)
      {
         /* Obtain the number of Menu Items in the given state */
         if( MenuState[i].sequence <= StateItem )
         {
            StateItem = MenuState[i].sequence;
         } 
      }
   }
   return (StateItem);
}


/* Returns the sequence given the menu state */
uint8_t GetSequence(uint8_t parent, uint8_t child)
{
   uint8_t parentIndex;
   uint8_t i;
   
   parentIndex = GetIndex(parent);
   

   for( i = 0; MenuState[i].parent; i++)
   {
      if( MenuState[i].parent == parent &&
          MenuState[i].child  == child )
      {
         return MenuState[i].sequence;     
      }
   }      
   return INVALID_SEQUENCE;
}


