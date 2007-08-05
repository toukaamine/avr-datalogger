/* ADC1213 Routines for the ATMEGA Micro
 * Author: Adrian Gin
 * Date: 27/06/07
 *
 */

/* File Name	: 'ads1213.h'
 	Title			: Burr Brown 22-bit ADC
 	Author		: Adrian Gin


*/

/** \file ads1213.h
	 \brief Burr Brown 22-bit ADC Interface.
*/

/**	 

	\ingroup avr_external
 	\defgroup ads1213 Burr Brown 22-bit ADC Interface.
 	\code #include "ads1213.h" \endcode

 	 
	 \par Description
	This library allows the use of an SPI controlled ADS1213.
	The ADS1213 is a 22-bit ADC.
 	 
*/
//@{


#ifndef	_ADS1213_ROUTINES
#define	_ADS1213_ROUTINES

#include <stdint.h> 
#include <math.h> 
 
#define ADS1213_CLK        (2e6)
#define ADS1213_CS_DDR     (DDRA)
#define ADS1213_CS_PIN     (PA0)
#define ADS1213_CS_PORT    (PORTA)  

#define ADS1213_ENOB		22
#define ADS1213_MAXOUTPUT ( pow(2,ADS1213_ENOB) - 1)

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
#define ADS1213_BIAS       (7)
#define ADS1213_REFO       (6)
#define ADS1213_DF         (5)
#define ADS1213_UNIPOLAR   (4)
#define ADS1213_SDL        (1)
#define ADS1213_DRDY       (0)
#define ADS1213_DSYNC      (0)

/* Byte 2 */
#define ADS1213_MD2        (7)
#define ADS1213_MD1        (6)
#define ADS1213_MD0        (5)

/* Operating Modes */
#define ADS1213_SELFCALIB  (0x01) << (ADS1213_MD0)
#define ADS1213_SLEEP      (0x06) << (ADS1213_MD0)
#define ADS1213_NORMAL     (0x00) << (ADS1213_MD0)

/* Maximum Decimation Ratio */
#define ADS1213_MAX_DCR		(8000)
#define ADS1213_MIN_DCR		(20)

/* Byte 1 */
#define ADS1213_SF2        (7)
#define ADS1213_SF1        (6)
#define ADS1213_SF0        (5)

/* The 23th bit holds the busy signal 
 * ie the 6th bit of Byte[2]*/
#define ADS1213_BUSY       (0x1FFFFFFF)

#define ADS1213_SIGN_BIT   (0x80)
typedef union ADS1213_data 
{
   uint8_t  byte[4];
   uint32_t result;
   float    FPresult;  
} ADS1213Data_t;

extern int16_t ADS1213_DecimationRatio;


#define ADS1213_RxByte() ADS1213_TxByte(0xFF)

/* CPHA = 1 is required  for this ADC,
 * CPHA = 1 required for the DS1305 as well*/

uint8_t ADS1213_TxByte(uint8_t data);

void ADS1213_Init(void);
uint32_t ADS1213_GetResult(void);
void ADS1213_CS_Pulse(void);
void ADS1213_Shutdown(void);
void ADS1213_Startup(void);
void ADS1213_Reset(void);
void ADS1213_PsuedoCalib(void);
int32_t uint24_tSign(ADS1213Data_t data);

#endif
