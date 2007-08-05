#define TMP123_PORT	PORTA
#define TMP123_DDR	DDRA
#define TMP123_PIN	PINA
#define TMP123_SO		(5)
#define TMP123_nCS	(4)
#define TMP123_SCK	(3)

void TMP123_Init(void);
int16_t TMP123_GetTemp(void);
