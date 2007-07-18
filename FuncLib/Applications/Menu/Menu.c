

#include "Menu.h"


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

static uint8_t currentState = ST_MAIN;
static uint8_t MenuInput;
static uint8_t selectedItem = 0;
static uint8_t upperLimit = WINDOW_SIZE;
static uint8_t lowerLimit = 0;
static uint8_t RowPosition = 0;
static uint8_t ColPosition = 0;


/* Menu Texts */
static const MENU_TEXT  MT_MESSAGES[] = "Messages";
static const MENU_TEXT  MT_SETTINGS[] = "Settings";
static const MENU_TEXT  MT_PROFILES[] = "Profiles";
static const MENU_TEXT  MT_TEXT[] = "Text";
static const MENU_TEXT  MT_VOICE[] = "Voice";
static const MENU_TEXT  MT_CALL_SETTINGS[] = "Call Settings";
static const MENU_TEXT  MT_PHONE_SETTINGS[] = "Phone Settings";
static const MENU_TEXT  MT_GENERAL[] = "General";
static const MENU_TEXT  MT_SILENT[] = "Silent";
static const MENU_TEXT  MT_MEETING[] = "Meeting";
static const MENU_TEXT  MT_OUTDOOR[] = "Outdoor";
static const MENU_TEXT  MT_PAGER[] = "Pager";
static const MENU_TEXT  MT_OTHER[] = "Other";
static const MENU_TEXT  MT_QUIET[] = "QUIET";

/* Once a menu item is selected, it will either end in
 * 1) Another Menu or
 * 2) A function
 * */
#if MENU_DEBUG == 1
const menu_list MenuState[] = {
#else
const menu_list MenuState[] = {
#endif

   {ST_MAIN,   ST_MESSAGES,   0},
   {ST_MAIN,   ST_SETTINGS,   1},
   {ST_MAIN,   ST_PROFILES,   2},
   
   {ST_MESSAGES, ST_TEXT,     0},
   {ST_MESSAGES, ST_VOICE,    1},
      
   {ST_SETTINGS, ST_CALL_SETTINGS,  0},
   {ST_SETTINGS, ST_PHONE_SETTINGS, 1},

   {ST_PROFILES, ST_GENERAL,  0},
   {ST_PROFILES, ST_SILENT, 1},
   {ST_PROFILES, ST_MEETING, 2},
   {ST_PROFILES, ST_OUTDOOR, 3},
   {ST_PROFILES, ST_PAGER, 4},
   {ST_PROFILES, ST_OTHER, 5},
   {ST_PROFILES, ST_QUIET, 6},   
   {0, 0, 0}
};

#if MENU_DEBUG == 1
const menu_data MenuData[] = {
#else
const menu_data MenuData[] = {
#endif
   {ST_MAIN, 0, 0},
   {ST_MESSAGES, MT_MESSAGES, 0},
   {ST_SETTINGS, MT_SETTINGS, 0},
   {ST_PROFILES, MT_PROFILES, 0},
   {ST_TEXT, MT_TEXT,  message},
   {ST_VOICE, MT_VOICE, 0},
   {ST_CALL_SETTINGS, MT_CALL_SETTINGS, 0},
   {ST_PHONE_SETTINGS, MT_PHONE_SETTINGS, 0},
   {ST_GENERAL, MT_GENERAL, 0},
   {ST_SILENT, MT_SILENT, 0},
   {ST_MEETING, MT_MEETING, 0},
   {ST_OUTDOOR, MT_OUTDOOR, 0},
   {ST_PAGER, MT_PAGER, 0},
   {ST_OTHER, MT_OTHER, 0},
   {ST_QUIET, MT_QUIET, 0},        
   {0, 0, 0}
};

/* Example of a menu function. Each menu function needs a way of 'getting'
 * back to the main menu system. It is done like so.
 */
/* All printf's should be changed to UI_LCD_String("x") */
void message(void* data)
{
   
   static uint8_t firstEnter = 1;
   uint8_t* input = 0;
   char haha = 0;
   
    
   PRINT_FUNC( PSTR("Hello!\n"));  
   input = data;

   

   if( firstEnter == 0 )
   {      
      switch( *input )
      {
         case KP_6:
            PRINT_FUNC(PSTR("You typed 6!\n\r"));
         break;
         
         case KP_A:
            PRINT_FUNC(PSTR("Yo WTF is up? \n\r"));
         break;
         
         /* Menu Function exit routine */
         case KP_BACK:
            
            MenuSetInput(KP_BACK);
            stateMachine(currentState);
            firstEnter = 1;
            MenuSetInput(0);
            MenuUpdate();
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
   RowPosition = 0;

   UI_LCD_Clear();

   UI_LCD_Pos( 0 , 0);


   /* Only switch Menu input IF we are in a menu item which has NO associated
    * function */
   if( MenuData[ GetIndex(currentState) ].function == 0 )
   {
      stateMachine( currentState ); 
   }
      

      
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
               UI_LCD_Char('^');               
            }
            
            if( SubItems(currentState) - MenuState[i].sequence  > WINDOW_SIZE)
            {
               UI_LCD_Pos(3, 19);
               UI_LCD_Char('v');
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
               UI_LCD_Char('*');    
            }
            else
            {
               UI_LCD_Char(' ');   
            }
#endif
                       

#if MENU_DEBUG == 1                  
            if( outputString )
            {
               PRINT_FUNC("%s\n", (uint8_t*)outputString );
            }
#else
            UI_LCD_String((uint8_t*)outputString);
            UI_LCD_Pos( ++RowPosition, 0);            
#endif            
         }
      }  
   }
      
   //UI_LCD_Char('\r');
   
   /* Make input a global function/variable which is changed by the button parser */
        
   //scanf("%c", &MenuInput);
   
   /* Run the associated function */      
   /* And run its function if it has one ? */   
   executeState(currentState);        
}


/* Determines the new state depending on the user input and passed state */
void stateMachine(uint8_t state)
{
   uint8_t maxStateItems;
   uint8_t parentIndex = 0;
   
   
   
   maxStateItems = SubItems(state);
   


   switch( MenuInput )
   {
      case KP_UP:
         if( selectedItem != 0 )
         {
            selectedItem--;
         }
      break;
         
      case KP_DOWN:
         selectedItem++;          
         if( selectedItem > maxStateItems )
         {
            selectedItem = maxStateItems;
         }
      break;
      
      case KP_ENTER:
         /* Go into child sub menu */
         currentState = GetMenuState(currentState, selectedItem);
         selectedItem = 0;
         upperLimit = WINDOW_SIZE;
         lowerLimit = 0;
         
      break;
      
      case KP_BACK: 
         parentIndex = GetParent(currentState);
         
         if(parentIndex != INVALID_STATE)
         {
            upperLimit = WINDOW_SIZE;
            lowerLimit = 0;
            
            currentState = MenuState[ parentIndex ].parent;
            selectedItem = MenuState[ parentIndex ].sequence; 
         }
         
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
   uint8_t maxStateItems = 0;    
   for( i = 0; MenuState[i].parent; i++)
   {
      if(MenuState[i].parent == state)
      {
         /* Obtain the number of Menu Items in the given state */
         if( MenuState[i].sequence >= maxStateItems )
         {
            maxStateItems = MenuState[i].sequence;
         } 
      }
   }
   return maxStateItems;
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


