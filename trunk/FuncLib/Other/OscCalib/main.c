/* I2C routines for the AVR mpu's.
*  These functions utilise the hardware TWI registers
*
* By Adrian Gin (amg94@student.canterbury.ac.nz)
* Created: 16-06-06
* For AVR Core
*/


/* This is an exmaple program which utilises the UART, I2C / TWI module
 * and interfaces with a DS1624 temperature sensor*/

/* This can also be used to interface with the DS1307 RTC (real-time-clock)
 */

#include <avr/io.h>
#include <avr/iom8.h>

#include <stdlib.h>
#include <stdint.h>
#include <string.h>


#include <avr/interrupt.h>

#define F_CPU 8000000UL

#include <util/delay.h>

#include "../I2C/gettime.h"

#include "../hardUart/hardUart.h"
#include "../Pause/pause.h"
#include "../I2C/i2c.h"
#include "../PWM/pwm.h"

#include "../DS1624/DS1624.h"
#include "../DS1307/DS1307.h"
#include "../serial_ee/serial_ee.h"

/* Obsolete */
#define 	DATA_SIZE			 (5)

int main(void)
{
	int8_t* temperature;
	
	uint8_t buffer[10];
	uint8_t time[7];
	uint8_t datasize = DATA_SIZE;


	EE_AddressStruct	EE_AddressData;

	EE_AddressData.EE_Address = EE_START_ADDRESS;
	EE_AddressData.EE_Block	 = EE_START_BLOCK;

/* Data needs to be converted to BCD */
/* TM_DAY needs to be normalised */
/* TM_HOURS needs to be in 24Hr Mode*/	
	sei();
	/*Enable receive complete interrupt*/
	UCSRB |=	(1<<RXCIE);

	uartInit(BAUD9600, FAST);
	
	pwmTimer1Initialise(99, TIMER1_CLK_DIV1);
	pwmTimer1AEnable(0);


	while(1)
	{
		
	}
	return 0;	
}



ISR(SIG_UART_RECV)
{

	OSCCAL = UDR;
	
}





