/* ADC.h
 * ADC Routines for the AVR Mega8
 *
 * Date: 16/04/06
 * Author : Adrian Gin (amg94@student.canterbury.ac.nz)
 *
 *
 */
 /* To perform conversion either call: 
 * adcInitialise();
 * adcSetPin(ADC Input);
 * result = adc10(); (or adc8();) 
 *
 */

/* To perform conversion either call: 
 * adcSetPrescale(prescale);
 * adcSetReference(reference);
 * adcSetPin(ADC Input)
 * adcOn();
 * result = adc10(); (or adc8();) 
 *
 */
 

#ifndef 	_ADC_ROUTINES
#define	_ADC_ROUTINES

/* ADC Reference voltage */
#define ADC_REF_AREF 0x00
#define ADC_REF_AVCC 0x01	/*Default value*/
#define ADC_REF_VINT 0x03

#define ADC_REF_DEFAULT ADC_REF_AVCC

/* ADC Input Pin */
#define ADC_PIN0 		0x00
#define ADC_PIN1     0x01
#define ADC_PIN2 		0x02
#define ADC_PIN3     0x03
#define ADC_PIN4 		0x04
#define ADC_PIN5     0x05
#define ADC_PIN6 		0x06
#define ADC_PIN7     0x07
/**/
#define ADC_1V23 		0xFE
#define ADC_GND      0xFF
/**/

#define ADC_REF_MASK 0xC0
#define ADC_PIN_MASK 0x0F


/* A2D clock prescaler select
		*selects how much the CPU clock frequency is divided
		to create the A2D clock frequency
		*lower division ratios make conversion go faster
		*higher division ratios make conversions more accurate*/
#define ADC_PRESCALE_DIV2		0x01	///< 0x01,0x00 -> CPU clk/2
#define ADC_PRESCALE_DIV4		0x02	///< 0x02 -> CPU clk/4
#define ADC_PRESCALE_DIV8		0x03	///< 0x03 -> CPU clk/8
#define ADC_PRESCALE_DIV16		0x04	///< 0x04 -> CPU clk/16
#define ADC_PRESCALE_DIV32		0x05	///< 0x05 -> CPU clk/32
#define ADC_PRESCALE_DIV64		0x06	///< 0x06 -> CPU clk/64 and Default value
#define ADC_PRESCALE_DIV128	0x07	///< 0x07 -> CPU clk/128

#define ADC_PRESCALE_DEFAULT ADC_PRESCALE_DIV64
#define ADC_PRESCALE_MASK		0x07

void adcInitialise(void);
void adcSetPrescale(uint8_t prescale);
void adcSetReference(uint8_t reference);
void adcSetPin(uint8_t ADCPin);
void adcStartConversion(void);
void adcOff(void);
void adcOn(void);
uint16_t adc10(void);
uint8_t adc8(void);



#endif

