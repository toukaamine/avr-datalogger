/*Serial TX
* By Adrian Gin (amg94@student.canterbury.ac.nz)
* Created: 5-02-06
* For AVR Core
* To use, just call (ghostbusters!)
*
* UartSetBaudRate(Bxxxx, Pin);
* UartTx(1byte datum);
* UartSetBaudRate(Bxxxx, OutPin, InPin);
*/

#include <stdint.h>
#include <avr/io.h>
#include <avr/iom8.h>



/*UartSetBaudRate setups the Timer0 to a clk/8 prescaler
 * also defines the input and output pins
 * if a 0 BaudRate is received, the function returns the settings
 * otherwise the function sets the BaudRate, Ouput and Input pin*/
#define clk8  2
#define clk64 3
uint8_t *UartSetBaudRate(uint8_t BaudRate, uint8_t OutPin, uint8_t InPin)
{ 
    static uint8_t UartSettings[3];
    if (BaudRate == 0)
    {
        return UartSettings;
    }
    UartSettings[0] = BaudRate;
    UartSettings[1] = OutPin;
    UartSettings[2] = InPin;
    
    TCCR0 = clk64;
    return UartSettings;
}


/* UartDelay: Generates the delay required for the set baudrate */
void UartDelay(uint8_t BaudRate)
{
    
    TCNT0 = 0;       /*Reset TMR0 */
    while(TCNT0 < BaudRate )
    {;}
}



/* Transmits one byte through the pin set by 'Outpin' on PortD and the set BaudRate */
#define BYTESIZE 8
void UartTx(uint8_t outbyte)
{ 
    uint8_t i;
    uint8_t *UartInfo;
    uint8_t BaudRate;
    uint8_t UartPin;
    
    UartInfo = UartSetBaudRate(0,0,0);
    BaudRate = UartInfo[0];
    UartPin  = UartInfo[1];
    
    DDRD |= (1<<UartPin); 
    
    outbyte = ~outbyte;
    /*Start Bit*/
    PORTD |= (1 << UartPin);
    UartDelay(BaudRate);
    
    for(i = 0; i < BYTESIZE; i++)
    {
        if ( (outbyte % 2) == 0)
        {
        PORTD &= ~(1 << UartPin);
        }
        else
        {
        PORTD |= (1 << UartPin);
        }
        UartDelay(BaudRate);
        outbyte = outbyte >> 1;
    }

    /*Stop Bit*/

    PORTD &= ~(1 << UartPin);
    UartDelay(BaudRate);
}




/*To write a string to the output UART*/
void serout(const uint8_t *TxDStr)
{
	uint8_t x;
	
	for (x = 0; TxDStr[x] != '\0' ;x++)
		{
			UartTx(TxDStr[x]);
		}

}

