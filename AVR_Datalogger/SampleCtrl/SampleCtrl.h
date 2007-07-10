
#define SC_COMPARE_RATE 125

/* Period of compare in us */
#define SC_COMPARE_PERIOD  ((SC_COMPARE_RATE) / ((F_CPU/8) / 1e6))

/* Number of counts to reach 1 milli-second */
#define SC_MILLISECOND     (1000 / SC_COMPARE_PERIOD)


/* Timer Start / Stop commands */
#define SC_EnableTimer()   TIMSK |= (1 << OCIE2)
#define SC_DisableTimer()  TIMSK &= ~(1 << OCIE2)

/* Sets up the required timers etc */
void SC_Init(void);

