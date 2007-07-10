#ifndef	_UI_KP_ROUTINES
#define	_UI_KP_ROUTINES

#include <avr/pgmspace.h>


/* Key Pad Inputs */
#define UI_COL0   (MAX7300_P28)
#define UI_COL1   (MAX7300_P27)
#define UI_COL2   (MAX7300_P26)
#define UI_COL3   (MAX7300_P25)
#define UI_ROW3   (MAX7300_P24)
#define UI_ROW2   (MAX7300_P23)
#define UI_ROW1   (MAX7300_P22)
#define UI_ROW0   (MAX7300_P21)

#define UI_COL_PORT (0x59)
#define UI_ROW_PORT (0x55)



/* KeyPad Defines */
/* 1st Row */
#define KP_1   (0x77)
#define KP_2   (0xB7)
#define KP_3   (0xD7)
#define KP_A   (0xE7)

/* 2nd Row */
#define KP_4   (0x7B)
#define KP_5   (0xBB)
#define KP_6   (0xDB)
#define KP_B   (0xEB)

/* 3rd Row */
#define KP_7   (0x7D)
#define KP_8   (0xBD)
#define KP_9   (0xDD)
#define KP_C   (0xED)

/* 4th Row */
#define KP_STAR   (0x7E)
#define KP_0   (0xBE)
#define KP_HASH   (0xDE)
#define KP_D   (0xEE)


#define KP_ButtonCount  (16)
#define KP_INVALID   (0x00)




void UI_KP_Init(void);
uint8_t UI_KP_GetPress(void);




#endif
