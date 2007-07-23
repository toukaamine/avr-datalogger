#include <avr/io.h>
#include <avr/pgmspace.h>
#include <avr/interrupt.h>
#include <stdint.h>

#define	PARITY_MASK		(0x30)
#define	NOPARITY			(0x00)
#define	EVEN				(0x02)
#define	ODD				(0x03)

#define	CHARSIZE_MASK	(0x06)
#define 	BIT8				(0x03)
#define	BIT7				(0x02)
#define	BIT6				(0x01)
#define	BIT5				(0x00)

#define	UCSRCMASK		(0x7F)

/* Still to finish this off */
#define GAIN1 7.415
#define GAIN2 23.599

#define GAIN_DECIMAL(x) (uint16_t)( (x*1000) - GAIN_INT(x)*1000  )
#define GAIN_INT(x) (uint8_t)((x/x) * x)

uint8_t TXComplete = 1;

typedef struct _float32
{
	int16_t integer;
	uint16_t decimal;
	
} Float32_t;

const Float32_t GAIN1FP PROGMEM = {GAIN_INT(GAIN1), GAIN_DECIMAL(GAIN1)};
const Float32_t GAIN2FP PROGMEM = {GAIN_INT(GAIN2), GAIN_DECIMAL(GAIN2)};

/* Still to finish this off */
const Float32_t *SENSOR_GAIN[] = {&GAIN1FP, &GAIN2FP};


int main(void)
{
	 uint16_t testor;
	 
	 testor = pgm_read_word( &(SENSOR_GAIN[1]->decimal) );

	 int16_t text = -129;
	 int8_t text2 = (int8_t)text;

	return 0;	
}


ISR(SIG_UART_TRANS)
{
	TXComplete = 1;
}
