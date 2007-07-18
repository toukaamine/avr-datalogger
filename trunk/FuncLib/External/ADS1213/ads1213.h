/* ADC1213 Routines for the ATMEGA Micro
 * Author: Adrian Gin
 * Date: 27/06/07
 *
 */


#ifndef	_ADS1213_ROUTINES
#define	_ADS1213_ROUTINES

#include <stdint.h> 
 
#define ADS1213_CLK        (2e6)
#define ADS1213_CS_DDR     (DDRA)
#define ADS1213_CS_PIN     (PA0)
#define ADS1213_CS_PORT    (PORTA)  



/* Instruction Register Bits */
#define ADS1213_RW         (7)
#define ADS1213_MB1        (6)
#define ADS1213_MB0        (5)
#define ADS1213_A3         (3)
#define ADS1213_A2         (2)
#define ADS1213_A1         (1)
#define ADS1213_A0         (0)

/* Command Register Bits */
/* Byte 3 */
#define ADS1213_REFO       (6)
#define ADS1213_SDL        (1)
#define ADS1213_DRDY       (0)

/* Byte 2 */
#define ADS1213_MD2        (7)
#define ADS1213_MD1        (6)
#define ADS1213_MD0        (5)

/* Byte 1 */
#define ADS1213_SF2        (7)
#define ADS1213_SF1        (6)
#define ADS1213_SF0        (5)

/* The 23th bit holds the busy signal 
 * ie the 6th bit of Byte[2]*/
#define ADS1213_BUSY       (0xFFFFFFFF)
typedef union ADS1213_data 
{
   uint8_t  byte[3];
   uint32_t result;  
} ADS1213Data_t;
 

#define ADS1213_RxByte ADS1213_TxByte(0xFF)

/* CPHA = 1 is required  for this ADC,
 * CPHA = 1 required for the DS1305 as well*/

uint8_t ADS1213_TxByte(uint8_t data);

void ADS1213_Init(void);
uint32_t ADS1213_GetResult(void);
void ADS1213_CS_Pulse(void);
void ADS1213_Shutdown(void);
void ADS1213_Startup(void);




#endif
