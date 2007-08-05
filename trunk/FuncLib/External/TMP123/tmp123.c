/** Uses the TMP123 without requiring the SPI bus */

#include <avr/io.h>
#include <stdint.h>

#include "tmp123.h"


void TMP123_Init(void)
{
	TMP123_DDR &= ~(1 << TMP123_SO);
	TMP123_DDR |=  (1 << TMP123_nCS) | (1 << TMP123_SCK);
	
	TMP123_PORT |= (1 << TMP123_nCS) | (1 << TMP123_SO);
	TMP123_PORT &= ~(1 << TMP123_SCK);
}

/* Once the chip's temperature is obtained the chip is placed in shutdown */
int16_t TMP123_GetTemp(void)
{
	int16_t result;
	uint8_t i;
	
	TMP123_PORT &= ~(1 << TMP123_nCS);	
	
	
	for( i = 0; i < 16 ; i++)
	{
		TMP123_PORT |= (1 << TMP123_SCK);
		result = result << 1;
		
		if( TMP123_PIN & ( 1 << TMP123_SO ) )
		{
			result += 1;	
		}		
	
		TMP123_PORT &= ~(1 << TMP123_SCK);

	}
	
	TMP123_PORT |= (1 << TMP123_nCS);
	
	result = result / 128;
	return result;
}








