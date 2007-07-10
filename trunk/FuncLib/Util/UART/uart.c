/* Serial Port Routines */
/* uart.c example program which echos 9 bytes received to the output*/
#include <stdint.h>
#include <string.h>
#include <avr/io.h>
#include <avr/iom8.h>
#include <stdlib.h>


#include "D:\WinAVR\dev\Pause\pause.h"
#include "Tx.h"
#include "Rx.h"



#define UARTPIN PD6
#define BRATE B2400
int main(void)
{
    DDRD = 0xFF;
    DDRD &= ~(1<<PD6);
    pausems(2000);
    UartSetBaudRate(BRATE,PD7,PD6);
    
    char *InByte;
    
    while (1)
    {
    InByte = serin(9);
    serout(InByte);
    
    
    }
    
    return 0;
}


