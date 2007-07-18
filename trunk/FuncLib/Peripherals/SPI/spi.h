/* SPI Routines for the ATMEGA Micro
 * Author: Adrian Gin
 * Date: 27/06/07
 *
 */
 

#ifndef	_SPI_ROUTINES
#define	_SPI_ROUTINES
 
 
 
#define SPI_DDR   (DDRB)
#define SPI_PORT  (PORTB)
#define SCK       (PB7)
#define MISO      (PB6)
#define MOSI      (PB5)
#define nSS       (PB4)

#define TRANSFER_COMPLETE     (1)
#define TRANSFER_INCOMPLETE   (0)

void SPI_Init(void);
uint8_t SPI_TxByte(uint8_t data);
uint8_t SPI_RxByte(void);
void SPI_RxBlock(uint8_t* data, uint8_t n);
void SPI_TxBlock(uint8_t* data, uint8_t n);

#endif
