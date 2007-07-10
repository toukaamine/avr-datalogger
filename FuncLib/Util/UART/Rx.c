/*Serial RX
* By Adrian Gin (amg94@student.canterbury.ac.nz)
* Created: 06-02-06
* For AVR Core
* To use, just call (ghostbusters!)
*
* UartSetBaudRate(Bxxxx, OutPin, InPin);
*
* So Byte has the contents of an incoming char.
* Byte = UartRx();
*
*
* char* = serin(size of bytes);
*/
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include <avr/io.h>
#include <avr/iom8.h>

#include "Tx.h"
#include "Rx.h"



/* Receive one byte from the input pin 'InPin' at the set BaudRate */
#define BYTESIZE 8
uint8_t UartRx (void)
{
    uint8_t i;
    uint8_t Incoming;
    
    uint8_t RxPin;
    
    uint8_t *UartInfo;
    uint8_t BaudRate;
    
    UartInfo = UartSetBaudRate(0,0,0);
    BaudRate = UartInfo[0];
    RxPin    = UartInfo[2];
    
    /*make selected pin an input*/
    DDRD &= ~(1<<RxPin); 
    
    /*Wait for a 'high' start bit*/
    while((PIND & (1 << RxPin)) == 0)
    {
    PORTD &= ~(1<<RxPin);
    }
    
    /*Once received, wait 1.5 bit times*/
    UartDelay(BaudRate+(BaudRate/2));
    
    /*If it is high, write a 'low', if it is low, write a high*/
    for(i = 0; i < BYTESIZE; i++)
    {
    Incoming >>= 1;    
        if((PIND && (1 << RxPin)) == 0)
        {
        Incoming += 0x80;
        }
   
    UartDelay(BaudRate);
    }

    return (Incoming);
}


/* Receive a string of length 'size' from the Input Pin 'InPin' at the set BaudRate */ 

uint8_t *serin(uint8_t Size)
{
    uint8_t i;
 
    static char *InByte;
    /*InByte must be freed*/
    free(InByte);
    
    /*Allocate some memory for the incoming string*/
    /*Return a 1 if malloc cannot find a piece of memory*/
    if( (InByte = malloc(Size+1)) == 0)
        {
        return (uint8_t*)1;
        }
    
    /*Place the incoming letters in the string in the InByte array with a null-termination*/
    
    for( i = 0; i < Size; i++)
        {
        InByte[i] = UartRx();
        }
    
    InByte[Size] = 0;
    return InByte;
}


