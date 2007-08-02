#ifndef _SAMPLE_CTRL
#define _SAMPLE_CTRL


#define SC_COMPARE_RATE 250

#define SC_PRESCALER 32

/* Period of compare in us */
#define SC_COMPARE_PERIOD  ((SC_COMPARE_RATE) / ((F_CPU/SC_PRESCALER) / 1e6))

/* Number of counts to reach 1 milli-second */
#define SC_MILLISECOND     (1000 / SC_COMPARE_PERIOD)
#define SC_SECONDS 10

/* Timer Start / Stop commands */
#define SC_EnableTimer()   TIMSK |= (1 << OCIE2)
#define SC_DisableTimer()  TIMSK &= ~(1 << OCIE2)

#define TIMER_DISABLE 0
#define TIMER_ENABLE 1 

/** The Sample control is using the Internal clock */
#define SC_SAMPLE_INTERNAL 	0
#define SC_SAMPLE_EXTERNAL 		1 /// Using the external RTC clock

/* RTC 0 will be used for long delays it will be setup as a 1 second interrupt */
#define SC_LONG_DELAY_INTERRUPT		DS1305_RTC0

typedef struct _softTimer8
{
	uint8_t timeCompare;
	uint8_t timerCounter;
	uint8_t timerEnable;
	
} SoftTimer_8;


typedef struct _softTimer16
{
	uint16_t timeCompare;
	uint16_t timerCounter;
	uint8_t timerEnable;	
} SoftTimer_16;


typedef struct _softTimer32
{
	uint32_t timeCompare;
	uint32_t timerCounter;
	uint8_t timerEnable;	
} SoftTimer_32;


extern SoftTimer_8 SC_MasterTimer;
extern SoftTimer_16 SC_INTLongDelay;
extern uint32_t SC_SampleCount;

/* Sets up the required timers etc */
void SC_Init(void);
void SC_Sample(void);

uint8_t SC_GetShortRate(void);
void SC_SetSamplingRate(uint8_t tensMilliseconds);
uint16_t SC_GetLongRate(void);
void SC_SetSamplingRate_Long(uint16_t seconds);


uint8_t SC_GetMode(void);





#endif
