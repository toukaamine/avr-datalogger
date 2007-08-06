/** \file GainSensorFP.h
	 \brief Gain and Sensor control with Floating Point
*/

/**	 

	\ingroup avr_datalogger
 	\defgroup GainSensorFP Gain and Sensor Control
 	\code #include "GainSensorFP.h" \endcode

 	 
	 \par Description
	An avr-datalogger platform specific library which allows
	an interface with the gain and sensor control hardware.
 	 
*/
//@{



#ifndef	_GSFP_ROUTINES
#define	_GSFP_ROUTINES

#include "MAX7300/max7300.h"
#include "MSB2LSB/MSB2LSB.h"
#include "ADS1213/ads1213.h"
#include "mmculib/uint16toa.h"
#include "mmculib/uint8toa.h"

#define SENSOR_MACRO 0

#define GS_MAX7300_ADDRESS   (0x98)
#define GS_SENSOR_PORT       (0x4C)
#define GS_GAIN_PORT         (0x52)

#define GS_SENSOR_MASK       (0x1F)
#define GS_GAIN_MASK         (0x3F)

#define GS_GAIN_A    (4)
#define GS_GAIN_B    (2)
#define GS_GAIN_C    (3)
#define GS_GAIN_D    (5)
#define GS_GAIN_E    (0)
#define GS_GAIN_F    (1)


#define GS_ReadRegister(reg)  MAX7300_ReadRegister(GS_MAX7300_ADDRESS, reg)
#define GS_SetRegister(reg, data)  MAX7300_SetRegister(GS_MAX7300_ADDRESS, reg, data)


/** Switch combinations which produce the given gain */
#define GS_GAIN_9P6	( (1 << GS_GAIN_A) | (1 << GS_GAIN_B) | (1 << GS_GAIN_C) | (1 << GS_GAIN_F))
#define GS_GAIN_2P5	( (1 << GS_GAIN_B) | (1 << GS_GAIN_C) | (1 << GS_GAIN_F) )
#define GS_GAIN_0P4	( (1 << GS_GAIN_D) | (1 << GS_GAIN_F))
#define GS_GAIN_0P09	( (1 << GS_GAIN_C) | (1 << GS_GAIN_E) | (1 << GS_GAIN_F))
#define GS_GAIN_0P04	( (1 << GS_GAIN_D) | (1 << GS_GAIN_E))

enum {
   GAIN9P6X = 0, GAIN2P5X, GAIN0P4X,
   GAIN0P09X, GAIN0P04
} GainsM;

/** Gains in FP */
#define GAIN_9P6FP	9.615
#define GAIN_2P5FP	2.472
#define GAIN_0P4FP	0.4167
#define GAIN_0P09FP	0.0649
#define GAIN_0P04FP	0.0417

/** Gain offsets */
#define GAIN_9P6O		450e3
#define GAIN_2P5O		115e3
#define GAIN_0P4O		20e3
#define GAIN_0P09O	2500
#define GAIN_0P04O	500

/** All gains below are multiplied by the Gain Resolution */
/** This means that floats will not need to be used */
#define GAIN_RESOLUTION (10000)

#define GAIN_DECIMAL(x) (uint16_t)( (int32_t)(x*GAIN_RESOLUTION) - (int32_t)(GAIN_INT(x)*GAIN_RESOLUTION)  )
#define GAIN_INT(x) (uint16_t)((x/x) * x)

#define SENSOR_ON (1)
#define SENSOR_OFF (0)

#define SENSOR_TEMP (0)
#define SENSOR_VOLTAGE (1)

#define SENSOR_COUNT (32)
#define GAIN_COUNT (5)

/** 22-bits resolution */
#define SENSOR_ENOB	(ADS1213_ENOB)
#define SENSOR_MAX 	(uint32_t)(2^(SENSOR_ENOB - 1))
#define SENSOR_SATURATION_LIMIT ((2^16) - 1)

/* Approximatley 2.5V */
#define SENSOR_REFERNCE 256
#define SENSOR_REF_MULTIPLIER 100.0

#define FLOAT_EXPONENT_BITS   (0x7F8)
#define FLOAT_EXP_BITS_HI     (0x7F)
#define FLOAT_EXP_BITS_LO     (0x80)
#define FLOAT_SIGN_BIT        (0x80)
typedef union _GS_float
{
   uint8_t  byteField[4];
   float    FP;  
   
} float32_t;


extern uint32_t SensorType;
extern uint32_t SensorState;

extern const uint8_t GS_GAIN[];
extern const float SENSOR_GAIN[];
extern const uint32_t GAIN_OFFSETS[];

/** GS_Init:
* Initialises the MAX7300 responsible for controlling Gain 
*/
void GS_Init(void);

/** Changes the mutliplexer channel 
   \param channel Limited to 1 to 32 inclusive */
void GS_Channel(uint8_t channel);

/** Changes the gain
   \param gain Switch combinations as defined by GS_GAIN_XPX */
void GS_GainSel(uint8_t gain);

/** Allows access to the exponent bits of a floating point
*  number
*  \param adjust Number of bits to shift the exponent bits by
*/
float32_t floatExponent(float32_t data, int8_t adjust);
void printFloat(float data);

float pgm_read_float(uint16_t* address_short);


void SensorTypeToggle(uint8_t channel);

/** Either SENSOR_ON or SENSOR_OFF */
uint8_t SensorGetState(uint8_t channel);
uint8_t SensorGetType(uint8_t channel);

/** Either SENSOR_TEMP or SENSOR_VOLTAGE */
void SensorSetType(uint8_t channel, uint8_t type);

/** Channel control routines */
void SensorOn(uint8_t channel);
void SensorOff(uint8_t channel);
void SensorToggle(uint8_t channel);

/** Channel Gain routines */
uint8_t SensorGetGain(uint8_t channel);
void SensorSetGain(uint8_t channel, uint8_t gain);

/** Condition the raw ADC value into a FP voltage */
float32_t SensorCondition(uint32_t data, uint8_t gainIndex);










#endif
