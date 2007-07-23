#ifndef	_GSFP_ROUTINES
#define	_GSFP_ROUTINES



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


/* Switch combinations which produce the given gain */
#define GS_GAIN_76   ((1 << GS_GAIN_A) | (1 << GS_GAIN_F))

/* Approximatley 32.2 31.5 -> 33*/
#define GS_GAIN_30   ((1 << GS_GAIN_B) | (1 << GS_GAIN_C) | (1 << GS_GAIN_F))
#define GS_GAIN_22   ((1 << GS_GAIN_B) | (1 << GS_GAIN_F))
#define GS_GAIN_11   ((1 << GS_GAIN_C) | (1 << GS_GAIN_F))
#define GS_GAIN_5    ((1 << GS_GAIN_D) | (1 << GS_GAIN_F))
#define GS_GAIN_05   ((1 << GS_GAIN_A) | (1 << GS_GAIN_E))
#define GS_GAIN_025  ((1 << GS_GAIN_B) | (1 << GS_GAIN_C) | (1 << GS_GAIN_D) | (1 << GS_GAIN_E) | (1 << GS_GAIN_F))
#define GS_GAIN_02   ((1 << GS_GAIN_B) | (1 << GS_GAIN_E))
#define GS_GAIN_01   ((1 << GS_GAIN_C) | (1 << GS_GAIN_D) | (1 << GS_GAIN_E) | (1 << GS_GAIN_F))

/* Approximatley 0.0432 */
#define GS_GAIN_005    ((1 << GS_GAIN_D) | (1 << GS_GAIN_E))

/* All gains below are multiplied by the Gain Resolution */
/* This means that floats will not need to be used */
#define GAIN_RESOLUTION (10000)

/* Finish these off to 4 dp*/
#define GAIN_76   76.7141
#define GAIN_30   30.38
#define GAIN_22   22.523
#define GAIN_11   11.43
#define GAIN_5    5.00

#define GAIN_DECIMAL(x) (uint16_t)( (int32_t)(x*GAIN_RESOLUTION) - (int32_t)(GAIN_INT(x)*GAIN_RESOLUTION)  )
#define GAIN_INT(x) (uint16_t)((x/x) * x)


#define SENSOR_ON (1)
#define SENSOR_OFF (0)

#define SENSOR_TEMP (0)
#define SENSOR_VOLTAGE (1)

#define SENSOR_COUNT (32)

/* 22-bits resolution */
#define SENSOR_ENOB	(ADS1213_ENOB)
#define SENSOR_MAX 	(uint32_t)(2^(SENSOR_ENOB - 1))
#define SENSOR_SATURATION_LIMIT ((2^16) - 1)

/* Approximatley 2.5V */
#define SENSOR_REFERNCE 2.5
#define SENSOR_REF_MULTIPLIER 1

typedef struct _float32
{
	int16_t integer;
	uint16_t decimal;
	
} Float32_t;

typedef struct _float64
{
	int32_t integer;
	uint32_t decimal;
	
} Float64_t;

typedef struct _float128
{
	int64_t integer;
	uint64_t decimal;
	
} Float128_t;

#define FLOAT_EXPONENT_BITS   (0x7F8)
#define FLOAT_EXP_BITS_HI     (0x7F)
#define FLOAT_EXP_BITS_LO     (0x80)
#define FLOAT_SIGN_BIT        (0x80)
typedef union _GS_float
{
   uint8_t  byteField[4];
   float    FP;  
   
} float32_t;


extern const uint8_t GS_GAIN[];

void GS_Init(void);
void GS_Channel(uint8_t channel);
void GS_GainSel(uint8_t gain);

void SensorCondition(uint32_t data, uint8_t gainIndex);

float32_t floatExponent(float32_t data, int8_t adjust);
void printFloat(float data);















#endif
