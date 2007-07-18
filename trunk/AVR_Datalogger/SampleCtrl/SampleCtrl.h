
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

/* Sets up the required timers etc */
void SC_Init(void);

typedef struct _softTimer8
{
	uint8_t timeCompare;
	uint8_t timerCounter;
	
} SoftTimer_8;


typedef struct _softTimer16
{
	uint16_t timeCompare;
	uint16_t timerCounter;
	
} SoftTimer_16;


typedef struct _softTimer32
{
	uint32_t timeCompare;
	uint32_t timerCounter;
	
} SoftTimer_32;