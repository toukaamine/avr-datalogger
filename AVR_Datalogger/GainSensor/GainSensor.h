#ifndef	_GS_ROUTINES
#define	_GS_ROUTINES



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

#define GS_GAIN_76   ((1 << GS_GAIN_A) | (1 << GS_GAIN_F))
#define GS_GAIN_30   ((1 << GS_GAIN_B) | (1 << GS_GAIN_C) | (1 << GS_GAIN_F))
#define GS_GAIN_22   ((1 << GS_GAIN_B) | (1 << GS_GAIN_F))
#define GS_GAIN_11   ((1 << GS_GAIN_C) | (1 << GS_GAIN_F))
#define GS_GAIN_5    ((1 << GS_GAIN_D) | (1 << GS_GAIN_F))
#define GS_GAIN_05   ((1 << GS_GAIN_A) | (1 << GS_GAIN_E))
#define GS_GAIN_025  ((1 << GS_GAIN_B) | (1 << GS_GAIN_C) | (1 << GS_GAIN_D) | (1 << GS_GAIN_E) | (1 << GS_GAIN_F))
#define GS_GAIN_02   ((1 << GS_GAIN_B) | (1 << GS_GAIN_E))
#define GS_GAIN_01   ((1 << GS_GAIN_C) | (1 << GS_GAIN_D) | (1 << GS_GAIN_E) | (1 << GS_GAIN_F))
#define GS_GAIN_005    ((1 << GS_GAIN_D) | (1 << GS_GAIN_E))


/* Finish these off */
#define GAIN_76   76.7143
#define GAIN_30   30.38
#define GAIN_22   22.523
#define GAIN_11   11.43
#define GAIN_5    5.00


#define SENSOR_ON (1)
#define SENSOR_OFF (0)

#define SENSOR_TEMP (0)
#define SENSOR_VOLTAGE (1)

#define SENSOR_COUNT (32)

/* 22-bits resolution */
#define SENSOR_SATURATION_LIMIT ((2^16) - 1)


const uint8_t  GS_GAIN[] = {GS_GAIN_76, GS_GAIN_30, GS_GAIN_22, GS_GAIN_11, GS_GAIN_5,
                      GS_GAIN_05, GS_GAIN_025, GS_GAIN_02, GS_GAIN_01, GS_GAIN_005, 0};   


void GS_Init(void);
void GS_Channel(uint8_t channel);
void GS_Gain(uint8_t gain);


















#endif
