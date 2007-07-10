/*Serial TX
* By Adrian Gin (amg94@student.canterbury.ac.nz)
* Created: 5-02-06
* For AVR Core
* To use, just call (ghostbusters!)
*
* UartSetBaudRate(Bxxxx);
* UartTx(1byte datum);
*
*/


#ifndef	_TX_ROUTINES
#define	_TX_ROUTINES

#define LF	10
#define CR	13

/* Uses PORTD */

uint8_t *UartSetBaudRate(uint8_t BaudRate, uint8_t OutPin, uint8_t InPin);
void UartTx(uint8_t outbyte);


/*UartDelay produces the delay required by the SW uart */
/*For speeds of 1MHz
#define B600  195
#define B1200 89
#define B2400 39
#define B4800 12
#define B9600 4*/

//For speeds of 8MHz
//Use a TMR0 prescaler of 64 if using 8MHz.
#define B600  210
#define B1200 103
#define B2400 51
#define B4800 25
#define B9600 12



void UartDelay(uint8_t BaudRate);
void serout(const uint8_t *TxDStr);




#endif


