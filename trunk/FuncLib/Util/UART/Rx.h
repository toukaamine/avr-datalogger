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
*
* eg.     
*   char *InByte;
*   InByte = serin(9);
*   serout(InByte);
*/

#ifndef	_RX_ROUTINES
#define	_RX_ROUTINES

uint8_t *serin(uint8_t Size);
uint8_t UartRx (void);


#endif




