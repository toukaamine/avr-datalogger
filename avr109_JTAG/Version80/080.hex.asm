; reassembly of "080.hex"
; created by ReAVR V3.2.0
; at 2007/04/24 - 21:26:01
; for Atmel AVR assembler
;---------------------------------------
; AVR_TYPE=ATmega16
; FLASH_SIZE=16KB
; SRAM_START=0x60
;---------------------------------------
; const blocks:
; 0x0048..0x004F ;OCD ID
; 0x0050..0x009D ;commands
; 0x009E..0x00F5 ;write functions
; 0x00F6..0x011F ;Read functions
; 0x0120..0x012F ;Init addresses
; 0x2D8E..0x2D97 ;Init DATA
; Note:
; Atmel asm .db start addresses are
; always word-aligned.
; So const blocks were adjusted for
; even start and odd end byte addr:
; 0x48..0x4F
; 0x50..0x9D
; 0x9E..0xF5
; 0xF6..0x11F
; 0x120..0x12F
; 0x2D8E..0x2D97
;---------------------------------------
	.cseg
	.org	0x0000
;---------------------------------------
; byte constants:
;
.equ	k00	= 0x00	;
.equ	k01	= 0x01	;
.equ	k02	= 0x02	;
.equ	k03	= 0x03	;
.equ	k04	= 0x04	;
.equ	k05	= 0x05	;
.equ	k06	= 0x06	;
.equ	k07	= 0x07	;
.equ	k08	= 0x08	;
.equ	k09	= 0x09	;
.equ	k0A	= 0x0A	;
.equ	k0B	= 0x0B	;
.equ	k0C	= 0x0C	;
.equ	k0D	= 0x0D	;
.equ	k0E	= 0x0E	;
.equ	k0F	= 0x0F	;
.equ	k10	= 0x10	;
.equ	k11	= 0x11	;
.equ	k12	= 0x12	;
.equ	k13	= 0x13	;
.equ	k14	= 0x14	;
.equ	k15	= 0x15	;
.equ	k17	= 0x17	;
.equ	k18	= 0x18	;
.equ	k1B	= 0x1B	;
.equ	k1C	= 0x1C	;
.equ	k1D	= 0x1D	;
.equ	k1E	= 0x1E	;
.equ	k1F	= 0x1F	;
.equ	k20	= 0x20	; ' '
.equ	k21	= 0x21	; '!'
.equ	k22	= 0x22	; '"'
.equ	k23	= 0x23	; '#'
.equ	k25	= 0x25	; '%'
.equ	k27	= 0x27	; '''
.equ	k2C	= 0x2C	; ','
.equ	k2D	= 0x2D	; '-'
.equ	k2F	= 0x2F	; '/'
.equ	k30	= 0x30	; '0'
.equ	k31	= 0x31	; '1'
.equ	k32	= 0x32	; '2'
.equ	k33	= 0x33	; '3'
.equ	k35	= 0x35	; '5'
.equ	k36	= 0x36	; '6'
.equ	k37	= 0x37	; '7'
.equ	k38	= 0x38	; '8'
.equ	k39	= 0x39	; '9'
.equ	k3A	= 0x3A	; ':'
.equ	k3B	= 0x3B	; ';'
.equ	k3E	= 0x3E	; '>'
.equ	k3F	= 0x3F	; '?'
.equ	k40	= 0x40	; '@'
.equ	k41	= 0x41	; 'A'
.equ	k42	= 0x42	; 'B'
.equ	k43	= 0x43	; 'C'
.equ	k44	= 0x44	; 'D'
.equ	k45	= 0x45	; 'E'
.equ	k46	= 0x46	; 'F'
.equ	k47	= 0x47	; 'G'
.equ	k48	= 0x48	; 'H'
.equ	k49	= 0x49	; 'I'
.equ	k4A	= 0x4A	; 'J'
.equ	k4C	= 0x4C	; 'L'
.equ	k4E	= 0x4E	; 'N'
.equ	k4F	= 0x4F	; 'O'
.equ	k50	= 0x50	; 'P'
.equ	k51	= 0x51	; 'Q'
.equ	k52	= 0x52	; 'R'
.equ	k53	= 0x53	; 'S'
.equ	k54	= 0x54	; 'T'
.equ	k55	= 0x55	; 'U'
.equ	k56	= 0x56	; 'V'
.equ	k58	= 0x58	; 'X'
.equ	k59	= 0x59	; 'Y'
.equ	k5F	= 0x5F	; '_'
.equ	k60	= 0x60	; '`'
.equ	k61	= 0x61	; 'a'
.equ	k62	= 0x62	; 'b'
.equ	k63	= 0x63	; 'c'
.equ	k64	= 0x64	; 'd'
.equ	k65	= 0x65	; 'e'
.equ	k66	= 0x66	; 'f'
.equ	k67	= 0x67	; 'g'
.equ	k68	= 0x68	; 'h'
.equ	k69	= 0x69	; 'i'
.equ	k6B	= 0x6B	; 'k'
.equ	k6C	= 0x6C	; 'l'
.equ	k6D	= 0x6D	; 'm'
.equ	k6E	= 0x6E	; 'n'
.equ	k6F	= 0x6F	; 'o'
.equ	k70	= 0x70	; 'p'
.equ	k71	= 0x71	; 'q'
.equ	k72	= 0x72	; 'r'
.equ	k73	= 0x73	; 's'
.equ	k74	= 0x74	; 't'
.equ	k75	= 0x75	; 'u'
.equ	k77	= 0x77	; 'w'
.equ	k78	= 0x78	; 'x'
.equ	k7A	= 0x7A	; 'z'
.equ	k7F	= 0x7F	; ''
.equ	k80	= 0x80	;
.equ	k81	= 0x81	;
.equ	k82	= 0x82	;
.equ	k83	= 0x83	;
.equ	k84	= 0x84	;
.equ	k86	= 0x86	;
.equ	k88	= 0x88	;
.equ	k8D	= 0x8D	;
.equ	k8E	= 0x8E	;
.equ	k90	= 0x90	;
.equ	k94	= 0x94	;
.equ	k95	= 0x95	;
.equ	k98	= 0x98	;
.equ	k9A	= 0x9A	;
.equ	k9C	= 0x9C	;
.equ	k9E	= 0x9E	;
.equ	k9F	= 0x9F	;
.equ	kA0	= 0xA0	; ' '
.equ	kA3	= 0xA3	; '£'
.equ	kA4	= 0xA4	; '¤'
.equ	kA8	= 0xA8	; '¨'
.equ	kA9	= 0xA9	; '©'
.equ	kAA	= 0xAA	; 'ª'
.equ	kB0	= 0xB0	; '°'
.equ	kB8	= 0xB8	; '¸'
.equ	kBF	= 0xBF	; '¿'
.equ	kC0	= 0xC0	; 'À'
.equ	kCA	= 0xCA	; 'Ê'
.equ	kCE	= 0xCE	; 'Î'
.equ	kD0	= 0xD0	; 'Ð'
.equ	kD7	= 0xD7	; '×'
.equ	kD9	= 0xD9	; 'Ù'
.equ	kE0	= 0xE0	; 'à'
.equ	kE8	= 0xE8	; 'è'
.equ	kEC	= 0xEC	; 'ì'
.equ	kF0	= 0xF0	; 'ð'
.equ	kF4	= 0xF4	; 'ô'
.equ	kF6	= 0xF6	; 'ö'
.equ	kF7	= 0xF7	; '÷'
.equ	kF8	= 0xF8	; 'ø'
.equ	kF9	= 0xF9	; 'ù'
.equ	kFA	= 0xFA	; 'ú'
.equ	kFB	= 0xFB	; 'û'
.equ	kFC	= 0xFC	; 'ü'
.equ	kFD	= 0xFD	; 'ý'
.equ	kFE	= 0xFE	; 'þ'
.equ	kFF	= 0xFF	; 'ÿ'
;
; io register addresses:
;
.equ	ADCL	= 0x04
.equ	ADCH	= 0x05
.equ	ADCSRA	= 0x06
.equ	ADMUX	= 0x07
.equ	UBRRL	= 0x09
.equ	UCSRB	= 0x0A
.equ	UCSRA	= 0x0B
.equ	UDR	= 0x0C
.equ	PIND	= 0x10
.equ	DDRD	= 0x11
.equ	PORTD	= 0x12
.equ	PINC	= 0x13
.equ	DDRC	= 0x14
.equ	PORTC	= 0x15
.equ	PINB	= 0x16
.equ	DDRB	= 0x17
.equ	PORTB	= 0x18
.equ	DDRA	= 0x1A
.equ	PORTA	= 0x1B
.equ	EECR	= 0x1C
.equ	EEDR	= 0x1D
.equ	EEARL	= 0x1E
.equ	EEARH	= 0x1F
.equ	UCSRC	= 0x20
.equ	OSCCAL	= 0x31
.equ	TCCR0	= 0x33
.equ	SPMCR	= 0x37
.equ	TIMSK	= 0x39
.equ	GICR	= 0x3B
.equ	SPL	= 0x3D
.equ	SPH	= 0x3E
.equ	SREG	= 0x3F
;
; pointer offsets:
;
.equ	o00	= 0x00
.equ	o01	= 0x01
.equ	o02	= 0x02
.equ	o03	= 0x03
.equ	o04	= 0x04
.equ	o05	= 0x05
.equ	o06	= 0x06
.equ	o07	= 0x07
.equ	o08	= 0x08
.equ	o09	= 0x09
.equ	o0A	= 0x0A
.equ	o0B	= 0x0B
.equ	o0C	= 0x0C
.equ	o0D	= 0x0D
.equ	o0E	= 0x0E
.equ	o0F	= 0x0F
.equ	o10	= 0x10
.equ	o17	= 0x17
.equ	o18	= 0x18
.equ	o20	= 0x20
.equ	o34	= 0x34
;
; bit numbers:
;
.equ	b0	= 0x00
.equ	b1	= 0x01
.equ	b2	= 0x02
.equ	b3	= 0x03
.equ	b4	= 0x04
.equ	b5	= 0x05
.equ	b6	= 0x06
.equ	b7	= 0x07
;---------------------------------------
;
L0000:
	jmp	_reset	; L1453
;	-----------	jump on last line
	reti
;----------------------*
; pc=0x3(0x6)
;
	reti
;----------------------*
; pc=0x4(0x8)
;
	reti
;----------------------*
; pc=0x5(0xA)
;
	reti
;----------------------*
; pc=0x6(0xC)
;
	reti
;----------------------*
; pc=0x7(0xE)
;
	reti
;----------------------*
; pc=0x8(0x10)
;
	reti
;----------------------*
; pc=0x9(0x12)
;
	reti
;----------------------*
; pc=0xA(0x14)
;
	reti
;----------------------*
; pc=0xB(0x16)
;
	reti
;----------------------*
; pc=0xC(0x18)
;
	reti
;----------------------*
; pc=0xD(0x1A)
;
	reti
;----------------------*
; pc=0xE(0x1C)
;
	reti
;----------------------*
; pc=0xF(0x1E)
;
	reti
;----------------------*
; pc=0x10(0x20)
;
	reti
;----------------------*
; pc=0x11(0x22)
;
	reti
;----------------------*
; pc=0x12(0x24)
;
	jmp	L00F0
;	-----------	jump on last line
	reti
;----------------------*
; pc=0x15(0x2A)
;
	reti
;----------------------*
; pc=0x16(0x2C)
;
	jmp	L13EA
;	-----------	jump on last line
	jmp	L1409
;	-----------	jump on last line
	reti
;----------------------*
; pc=0x1B(0x36)
;
	reti
;----------------------*
; pc=0x1C(0x38)
;
	jmp	L00B2
;	-----------	jump on last line
	reti
;----------------------*
; pc=0x1F(0x3E)
;
	reti
;----------------------*
; pc=0x20(0x40)
;
	reti
;----------------------*
; pc=0x21(0x42)
;
	reti
;----------------------*
; pc=0x22(0x44)
;
	reti
;----------------------*
; pc=0x23(0x46)
;
	reti
;----------------------*
; pc=0x24(0x48)
;
; begin of const block at 0x0024(0x0048)
; OCD ID
C0048:
	.db	0x41,0x56,0x52,0x4E,0x4F,0x43,0x44,0x00	; "AVRNOCD."
; end of const block at 0x0027(0x004F)
;
; begin of const block at 0x0028(0x0050)
; commands
C0050:
	.db	0x00,0x20,0x01,0xF3,0x01,0xDC,0x01,0x11	; ". ......"
	.db	0xD8,0x01,0x01,0xD2,0x01,0x01,0xD4,0x01	; "........"
	.db	0x0F,0xCC,0x01,0x04,0xD6,0x01,0x01,0xD0	; "........"
	.db	0x01,0x0B,0xC6,0x01,0x01,0xCA,0x01,0x04	; "........"
	.db	0xC8,0x01,0x0B,0xBB,0x01,0x01,0xBB,0x01	; "........"
	.db	0x01,0xDF,0x01,0x0D,0xCE,0x01,0x07,0xDA	; "........"
	.db	0x01,0x28,0xE1,0x01,0x01,0xE3,0x01,0x01	; ".(......"
	.db	0xE5,0x01,0x01,0xE9,0x01,0x01,0xE7,0x01	; "........"
	.db	0x01,0xEB,0x01,0x1B,0xED,0x01,0x01,0xEF	; "........"
	.db	0x01,0x01,0xF1,0x01,0xFB,0x00          	; "......"
; end of const block at 0x004E(0x009D)
;
; begin of const block at 0x004F(0x009E)
; write functions
C009E:
	.db	0x62,0x01,0xCF,0x05,0x45,0x05,0x1F,0xA2	; "b...E..."
	.db	0x05,0x01,0xA7,0x05,0x04,0x9A,0x05,0x02	; "........"
	.db	0xA9,0x05,0x01,0xAB,0x05,0x01,0xAD,0x05	; "........"
	.db	0x01,0xC8,0x05,0x15,0x55,0x05,0x01,0x63	; "....U..c"
	.db	0x05,0x01,0x80,0x05,0x01,0x83,0x05,0x01	; "........"
	.db	0x88,0x05,0x01,0x8B,0x05,0x01,0x8E,0x05	; "........"
	.db	0x05,0xB0,0x05,0x01,0xB3,0x05,0x01,0xB6	; "........"
	.db	0x05,0x01,0xB9,0x05,0x01,0x6C,0x05,0x01	; ".....l.."
	.db	0x66,0x05,0x01,0x79,0x05,0x01,0x76,0x05	; "f..y..v."
	.db	0x02,0xBC,0x05,0x01,0xBF,0x05,0x01,0x5A	; ".......Z"
	.db	0x05,0x01,0xC2,0x05,0x01,0xC5,0x05,0xFB	; "........"
; end of const block at 0x007A(0x00F5)
;
; begin of const block at 0x007B(0x00F6)
; Read functions
C00F6:
	.db	0x62,0x01,0x06,0x06,0xDB,0x05,0x18,0xE2	; "b......."
	.db	0x05,0x01,0xE5,0x05,0x06,0xFB,0x05,0x01	; "........"
	.db	0xFF,0x05,0x02,0xE7,0x05,0x02,0xEA,0x05	; "........"
	.db	0x01,0x01,0x06,0x20,0xEE,0x05,0x01,0xF1	; "... ...."
	.db	0x05,0x01,0xF4,0x05,0x01,0xF8,0x05,0x09	; "........"
	.db	0x03,0x06                              	; ".."
; end of const block at 0x008F(0x011F)
;
; begin of const block at 0x0090(0x0120)
; Init addresses
C0120:
	.db	0xFB,0x00,0x14,0x03,0x69,0x00,0x00,0x00	; "....i..."
	.db	0x00,0x09,0x00,0x60,0x00,0x8E,0x2D,0x00	; "...`..-."
; end of const block at 0x0097(0x012F)
;
L0098:
	ldi	r16,k8D
	out	ADCSRA,r16
	ldi	r16,k02
	 rcall	L00A2
	ldi	r16,k04
	out	TCCR0,r16
	in	r16,TIMSK
	ori	r16,k01
	out	TIMSK,r16
	ret
;----------------------*
; pc=0xA2(0x144)
;
L00A2:
	out	ADMUX,r16
	sbi	ADCSRA,b6
	ret
;----------------------*
; pc=0xA5(0x14A)
;
L00A5:
;	--------- this is skippy
	 sbis	PIND,b3
	 rjmp	L00A9
;	--------- last may be skipped
; pc=0xA7(0x14E)
;
	ldi	r16,k00
	ret
;----------------------*
; pc=0xA9(0x152)
;
L00A9:
	ldi	r30,k6B
	ldi	r31,k00
	ld	r16,Z
	ldd	r17,Z+o01
	lsr	r17
	ror	r16
	lsr	r17
	ror	r16
	ret
;----------------------*
; pc=0xB2(0x164)
;
L00B2:
	st	-Y,r31
	st	-Y,r30
	 rcall	L00E0
	in	r21,SREG
	in	r22,GICR
	ldi	r16,k00
	out	GICR,r16
	in	r16,ADCL
	in	r17,ADCH
	ldi	r30,k69
	ldi	r31,k00
	ld	r18,Z
	ldd	r19,Z+o01
	add	r18,r16
	adc	r19,r17
	st	Z,r18
	std	Z+o01,r19
	ldi	r30,k6D
	ldi	r31,k00
	ld	r16,Z
	inc	r16
	st	Z,r16
	cpi	r16,k08
	 brne	L00DA
;	-----		branch on last line
	mov	r16,r18
	mov	r17,r19
	ldi	r20,k03
	 call	L146D
	ldi	r30,k6B
	ldi	r31,k00
	st	Z,r16
	std	Z+o01,r17
	ldi	r16,k00
	sts	D006D,r16
	ldi	r30,k69
	ldi	r31,k00
	st	Z,r16
	std	Z+o01,r16
L00DA:
	out	GICR,r22
	out	SREG,r21
	 rcall	L00E8
	ld	r30,Y+
	ld	r31,Y+
	reti
;----------------------*
; pc=0xE0(0x1C0)
;
L00E0:
	st	-Y,r22
	st	-Y,r21
	st	-Y,r20
	st	-Y,r19
	st	-Y,r18
	st	-Y,r17
	st	-Y,r16
	ret
;----------------------*
; pc=0xE8(0x1D0)
;
L00E8:
	ld	r16,Y+
	ld	r17,Y+
	ld	r18,Y+
	ld	r19,Y+
	ld	r20,Y+
	ld	r21,Y+
	ld	r22,Y+
	ret
;----------------------*
; pc=0xF0(0x1E0)
;
L00F0:
	st	-Y,r25
	st	-Y,r24
	st	-Y,r31
	st	-Y,r30
	st	-Y,r3
	st	-Y,r2
	st	-Y,r1
	st	-Y,r0
	st	-Y,r23
	 rcall	L00E0
	in	r24,SREG
	in	r25,GICR
	ldi	r16,k00
	out	GICR,r16
	lds	r16,D006E
	tst	r16
	 breq	L0106
;	-----		branch on last line
	ldi	r30,k6E
	ldi	r31,k00
	dec	r16
	st	Z,r16
L0106:
	ldi	r16,k02
	 rcall	L00A2
	out	GICR,r25
	out	SREG,r24
	 rcall	L00E8
	ld	r23,Y+
	ld	r0,Y+
	ld	r1,Y+
	ld	r2,Y+
	ld	r3,Y+
	ld	r30,Y+
	ld	r31,Y+
	ld	r24,Y+
	ld	r25,Y+
	reti
;----------------------*
; pc=0x115(0x22A)
;
L0115:
	cli
	sts	D006E,r16
	sei
	ret
;----------------------*
; pc=0x11A(0x234)
;
L011A:
;	--------- this is skippy
	 sbic	EECR,b1
	 rjmp	L011A
;	--------- last may be skipped
; pc=0x11C(0x238)
;
	ldi	r19,k00
	out	EEARH,r19
	out	EEARL,r16
	out	EEDR,r17
	sbi	EECR,b2
	sbi	EECR,b1
	ret
;----------------------*
; pc=0x123(0x246)
;
L0123:
;	--------- this is skippy
	 sbic	EECR,b1
	 rjmp	L0123
;	--------- last may be skipped
; pc=0x125(0x24A)
;
	ldi	r17,k00
	out	EEARH,r17
	out	EEARL,r16
	sbi	EECR,b0
	in	r16,EEDR
	ret
;----------------------*
; pc=0x12B(0x256)
;
L012B:
	ldi	r16,k17
	 call	L13DC
	ldi	r16,kF9
	out	DDRA,r16
	ldi	r16,k00
	out	PORTA,r16
	ldi	r16,kAA
	out	DDRB,r16
	cbi	PORTB,b4
	sbi	PORTB,b4
	ldi	r16,kF0
	out	DDRC,r16
	ldi	r16,k00
	out	PORTC,r16
	ldi	r16,kB0
	out	DDRD,r16
	ldi	r16,k00
	out	PORTD,r16
	 call	L0098
	sei
	ldi	r16,k01
	ldi	r17,k00
	ret
;----------------------*
; pc=0x144(0x288)
;
L0144:
	 rcall	L0206
	 rcall	L04E4
	ldi	r16,k0A
	 call	L0115
L0149:
	 rcall	L0209
	 brne	L0149
;	-----		branch on last line
	ldi	r16,k00
	 call	L0123
	 call	L0A79
	 call	L0841
	ldi	r24,k00
	ldi	r25,k00
L0154:
	 rcall	L020D
	cpi	r25,k01
	 brcs	L0154
;	-----		branch on last line
L0157:
	lds	r17,D0074
	in	r16,PIND
	andi	r16,k08
	eor	r16,r17
	 breq	L0170
;	-----		branch on last line
	ldi	r16,k18
	 call	L0115
L0160:
	 rcall	L0209
	 brne	L0160
;	-----		branch on last line
;	--------- this is skippy
	 sbic	PIND,b3
	 rjmp	L0170
;	--------- last may be skipped
; pc=0x164(0x2C8)
;
	ldi	r17,k00
	ldi	r16,k08
	 call	L07D1
	 call	L0841
	ldi	r16,k01
	sts	D0076,r16
	 rcall	L0214
	 breq	L0170
;	-----		branch on last line
	 rcall	L01F5
L0170:
	in	r16,PIND
	andi	r16,k08
	sts	D0074,r16
	lds	r16,D0080
	tst	r16
	 brne	L0179
;	-----		branch on last line
	rjmp	L01BB
;	-----------	jump on last line
L0179:
	 rcall	L0218
;	--------- this is skippy
	 sbrs	r16,b0
	 rjmp	L017E
;	--------- last may be skipped
; pc=0x17C(0x2F8)
;
	ldi	r16,k01
	rjmp	L017F
;	-----------	jump on last line
L017E:
	ldi	r16,k00
L017F:
	lds	r17,D0073
	cp	r16,r17
	 breq	L018B
;	-----		branch on last line
	sts	D0073,r16
	ldi	r16,k48
	 rcall	L01FC
	lds	r16,D0073
	 rcall	L01FC
	 rcall	L01FB
L018B:
	 rcall	L0226
;	--------- this is skippy
	 sbrs	r16,b7
	 rjmp	L0190
;	--------- last may be skipped
; pc=0x18E(0x31C)
;
	ldi	r16,k01
	rjmp	L0191
;	-----------	jump on last line
L0190:
	ldi	r16,k00
L0191:
	lds	r17,D0060
	cp	r16,r17
	 breq	L019D
;	-----		branch on last line
	sts	D0060,r16
	ldi	r16,k49
	 rcall	L01FC
	lds	r16,D0060
	 rcall	L01FC
	 rcall	L01FB
L019D:
	 rcall	L0226
;	--------- this is skippy
	 sbrs	r16,b4
	 rjmp	L01A6
;	--------- last may be skipped
; pc=0x1A0(0x340)
;
	ldi	r16,k47
	 rcall	L01FC
	 call	L1023
	 rcall	L01FC
	 rcall	L01FB
L01A6:
	lds	r16,D007F
	andi	r16,k06
	cpi	r16,k04
	 brne	L01B6
;	-----		branch on last line
	ldi	r16,k00
	sts	D0080,r16
	 rcall	L021D
	ldi	r16,k42
	 rcall	L01FC
	 rcall	L022A
	mov	r16,r17
	 rcall	L01FC
	 rcall	L022A
	 rcall	L01FC
L01B6:
	ldi	r16,k06
	 call	L0115
L01B9:
	 rcall	L0209
	 brne	L01B9
;	-----		branch on last line
L01BB:
	 call	L144D
	tst	r16
	 brne	L01C0
;	-----		branch on last line
	rjmp	L0157
;	-----------	jump on last line
L01C0:
	 call	L142A
	ldi	r30,k50
	ldi	r31,k00
	jmp	L14E8
;	-----------	jump on last line
	 rcall	L0237
	rjmp	L01BB
;	-----------	jump on last line
	 rcall	L0364
	rjmp	L01BB
;	-----------	jump on last line
	 rcall	L04E4
	rjmp	L01BB
;	-----------	jump on last line
	 rcall	L053D
	rjmp	L01BB
;	-----------	jump on last line
	 rcall	L05D3
	rjmp	L01BB
;	-----------	jump on last line
	 rcall	L0684
	rjmp	L01BB
;	-----------	jump on last line
	 rcall	L060C
	rjmp	L01BB
;	-----------	jump on last line
	 rcall	L0629
	rjmp	L01BB
;	-----------	jump on last line
	 rcall	L064F
	rjmp	L01BB
;	-----------	jump on last line
	 rcall	L0663
	rjmp	L01BB
;	-----------	jump on last line
	 rcall	L0691
	rjmp	L01BB
;	-----------	jump on last line
	ldi	r16,k41
L01DD:
	 rcall	L01FC
	rjmp	L01BB
;	-----------	jump on last line
	 rcall	L067F
	rjmp	L01BB
;	-----------	jump on last line
	 rcall	L06DD
	rjmp	L01BB
;	-----------	jump on last line
	 rcall	L0721
	rjmp	L01BB
;	-----------	jump on last line
	 rcall	L04ED
	rjmp	L01BB
;	-----------	jump on last line
	 rcall	L04C8
	rjmp	L01BB
;	-----------	jump on last line
	 rcall	L04AD
	rjmp	L01BB
;	-----------	jump on last line
	 rcall	L04D1
	rjmp	L01BB
;	-----------	jump on last line
	 rcall	L072F
	rjmp	L01BB
;	-----------	jump on last line
	 rcall	L0738
	rjmp	L01BB
;	-----------	jump on last line
	 rcall	L0789
	rjmp	L01BB
;	-----------	jump on last line
	ldi	r16,k45
	rjmp	L01DD
;	-----------	jump on last line
L01F5:
	 call	L0D8E
	ldi	r16,k01
	sts	D018D,r16
	ret
;----------------------*
; pc=0x1FB(0x3F6)
;
L01FB:
	ldi	r16,k41
L01FC:
	ldi	r17,k00
	jmp	L143C
;	-----------	jump on last line
L01FF:
	st	-Y,r25
	st	-Y,r24
	 rcall	L022D
	mov	r24,r16
	 rcall	L0796
	tst	r16
	ret
;----------------------*
; pc=0x206(0x40C)
;
L0206:
	st	-Y,r25
	st	-Y,r24
	ret
;----------------------*
; pc=0x209(0x412)
;
L0209:
	lds	r16,D006E
	tst	r16
	ret
;----------------------*
; pc=0x20D(0x41A)
;
L020D:
	ldi	r16,kFF
	mov	r30,r24
	mov	r31,r25
	 rcall	L0234
	st	Z,r16
	adiw	r24,k01
	ret
;----------------------*
; pc=0x214(0x428)
;
L0214:
	lds	r16,D02AC
	tst	r16
	ret
;----------------------*
; pc=0x218(0x430)
;
L0218:
	 call	L0D62
	sts	D007F,r16
	ret
;----------------------*
; pc=0x21D(0x43A)
;
L021D:
	sts	D0073,r16
	 call	L0A97
	jmp	L0D3B
;	-----------	jump on last line
L0223:
	ldi	r16,k00
	sts	D0080,r16
L0226:
	ldi	r30,k7F
	ldi	r31,k00
	ld	r16,Z
	ret
;----------------------*
; pc=0x22A(0x454)
;
L022A:
	ldi	r16,k09
	jmp	L1079
;	-----------	jump on last line
L022D:
	 call	L142A
	mov	r25,r16
	jmp	L142A
;	-----------	jump on last line
L0232:
	mov	r30,r6
	mov	r31,r7
L0234:
	subi	r30,k7F
	sbci	r31,kFF
	ret
;----------------------*
; pc=0x237(0x46E)
;
L0237:
	 call	L1538
	 rcall	L032A
	ld	r4,Z
	ldd	r5,Z+o01
	mov	r6,r4
	mov	r7,r5
	 rcall	L032D
	 rcall	L0331
	 brne	L0244
;	-----		branch on last line
	 rcall	L0335
	 brne	L0244
;	-----		branch on last line
	 rcall	L01F5
L0244:
	clr	r14
	 call	L142A
	mov	r10,r16
	 call	L142A
	mov	r11,r16
	 call	L142A
	 call	L142A
	 rcall	L0322
	 brne	L0252
;	-----		branch on last line
	rjmp	L030B
;	-----------	jump on last line
L0252:
	 rcall	L0218
	 rcall	L0339
	rjmp	L025C
;	-----------	jump on last line
L0255:
	mov	r16,r24
	 call	L13D3
L0258:
	mov	r12,r16
L0259:
	mov	r16,r12
	 rcall	L01FC
	 rcall	L0342
L025C:
	mov	r16,r11
	 rcall	L0318
	 brcc	L0260
;	-----		branch on last line
	rjmp	L0304
;	-----------	jump on last line
L0260:
	 rcall	L031E
	 breq	L0267
;	-----		branch on last line
	 rcall	L0226
;	--------- this is skippy
	 sbrs	r16,b7
	 rjmp	L0274
;	--------- last may be skipped
; pc=0x265(0x4CA)
;
	andi	r16,k06
	 brne	L0274
;	-----		branch on last line
L0267:
	ldi	r16,kB0
	cp	r10,r16
	 brcc	L0274
;	-----		branch on last line
	ldi	r16,kA0
	cp	r10,r16
	 brne	L026F
;	-----		branch on last line
	ldi	r16,k07
	 rcall	L01FC
L026F:
	ldi	r16,k07
	mov	r12,r16
	clr	r14
	inc	r14
	rjmp	L0259
;	-----------	jump on last line
L0274:
	mov	r16,r10
	subi	r16,k90
	 brne	L0278
;	-----		branch on last line
	rjmp	L02BE
;	-----------	jump on last line
L0278:
	subi	r16,k10
	 breq	L02B2
;	-----		branch on last line
	subi	r16,k10
	 brne	L027D
;	-----		branch on last line
	rjmp	L02C2
;	-----------	jump on last line
L027D:
	dec	r16
	 brne	L0280
;	-----		branch on last line
	rjmp	L02F4
;	-----------	jump on last line
L0280:
	dec	r16
	 brne	L0283
;	-----		branch on last line
	rjmp	L02F8
;	-----------	jump on last line
L0283:
	dec	r16
	 brne	L0286
;	-----		branch on last line
	rjmp	L02FD
;	-----------	jump on last line
L0286:
	dec	r16
	 brne	L0289
;	-----		branch on last line
	rjmp	L0300
;	-----------	jump on last line
L0289:
	dec	r16
	 breq	L0255
;	-----		branch on last line
	subi	r16,k6B
	 breq	L0292
;	-----		branch on last line
	subi	r16,k02
	 breq	L02AB
;	-----		branch on last line
	subi	r16,k0E
	 breq	L02AF
;	-----		branch on last line
	rjmp	L0259
;	-----------	jump on last line
L0292:
	 rcall	L030E
	 brcc	L0298
;	-----		branch on last line
	mov	r16,r24
	 call	L0BB9
	rjmp	L0258
;	-----------	jump on last line
L0298:
	 rcall	L0347
	 brcc	L029F
;	-----		branch on last line
	mov	r16,r24
	subi	r16,k20
L029C:
	 call	L0BD9
	rjmp	L0258
;	-----------	jump on last line
L029F:
	 rcall	L0214
	 breq	L02A7
;	-----		branch on last line
	 rcall	L0313
	 brcc	L02A7
;	-----		branch on last line
	mov	r16,r24
	 call	L0BF0
	rjmp	L0258
;	-----------	jump on last line
L02A7:
	 rcall	L033F
	 call	L0C3D
	rjmp	L0258
;	-----------	jump on last line
L02AB:
	 rcall	L033F
	 call	L0CA9
	rjmp	L0258
;	-----------	jump on last line
L02AF:
	mov	r16,r24
	subi	r16,kC0
	rjmp	L029C
;	-----------	jump on last line
L02B2:
	 rcall	L033F
	ldi	r30,k63
	ldi	r31,k00
	ld	r18,Z
	ldd	r19,Z+o01
	mov	r30,r18
	mov	r31,r19
	 icall
L02BA:
	mov	r12,r16
	mov	r16,r17
	 rcall	L01FC
	rjmp	L0259
;	-----------	jump on last line
L02BE:
	mov	r16,r24
	 call	L1079
	rjmp	L02BA
;	-----------	jump on last line
L02C2:
	 rcall	L033F
	mov	r18,r26
	mov	r19,r27
	 rcall	L034C
	ldi	r22,k00
	ldi	r23,k00
	 call	L14AE
	or	r20,r21
	or	r20,r22
	or	r20,r23
	 brne	L02EC
;	-----		branch on last line
	 rcall	L033E
	 call	L1292
	 rcall	L0353
	 rcall	L0356
	andi	r23,k0F
	cpi	r20,k3F
	sbci	r21,k50
	sbci	r22,k40
	sbci	r23,k09
	 brne	L02DB
;	-----		branch on last line
	ldi	r18,k01
	rjmp	L02DC
;	-----------	jump on last line
L02DB:
	ldi	r18,k00
L02DC:
	ldi	r19,k00
	 rcall	L0356
	cpi	r20,k3F
	sbci	r21,k10
	sbci	r22,k78
	sbci	r23,k09
	 brne	L02E5
;	-----		branch on last line
	ldi	r16,k01
	rjmp	L02E6
;	-----------	jump on last line
L02E5:
	ldi	r16,k00
L02E6:
	or	r16,r18
	or	r16,r19
	mov	r6,r4
	mov	r7,r5
	 brne	L02EC
;	-----		branch on last line
	 rcall	L032D
L02EC:
	 rcall	L035B
	ld	r16,Z
	 rcall	L01FC
	 rcall	L032D
	 rcall	L035B
	ld	r12,Z
	 rcall	L032E
	rjmp	L0259
;	-----------	jump on last line
L02F4:
	 rcall	L033F
	 call	L1342
	rjmp	L0258
;	-----------	jump on last line
L02F8:
	mov	r17,r24
	ldi	r16,k01
L02FA:
	 call	L13A5
	rjmp	L0258
;	-----------	jump on last line
L02FD:
	mov	r17,r24
	ldi	r16,k00
	rjmp	L02FA
;	-----------	jump on last line
L0300:
	mov	r16,r24
	 call	L13CA
	rjmp	L0258
;	-----------	jump on last line
L0304:
	 rcall	L0311
	tst	r14
	 breq	L0309
;	-----		branch on last line
	ldi	r16,k46
	rjmp	L030A
;	-----------	jump on last line
L0309:
	ldi	r16,k41
L030A:
	 rcall	L01FC
L030B:
	ldi	r30,k0F
	jmp	L1549
;	-----------	jump on last line
L030E:
	cpi	r24,k20
	ldi	r16,k00
	rjmp	L0348
;	-----------	jump on last line
L0311:
	ldi	r16,k00
	rjmp	L01FC
;	-----------	jump on last line
L0313:
	cpi	r24,k00
	ldi	r16,k01
	cpc	r25,r16
	ldi	r16,k00
	rjmp	L0349
;	-----------	jump on last line
L0318:
	 rcall	L035C
	cp	r16,r24
	cpc	r17,r25
	cpc	r18,r26
	cpc	r18,r27
	ret
;----------------------*
; pc=0x31E(0x63C)
;
L031E:
	lds	r16,D0080
	cpi	r16,k01
	ret
;----------------------*
; pc=0x322(0x644)
;
L0322:
	mov	r9,r16
	 call	L142A
	mov	r8,r16
	or	r9,r17
	 rcall	L0796
	tst	r16
	ret
;----------------------*
; pc=0x32A(0x654)
;
L032A:
	ldi	r30,kA9
	ldi	r31,k02
	ret
;----------------------*
; pc=0x32D(0x65A)
;
L032D:
	ldi	r16,kFF
L032E:
	add	r6,r16
	adc	r7,r16
	ret
;----------------------*
; pc=0x331(0x662)
;
L0331:
	lds	r16,D018D
	tst	r16
	ret
;----------------------*
; pc=0x335(0x66A)
;
L0335:
	lds	r16,D0075
	tst	r16
	ret
;----------------------*
; pc=0x339(0x672)
;
L0339:
	mov	r24,r8
	mov	r25,r9
	ldi	r26,k00
	ldi	r27,k00
	ret
;----------------------*
; pc=0x33E(0x67C)
;
L033E:
	 rcall	L0361
L033F:
	mov	r16,r24
	mov	r17,r25
	ret
;----------------------*
; pc=0x342(0x684)
;
L0342:
	subi	r24,kFF
	sbci	r25,kFF
	sbci	r26,kFF
	sbci	r27,kFF
	ret
;----------------------*
; pc=0x347(0x68E)
;
L0347:
	cpi	r24,k60
L0348:
	cpc	r25,r16
L0349:
	cpc	r26,r16
	cpc	r27,r16
	ret
;----------------------*
; pc=0x34C(0x698)
;
L034C:
	mov	r20,r4
	mov	r21,r5
	lsr	r21
	ror	r20
	ret
;----------------------*
; pc=0x351(0x6A2)
;
L0351:
	 call	L0D4C
L0353:
	ldi	r30,k6F
	ldi	r31,k00
	ret
;----------------------*
; pc=0x356(0x6AC)
;
L0356:
	ld	r20,Z
	ldd	r21,Z+o01
	ldd	r22,Z+o02
	ldd	r23,Z+o03
	ret
;----------------------*
; pc=0x35B(0x6B6)
;
L035B:
	rjmp	L0232
;	-----------	jump on last line
L035C:
	ldi	r17,k00
	add	r16,r8
	adc	r17,r9
	ldi	r18,k00
	ret
;----------------------*
; pc=0x361(0x6C2)
;
L0361:
	ldi	r18,k81
	ldi	r19,k00
	ret
;----------------------*
; pc=0x364(0x6C8)
;
L0364:
	 call	L1538
	lds	r12,D02AB
	 rcall	L0487
	 rcall	L032A
	ld	r4,Z
	ldd	r5,Z+o01
	 rcall	L0331
	 brne	L0371
;	-----		branch on last line
	 rcall	L0335
	 brne	L0371
;	-----		branch on last line
	 rcall	L01F5
L0371:
	 call	L142A
	mov	r14,r16
	 call	L142A
	mov	r10,r16
	 call	L142A
	 call	L142A
	 rcall	L0322
	 brne	L037E
;	-----		branch on last line
	rjmp	L0457
;	-----------	jump on last line
L037E:
	 call	L142A
	 rcall	L0339
	rjmp	L0385
;	-----------	jump on last line
L0382:
	 call	L142A
L0384:
	 rcall	L0342
L0385:
	mov	r16,r10
	 rcall	L0318
	 brcc	L0389
;	-----		branch on last line
	rjmp	L0457
;	-----------	jump on last line
L0389:
	 rcall	L031E
	 breq	L0382
;	-----		branch on last line
	mov	r16,r14
	subi	r16,kA0
	 brne	L038F
;	-----		branch on last line
	rjmp	L03FE
;	-----------	jump on last line
L038F:
	subi	r16,k10
	 breq	L03C4
;	-----		branch on last line
	dec	r16
	 brne	L0394
;	-----		branch on last line
	rjmp	L0422
;	-----------	jump on last line
L0394:
	dec	r16
	 brne	L0397
;	-----		branch on last line
	rjmp	L044C
;	-----------	jump on last line
L0397:
	dec	r16
	 brne	L039A
;	-----		branch on last line
	rjmp	L0452
;	-----------	jump on last line
L039A:
	subi	r16,k6D
	 breq	L03A4
;	-----		branch on last line
	subi	r16,k02
	 breq	L03BD
;	-----		branch on last line
	subi	r16,k0E
	 breq	L03C1
;	-----		branch on last line
	subi	r16,k30
	 brne	L03A3
;	-----		branch on last line
	rjmp	L041E
;	-----------	jump on last line
L03A3:
	rjmp	L0382
;	-----------	jump on last line
L03A4:
	 rcall	L030E
	 brcc	L03AA
;	-----		branch on last line
	 rcall	L0482
	 call	L0BAA
	rjmp	L0384
;	-----------	jump on last line
L03AA:
	 rcall	L0347
	 brcc	L03B1
;	-----		branch on last line
	 rcall	L0482
	subi	r16,k20
L03AE:
	 call	L0BBD
	rjmp	L0384
;	-----------	jump on last line
L03B1:
	 rcall	L0214
	 breq	L03B9
;	-----		branch on last line
	 rcall	L0313
	 brcc	L03B9
;	-----		branch on last line
	 rcall	L0482
	 call	L0BDD
	rjmp	L0384
;	-----------	jump on last line
L03B9:
	 rcall	L047C
	 call	L0C3A
	rjmp	L0384
;	-----------	jump on last line
L03BD:
	 rcall	L047C
	 call	L0C3F
	rjmp	L0384
;	-----------	jump on last line
L03C1:
	 rcall	L0482
	subi	r16,kC0
	rjmp	L03AE
;	-----------	jump on last line
L03C4:
	lds	r16,D0079
	tst	r16
	 brne	L03DC
;	-----		branch on last line
	 rcall	L0466
	 rcall	L0494
	 rcall	L0466
	 rcall	L04A1
	 rcall	L048A
	 breq	L03CF
;	-----		branch on last line
	rjmp	L0384
;	-----------	jump on last line
L03CF:
	 rcall	L0361
	 rcall	L0499
	 rcall	L04A4
	 call	L11B3
	 rcall	L0487
L03D5:
	cp	r6,r4
	cpc	r7,r5
	 brcs	L03D9
;	-----		branch on last line
	rjmp	L0384
;	-----------	jump on last line
L03D9:
	ldi	r16,kFF
	 rcall	L045C
	rjmp	L03D5
;	-----------	jump on last line
L03DC:
	 rcall	L045A
	 rcall	L045A
	mov	r16,r10
	 rcall	L035C
	cp	r24,r16
	cpc	r25,r17
	cpc	r26,r18
	cpc	r27,r18
	 breq	L03E6
;	-----		branch on last line
	rjmp	L0384
;	-----------	jump on last line
L03E6:
	 rcall	L04A7
	cp	r10,r30
	cpc	r18,r31
	 rcall	L033E
	 brcc	L03EE
;	-----		branch on last line
	sub	r16,r10
	sbci	r17,k00
	rjmp	L03F3
;	-----------	jump on last line
L03EE:
	 rcall	L034C
	sub	r16,r20
	sbc	r17,r21
	subi	r16,kFF
	sbci	r17,kFF
L03F3:
	 call	L1245
	 rcall	L0487
	rjmp	L03F9
;	-----------	jump on last line
L03F7:
	ldi	r16,kFF
	 rcall	L045C
L03F9:
	cp	r6,r4
	cpc	r7,r5
	 brcs	L03F7
;	-----		branch on last line
	 rcall	L0487
	rjmp	L0384
;	-----------	jump on last line
L03FE:
	 rcall	L0474
	 rcall	L0494
	 rcall	L0474
	subi	r16,kFF
	sbci	r17,kFF
	 rcall	L048A
	 breq	L0406
;	-----		branch on last line
	rjmp	L0384
;	-----------	jump on last line
L0406:
	mov	r20,r10
	 rcall	L0361
	mov	r30,r24
	mov	r31,r25
	mov	r16,r4
	mov	r17,r5
	lsr	r17
	ror	r16
	sub	r30,r16
	sbc	r31,r17
	adiw	r30,k01
	 rcall	L0499
	and	r16,r30
	and	r17,r31
	 call	L10B0
	 rcall	L0487
L0417:
	cp	r6,r4
	cpc	r7,r5
	 brcs	L041B
;	-----		branch on last line
	rjmp	L0384
;	-----------	jump on last line
L041B:
	ldi	r16,kFF
	 rcall	L045C
	rjmp	L0417
;	-----------	jump on last line
L041E:
	 rcall	L047C
	 call	L0D1C
	rjmp	L0384
;	-----------	jump on last line
L0422:
	 call	L142A
	mov	r18,r16
	tst	r12
	 breq	L0448
;	-----		branch on last line
	 rcall	L0463
	 rcall	L04A4
	 rcall	L0494
	mov	r20,r12
	ldi	r21,k00
	subi	r20,k01
	sbci	r21,k00
	mov	r22,r21
	lsl	r22
	sbc	r22,r22
	mov	r23,r22
	and	r20,r24
	and	r21,r25
	and	r22,r26
	and	r23,r27
	 rcall	L0463
	mov	r18,r17
	lsl	r18
	sbc	r18,r18
	cp	r20,r16
	cpc	r21,r17
	cpc	r22,r18
	cpc	r23,r18
	 breq	L0440
;	-----		branch on last line
	rjmp	L0384
;	-----------	jump on last line
L0440:
	 rcall	L0361
	 rcall	L0463
	com	r16
	com	r17
	 rcall	L04A4
	 call	L1312
	rjmp	L0384
;	-----------	jump on last line
L0448:
	 rcall	L033F
	 call	L12F0
	rjmp	L0384
;	-----------	jump on last line
L044C:
	 call	L142A
	mov	r17,r24
	 call	L1352
	rjmp	L0384
;	-----------	jump on last line
L0452:
	 call	L142A
	 call	L1390
	rjmp	L0384
;	-----------	jump on last line
L0457:
	ldi	r30,k0F
	jmp	L1549
;	-----------	jump on last line
L045A:
	 call	L142A
L045C:
	 rcall	L0232
	st	Z,r16
	ldi	r16,k01
	add	r6,r16
	ldi	r16,k00
	adc	r7,r16
	ret
;----------------------*
; pc=0x463(0x8C6)
;
L0463:
	mov	r16,r12
	ldi	r17,k00
	rjmp	L04A1
;	-----------	jump on last line
L0466:
	 call	L142A
	mov	r18,r16
	mov	r16,r4
	mov	r17,r5
	 rcall	L04A1
	 rcall	L04A7
	and	r30,r24
	and	r31,r25
	lsl	r30
	rol	r31
	sub	r16,r30
	sbc	r17,r31
	ret
;----------------------*
; pc=0x474(0x8E8)
;
L0474:
	 call	L142A
	mov	r18,r16
	 rcall	L049D
	 rcall	L04A4
	lsl	r16
	rol	r17
	ret
;----------------------*
; pc=0x47C(0x8F8)
;
L047C:
	 call	L142A
	mov	r18,r16
	mov	r16,r24
	mov	r17,r25
	ret
;----------------------*
; pc=0x482(0x904)
;
L0482:
	 call	L142A
	mov	r17,r16
	mov	r16,r24
	ret
;----------------------*
; pc=0x487(0x90E)
;
L0487:
	clr	r6
	clr	r7
	ret
;----------------------*
; pc=0x48A(0x914)
;
L048A:
	mov	r30,r16
	mov	r31,r17
	 rcall	L0234

	st	Z,r18
	 rcall	L049D
	 rcall	L04A4
	 rcall	L04A7
	cp	r16,r30
	cpc	r17,r31
	ret
;----------------------*
; pc=0x494(0x928)
;
L0494:
	mov	r30,r16
	mov	r31,r17
	 rcall	L0234
	st	Z,r18
	ret
;----------------------*
; pc=0x499(0x932)
;
L0499:
	 rcall	L049D
	com	r16
	com	r17
	ret
;----------------------*
; pc=0x49D(0x93A)
;
L049D:
	mov	r16,r4
	mov	r17,r5
	lsr	r17
	ror	r16
L04A1:
	subi	r16,k01
	sbci	r17,k00
	ret
;----------------------*
; pc=0x4A4(0x948)
;
L04A4:
	and	r16,r24
	and	r17,r25
	ret
;----------------------*
; pc=0x4A7(0x94E)
;
L04A7:
	mov	r30,r4
	mov	r31,r5
	lsr	r31
	ror	r30
	sbiw	r30,k01
	ret
;----------------------*
; pc=0x4AD(0x95A)
;
L04AD:
	 rcall	L04C0
	 breq	L04BF
;	-----		branch on last line
	 rcall	L0351
	 rcall	L04C3
	andi	r16,kFE
	andi	r17,k0F
	cpi	r16,k3E
	sbci	r17,k00
	 breq	L04B8
;	-----		branch on last line
	ldi	r16,k46
	rjmp	L04B9
;	-----------	jump on last line
L04B8:
	ldi	r16,k41
L04B9:
	 rcall	L01FC
	 call	L1118
	ldi	r16,k01
	sts	D0075,r16
L04BF:
	ret
;----------------------*
; pc=0x4C0(0x980)
;
L04C0:
	 rcall	L0796
	tst	r16
	ret
;----------------------*
; pc=0x4C3(0x986)
;
L04C3:
	st	Z,r16
	std	Z+o01,r17
	std	Z+o02,r18
	std	Z+o03,r19
	ret
;----------------------*
; pc=0x4C8(0x990)
;
L04C8:
	 rcall	L04C0
	 breq	L04D0
;	-----		branch on last line
	 call	L115A
	ldi	r16,k00
	sts	D0075,r16
	 rcall	L01FB
L04D0:
	ret
;----------------------*
; pc=0x4D1(0x9A2)
;
L04D1:
	 rcall	L0206
	 rcall	L04C0
	 breq	L04E1
;	-----		branch on last line
	 call	L1186
	ldi	r24,k00
	ldi	r25,k00
	rjmp	L04DA
;	-----------	jump on last line
L04D9:
	 rcall	L020D
L04DA:
	 rcall	L032A
	ld	r16,Z
	ldd	r17,Z+o01
	cp	r24,r16
	cpc	r25,r17
	 brcs	L04D9
;	-----		branch on last line
	 rcall	L01FB
L04E1:
	ld	r24,Y+
	ld	r25,Y+
	ret
;----------------------*
; pc=0x4E4(0x9C8)
;
L04E4:
	 rcall	L04C0
	 breq	L04EC
;	-----		branch on last line
	ldi	r16,k48
	ldi	r17,k00
	ldi	r18,k00
	 call	L1562
	 rcall	L01FB
L04EC:
	ret
;----------------------*
; pc=0x4ED(0x9DA)
;
L04ED:
	 rcall	L0538
	cpi	r24,k4A
	 brne	L04F4
;	-----		branch on last line
	 call	L142A
	mov	r24,r16
	rjmp	L04F6
;	-----------	jump on last line
L04F4:
	ldi	r16,k46
	 rcall	L01FC
L04F6:
	cpi	r24,k54
	 brne	L04FC
;	-----		branch on last line
	 call	L142A
	mov	r24,r16
	rjmp	L04FE
;	-----------	jump on last line
L04FC:
	ldi	r16,k46
	 rcall	L01FC
L04FE:
	cpi	r24,k41
	 brne	L0504
;	-----		branch on last line
	 call	L142A
	mov	r24,r16
	rjmp	L0506
;	-----------	jump on last line
L0504:
	ldi	r16,k46
	 rcall	L01FC
L0506:
	cpi	r24,k47
	 brne	L050C
;	-----		branch on last line
	 call	L142A
	mov	r24,r16
	rjmp	L050E
;	-----------	jump on last line
L050C:
	ldi	r16,k46
	 rcall	L01FC
L050E:
	cpi	r24,k75
	 brne	L0514
;	-----		branch on last line
	 call	L142A
	mov	r24,r16
	rjmp	L0516
;	-----------	jump on last line
L0514:
	ldi	r16,k46
	 rcall	L01FC
L0516:
	cpi	r24,k70
	 brne	L051C
;	-----		branch on last line
	 call	L142A
	mov	r24,r16
	rjmp	L051E
;	-----------	jump on last line
L051C:
	ldi	r16,k46
	 rcall	L01FC
L051E:
	cpi	r24,k67
	 brne	L0524
;	-----		branch on last line
	 call	L142A
	mov	r24,r16
	rjmp	L0526
;	-----------	jump on last line
L0524:
	ldi	r16,k46
	 rcall	L01FC
L0526:
	cpi	r24,k72
	 brne	L0536
;	-----		branch on last line
	 rcall	L04C0
	 breq	L0534
;	-----		branch on last line
	 rcall	L01FB
	ldi	r16,k06
	 call	L0115
L052E:
	 rcall	L0209
	 brne	L052E
;	-----		branch on last line
	cli
	jmp	L1E00
;	-----------	jump on last line
	rjmp	L0536
;	-----------	jump on last line
L0534:
	ldi	r16,k46
	 rcall	L01FC
L0536:
	ld	r24,Y+
	ret
;----------------------*
; pc=0x538(0xA70)
;
L0538:
	st	-Y,r24
	 call	L142A
	mov	r24,r16
	ret
;----------------------*
; pc=0x53D(0xA7A)
;
L053D:
	 rcall	L01FF
	 brne	L0540
;	-----		branch on last line
	rjmp	L05D1
;	-----------	jump on last line
L0540:
	mov	r16,r25
	ldi	r30,k9E
	ldi	r31,k00
	jmp	L14E4
;	-----------	jump on last line
	sts	D0061,r24
	 rcall	L01FB
	ldi	r30,kA0
	ldi	r31,k0F
L054A:
	sbiw	r30,k01
	mov	r16,r30
	or	r16,r31
	 brne	L054A
;	-----		branch on last line
	lds	r16,D0061
	 call	L10FF
	 call	L13DC
	rjmp	L05D1
;	-----------	jump on last line
	mov	r16,r24
	 call	L1038
L0558:
	ldi	r16,k41
	rjmp	L05D0
;	-----------	jump on last line
	sts	D0062,r24
	ldi	r16,kEC
	ldi	r17,k0C
	ldi	r30,k63
	ldi	r31,k00
	st	Z,r16
L0561:
	std	Z+o01,r17
	rjmp	L0558
;	-----------	jump on last line
	 call	L1044
	rjmp	L0558
;	-----------	jump on last line
	ldi	r30,k86
	ldi	r31,k01
L0568:
	ld	r16,Z
	st	Z,r16
	std	Z+o01,r24
	rjmp	L0558
;	-----------	jump on last line
	ldi	r30,k86
	ldi	r31,k01
	ldd	r17,Z+o01
	st	Z,r24
	std	Z+o01,r17
	ldi	r18,k00
L0572:
	mov	r16,r24
	 call	L0D1C
	rjmp	L0558
;	-----------	jump on last line
	ldi	r30,k88
	ldi	r31,k01
	rjmp	L0568
;	-----------	jump on last line
	ldi	r30,k88
	ldi	r31,k01
	ldd	r17,Z+o01
	st	Z,r24
	std	Z+o01,r17
	ldi	r18,k01
	rjmp	L0572
;	-----------	jump on last line
	ldi	r30,k82
	ldi	r31,k01
	rjmp	L0568
;	-----------	jump on last line
	ldi	r30,k82
	ldi	r31,k01
L0585:
	ldd	r17,Z+o01
	st	Z,r24
	rjmp	L0561
;	-----------	jump on last line
	ldi	r30,k84
	ldi	r31,k01
	rjmp	L0568
;	-----------	jump on last line
	ldi	r30,k84
	ldi	r31,k01
	rjmp	L0585
;	-----------	jump on last line
	mov	r20,r24
	ldi	r30,k84
	ldi	r31,k01
	ld	r18,Z
	ldd	r19,Z+o01
	ldi	r30,k82
	ldi	r31,k01
	ld	r16,Z
	ldd	r17,Z+o01
	 call	L104D
	rjmp	L0558
;	-----------	jump on last line
	mov	r17,r24
	ldi	r16,k00
	 call	L011A
	mov	r16,r24
	 call	L0A79
	rjmp	L0558
;	-----------	jump on last line
	ldi	r17,k01
L05A3:
	mov	r16,r24
	 call	L10E8
	rjmp	L0558
;	-----------	jump on last line
	ldi	r17,k00
	rjmp	L05A3
;	-----------	jump on last line
	 rcall	L032A
	rjmp	L0585
;	-----------	jump on last line
	 rcall	L032A
	rjmp	L0568
;	-----------	jump on last line
	sts	D02AB,r24
	rjmp	L0558
;	-----------	jump on last line
	sts	D0079,r24
	rjmp	L0558
;	-----------	jump on last line
	sts	D007A,r24
	rjmp	L0558
;	-----------	jump on last line
	sts	D0077,r24
	rjmp	L0558
;	-----------	jump on last line
	sts	D0078,r24
	rjmp	L0558
;	-----------	jump on last line
	sts	D007C,r24
	rjmp	L0558
;	-----------	jump on last line
	sts	D007B,r24
	rjmp	L0558
;	-----------	jump on last line
	sts	D007D,r24
	rjmp	L0558
;	-----------	jump on last line
	sts	D007E,r24
	rjmp	L0558
;	-----------	jump on last line
	tst	r24
	 breq	L05CD
;	-----		branch on last line
	sbi	DDRB,b4
	cbi	PORTB,b4
	rjmp	L0558
;	-----------	jump on last line
L05CD:
	cbi	DDRB,b4
	rjmp	L0558
;	-----------	jump on last line
	ldi	r16,k46
L05D0:
	 rcall	L01FC
L05D1:
	 rcall	L04E1
	ret
;----------------------*
; pc=0x5D3(0xBA6)
;
L05D3:
	 rcall	L0538
	 rcall	L04C0
	 breq	L060A
;	-----		branch on last line
	mov	r16,r24
	ldi	r30,kF6
	ldi	r31,k00
	jmp	L14E4
;	-----------	jump on last line
	lds	r16,D0061
L05DD:
	ldi	r17,k00
L05DE:
	 call	L143C
	ldi	r16,k41
	rjmp	L0609
;	-----------	jump on last line
	 call	L1088
	rjmp	L05DD
;	-----------	jump on last line
	ldi	r16,k80
	rjmp	L05DD
;	-----------	jump on last line
	 call	L00A5
	rjmp	L05DD
;	-----------	jump on last line
	ldi	r16,k00
	 call	L0123
	rjmp	L05DD
;	-----------	jump on last line
	 rcall	L0351
	 rcall	L04C3
	rjmp	L05DD
;	-----------	jump on last line
	 rcall	L0353
	ldd	r16,Z+o01
	rjmp	L05DD
;	-----------	jump on last line
	 rcall	L0353
	ldd	r16,Z+o02
	ldd	r17,Z+o03
	rjmp	L05DE
;	-----------	jump on last line
	 rcall	L0353
	ldd	r16,Z+o03
	rjmp	L05DD
;	-----------	jump on last line
	ldi	r16,k01
L05FC:
	 call	L10F7
	rjmp	L05DD
;	-----------	jump on last line
	ldi	r16,k00
	rjmp	L05FC
;	-----------	jump on last line
	 rcall	L022A
	rjmp	L05DD
;	-----------	jump on last line
	lds	r16,D0080
	rjmp	L05DD
;	-----------	jump on last line
	ldi	r16,k46
	 rcall	L01FC
	ldi	r16,k46
L0609:
	 rcall	L01FC
L060A:
	ld	r24,Y+
	ret
;----------------------*
; pc=0x60C(0xC18)
;
L060C:
	 rcall	L0206
	 rcall	L04C0
	 breq	L061F
;	-----		branch on last line
	 rcall	L031E
	 brne	L0617
;	-----		branch on last line
	 rcall	L0620
	ldi	r16,k55
	 rcall	L01FC
	 rcall	L0620
	ldi	r16,k46
	rjmp	L061E
;	-----------	jump on last line
L0617:
	 rcall	L0624
	 rcall	L0311
	mov	r16,r25
	 rcall	L01FC
	mov	r16,r24
	 rcall	L01FC
	ldi	r16,k41
L061E:
	 rcall	L01FC
L061F:
	rjmp	L04E1
;	-----------	jump on last line
L0620:
	ldi	r16,kAA
	ldi	r17,k00
	jmp	L143C
;	-----------	jump on last line
L0624:
	 call	L0C20
L0626:
	mov	r24,r16
	mov	r25,r17
	ret
;----------------------*
; pc=0x629(0xC52)
;
L0629:
	 call	L1543
	 rcall	L0331
	 brne	L0630
;	-----		branch on last line
	 rcall	L0335
	 brne	L0630
;	-----		branch on last line
	 rcall	L01F5
L0630:
	 call	L142A
	 call	L142A
	mov	r25,r16
	mov	r26,r16
	 rcall	L0646
	mov	r24,r16
	or	r25,r17
	or	r26,r18
	or	r27,r18
	 rcall	L04C0
	 breq	L0643
;	-----		branch on last line
	 rcall	L033F
	mov	r18,r26
	mov	r19,r27
	 call	L0BF5
	 rcall	L01FB
L0643:
	ldi	r30,k04
	jmp	L1554
;	-----------	jump on last line
L0646:
	lsl	r26
	sbc	r26,r26
	mov	r27,r26
	 call	L142A
	mov	r18,r17
	lsl	r18
	sbc	r18,r18
	ret
;----------------------*
; pc=0x64F(0xC9E)
;
L064F:
	 rcall	L0206
	 rcall	L0218
	 rcall	L04C0
	 breq	L0661
;	-----		branch on last line
	 rcall	L0223
;	--------- this is skippy
	 sbrs	r16,b7
	 rjmp	L0659
;	--------- last may be skipped
; pc=0x656(0xCAC)
;
	ldi	r16,k00
	 rcall	L021D
	 rcall	L0624
L0659:
	 rcall	L0311
	mov	r16,r25
	 rcall	L01FC
	ldi	r17,k00
	mov	r16,r24
	 call	L143C
	 rcall	L01FB
L0661:
	 rcall	L04E1
	ret
;----------------------*
; pc=0x663(0xCC6)
;
L0663:
	 rcall	L0218
	 rcall	L04C0
	 breq	L067A
;	-----		branch on last line
	 rcall	L0223
;	--------- this is skippy
	 sbrs	r16,b7
	 rjmp	L0679
;	--------- last may be skipped
; pc=0x669(0xCD2)
;
	andi	r16,k06
	cpi	r16,k04
	 brne	L0673
;	-----		branch on last line
	 rcall	L067B
	 call	L0B96
	ldi	r16,k00
	sts	D0080,r16
	rjmp	L0679
;	-----------	jump on last line
L0673:
	lds	r16,D007F
	andi	r16,k06
	 brne	L0679
;	-----		branch on last line
	 call	L0A97
L0679:
	 rcall	L01FB
L067A:
	ret
;----------------------*
; pc=0x67B(0xCF6)
;
L067B:
	ldi	r16,k01
	sts	D0080,r16
	ret
;----------------------*
; pc=0x67F(0xCFE)
;
L067F:
	 rcall	L04C0
	 breq	L0683
;	-----		branch on last line
	 rcall	L0311
	 rcall	L01FB
L0683:
	ret
;----------------------*
; pc=0x684(0xD08)
;
L0684:
	 rcall	L0218
	 rcall	L04C0
	 breq	L0690
;	-----		branch on last line
	 rcall	L067B
	 rcall	L0226
;	--------- this is skippy
	 sbrs	r16,b7
	 rjmp	L0690
;	--------- last may be skipped
; pc=0x68B(0xD16)
;
	andi	r16,k06
	cpi	r16,k04
	 brne	L0690
;	-----		branch on last line
	 call	L0A7E
L0690:
	ret
;----------------------*
; pc=0x691(0xD22)
;
L0691:
	 rcall	L0218
	 rcall	L04C0
	 breq	L06A5
;	-----		branch on last line
	 rcall	L0223
;	--------- this is skippy
	 sbrs	r16,b7
	 rjmp	L06A4
;	--------- last may be skipped
; pc=0x697(0xD2E)
;
	 rcall	L067B
	lds	r16,D0062
	tst	r16
	 breq	L069F
;	-----		branch on last line
	 call	L0B69
	rjmp	L06A1
;	-----------	jump on last line
L069F:
	 call	L0AA2
L06A1:
	ldi	r16,k00
	sts	D0080,r16
L06A4:
	 rcall	L01FB
L06A5:
	ret
;----------------------*
; pc=0x6A6(0xD4C)
;
L06A6:
	 rcall	L0206
	 call	L142A
	 rcall	L0626
	 call	L142A
	mov	r17,r16
	or	r25,r17
	 rcall	L033F
	 rcall	L04E1
	ret
;----------------------*
; pc=0x6B1(0xD62)
;
L06B1:
	 call	L1543
	mov	r26,r16
	mov	r27,r17
	mov	r25,r18
	ldi	r24,k00
	rjmp	L06C1
;	-----------	jump on last line
L06B8:
	 call	L142A
	ldi	r17,k00
	mov	r30,r26
	mov	r31,r27
	add	r30,r24
	adc	r31,r17
	st	Z,r16
	inc	r24
L06C1:
	cp	r24,r25
	 brcs	L06B8
;	-----		branch on last line
	ldi	r30,k04
	jmp	L1554
;	-----------	jump on last line
L06C6:
	 call	L1543
	 call	L142A
	 rcall	L0626
	mov	r26,r17
	 rcall	L0646
	or	r25,r16
	or	r26,r17
	or	r27,r18
	 call	L142A
	or	r26,r16
	or	r27,r17
	 call	L142A
	or	r27,r16
	 rcall	L033F
	mov	r18,r26
	mov	r19,r27
	ldi	r30,k04
	jmp	L1554
;	-----------	jump on last line
L06DD:
	ldi	r18,k08
	ldi	r16,k32
	ldi	r17,k02
	 rcall	L06B1
	ldi	r18,k08
	ldi	r16,k3A
	ldi	r17,k02
	 rcall	L06B1
	ldi	r18,k08
	ldi	r16,k42
	ldi	r17,k02
	 rcall	L06B1
	ldi	r18,k08
	ldi	r16,k4A
	ldi	r17,k02
	 rcall	L06B1
	ldi	r18,k14
	ldi	r16,k52
	ldi	r17,k02
	 rcall	L06B1
	ldi	r18,k14
	ldi	r16,k66
	ldi	r17,k02
	 rcall	L06B1
	ldi	r18,k14
	ldi	r16,k7A
	ldi	r17,k02
	 rcall	L06B1
	ldi	r18,k14
	ldi	r16,k8E
	ldi	r17,k02
	 rcall	L06B1
	 call	L142A
	sts	D02A2,r16
	 call	L142A
	sts	D02A3,r16
	 call	L142A
	sts	D02A8,r16
	 rcall	L06A6
	 rcall	L032A
	st	Z,r16
	std	Z+o01,r17
	 call	L142A
	sts	D02AB,r16
	 rcall	L06C6
	ldi	r30,kA4
	ldi	r31,k02
	 rcall	L04C3
	 call	L142A
	sts	D02AC,r16
	 rcall	L04C0
	 breq	L071D
;	-----		branch on last line
	ldi	r16,k41
	rjmp	L071E
;	-----------	jump on last line
L071D:
	ldi	r16,k46
L071E:
	ldi	r17,k00
	jmp	L143C
;	-----------	jump on last line
L0721:
	 rcall	L0206
	 call	L142A
	 rcall	L022D
	mov	r24,r16
	or	r25,r17
	 rcall	L04C0
	 breq	L072D
;	-----		branch on last line
	 rcall	L033F
	 call	L108C
	 rcall	L01FB
L072D:
	 rcall	L04E1
	ret
;----------------------*
; pc=0x72F(0xE5E)
;
L072F:
	 rcall	L01FF
	 breq	L0736
;	-----		branch on last line
	mov	r17,r24
	mov	r16,r25
	 call	L07D1
	 rcall	L01FB
L0736:
	 rcall	L04E1
	ret
;----------------------*
; pc=0x738(0xE70)
;
L0738:
	 call	L1541
	sbiw	r28,k0C
	 call	L142A
	mov	r26,r16
	 call	L142A
	mov	r24,r16
	 rcall	L022D
	mov	r4,r16
	tst	r26
	 brne	L075A
;	-----		branch on last line
	cpi	r24,k08
	 brcc	L074B
;	-----		branch on last line
	 call	L142A
	std	Y+o00,r16
	rjmp	L0756
;	-----------	jump on last line
L074B:
	ldi	r26,k00
L074C:
	 call	L142A
	mov	r30,r28
	mov	r31,r29
	ldi	r27,k00
	add	r30,r26
	adc	r31,r27
	st	Z,r16
	 rcall	L0772
	 brcc	L074C
;	-----		branch on last line
L0756:
	 rcall	L04C0
	 breq	L076E
;	-----		branch on last line
	 rcall	L0779
	rjmp	L076D
;	-----------	jump on last line
L075A:
	 rcall	L04C0
	 breq	L076E
;	-----		branch on last line
	 rcall	L0779
	cpi	r24,k08
	 brcc	L0762
;	-----		branch on last line
	ldd	r16,Y+o06
	 rcall	L01FC
	rjmp	L076D
;	-----------	jump on last line
L0762:
	ldi	r26,k00
L0763:
	mov	r30,r28
	mov	r31,r29
	adiw	r30,k06
	ldi	r27,k00
	add	r30,r26
	adc	r31,r27
	ld	r16,Z
	 rcall	L01FC
	 rcall	L0772
	 brcc	L0763
;	-----		branch on last line
L076D:
	 rcall	L01FB
L076E:
	adiw	r28,k0C
	ldi	r30,k06
	jmp	L1552
;	-----------	jump on last line
L0772:
	inc	r26
	mov	r16,r24
	lsr	r16
	lsr	r16
	lsr	r16
	cp	r16,r26
	ret
;----------------------*
; pc=0x779(0xEF2)
;
L0779:
	clr	r5
	st	-Y,r5
	st	-Y,r4
	mov	r22,r25
	mov	r20,r24
	ldi	r21,k00
	mov	r18,r28
	mov	r19,r29
	subi	r18,kF8
	sbci	r19,kFF
	mov	r16,r28
	mov	r17,r29
	subi	r16,kFE
	sbci	r17,kFF
	jmp	L084C
;	-----------	jump on last line
L0789:
	 rcall	L04C0
	 breq	L0795
;	-----		branch on last line
	 call	L07A4
	tst	r16
	 breq	L0793
;	-----		branch on last line
	ldi	r16,k41
	ldi	r17,k00
	jmp	L143C
;	-----------	jump on last line
L0793:
	ldi	r16,k46
	 rcall	L01FC
L0795:
	ret
;----------------------*
; pc=0x796(0xF2C)
;
L0796:
	 call	L142A
	 call	L142A
	cpi	r16,k20
	sbci	r17,k00
	 breq	L07A1
;	-----		branch on last line
	ldi	r16,k45
	 rcall	L01FC
	ldi	r16,k00
	ret
;----------------------*
; pc=0x7A1(0xF42)
;
L07A1:
	 rcall	L01FB
	ldi	r16,k01
	ret
;----------------------*
; pc=0x7A4(0xF48)
;
L07A4:
	cli
	st	-Y,r17
	st	-Y,r18
	st	-Y,r19
	st	-Y,r20
	st	-Y,r21
	ldi	r16,kFF
	ldi	r17,kFF
	in	r18,PINB
	andi	r18,k40
	ldi	r21,k08
L07AF:
	ldi	r19,k00
	cp	r16,r19
	cpc	r17,r19
	 breq	L07C6
;	-----		branch on last line
	ldi	r20,k20
	in	r19,PORTB
	eor	r19,r20
	out	PORTB,r19
	in	r19,PINB
	andi	r19,k40
	cp	r18,r19
	mov	r18,r19
	 breq	L07BE
;	-----		branch on last line
	dec	r21
	 breq	L07C8
;	-----		branch on last line
L07BE:
	ldi	r19,k00
	dec	r16
	 brne	L07C2
;	-----		branch on last line
	dec	r17
L07C2:
	ldi	r19,k1F
L07C3:
	dec	r19
	 brne	L07C3
;	-----		branch on last line
	rjmp	L07AF
;	-----------	jump on last line
L07C6:
	ldi	r16,k00
	rjmp	L07CA
;	-----------	jump on last line
L07C8:
	ldi	r16,k01
	rjmp	L07CA
;	-----------	jump on last line
L07CA:
	ld	r21,Y+
	ld	r20,Y+
	ld	r19,Y+
	ld	r18,Y+
	ld	r17,Y+
	sei
	ret
;----------------------*
; pc=0x7D1(0xFA2)
;
L07D1:
	 call	L1540
	mov	r22,r16
	mov	r5,r17
	ldi	r24,k00
	ldi	r25,k00
	ldi	r26,k00
	ldi	r27,k00
	lds	r16,D0077
	lds	r6,D0078
	add	r6,r16
	ldi	r16,k04
	add	r6,r16
	clr	r4
	rjmp	L07E9
;	-----------	jump on last line
L07E2:
	 rcall	L082E
	ldi	r17,k00
	mov	r30,r16
	 rcall	L0833
	 breq	L07E8
;	-----		branch on last line
	 rcall	L0838
L07E8:
	inc	r4
L07E9:
	lds	r16,D0077
	cp	r4,r16
	 brcs	L07E2
;	-----		branch on last line
	mov	r16,r24
	mov	r17,r25
	mov	r18,r26
	mov	r19,r27
	ldi	r20,k04
	 call	L14A6
	mov	r24,r22
	ldi	r25,k00
	ldi	r26,k00
	ldi	r27,k00
	add	r24,r16
	adc	r25,r17
	adc	r26,r18
	adc	r27,r19
	clr	r4
	rjmp	L0801
;	-----------	jump on last line
L07FE:
	 rcall	L0838
	 rcall	L082E
	inc	r4
L0801:
	lds	r16,D0078
	cp	r4,r16
	 brcs	L07FE
;	-----		branch on last line
	cbi	PORTB,b3
	 rcall	L083F
	 rcall	L083D
	 rcall	L0A5F
	clr	r4
	rjmp	L0812
;	-----------	jump on last line
L080B:
	cbi	PORTB,b5
L080C:
	 rcall	L0A5F
	lsr	r27
	ror	r26
	ror	r25
	ror	r24
	inc	r4
L0812:
	ldi	r17,k00
	mov	r30,r6
	 rcall	L0833
	mov	r16,r24
	 brge	L081B
;	-----		branch on last line
;	--------- this is skippy
	 sbrs	r24,b0
	 rjmp	L080B
;	--------- last may be skipped
; pc=0x819(0x1032)
;
	sbi	PORTB,b5
	rjmp	L080C
;	-----------	jump on last line
L081B:
;	--------- this is skippy
	 sbrs	r16,b0
	 rjmp	L081F
;	--------- last may be skipped
; pc=0x81D(0x103A)
;
	sbi	PORTB,b5
	rjmp	L0820
;	-----------	jump on last line

L081F:
	cbi	PORTB,b5
L0820:
	 rcall	L083F
	 rcall	L0A5F
	clr	r4
	rjmp	L0827
;	-----------	jump on last line
L0824:
	 rcall	L083D
	sbi	PORTB,b1
	inc	r4
L0827:
	cp	r4,r5
	 brcs	L0824
;	-----		branch on last line
	 rcall	L0A5F
	sbi	PORTB,b3
	ldi	r30,k07
	jmp	L1551
;	-----------	jump on last line
L082E:
	subi	r24,kFF
	sbci	r25,kFF
	sbci	r26,kFF
	sbci	r27,kFF
	ret
;----------------------*
; pc=0x833(0x1066)
;
L0833:
	ldi	r31,k00
	sbiw	r30,k01
	cp	r4,r30
	cpc	r17,r31
	ret
;----------------------*
; pc=0x838(0x1070)
;
L0838:
	lsl	r24
	rol	r25
	rol	r26
	rol	r27
	ret
;----------------------*
; pc=0x83D(0x107A)
;
L083D:
	cbi	PORTB,b1
	rjmp	L0A5F
;	-----------	jump on last line
L083F:
	sbi	PORTB,b1
	rjmp	L0A5F
;	-----------	jump on last line
L0841:
	sbi	PORTB,b1
	cbi	PORTB,b3
	 rcall	L0A5F
	 rcall	L0A5F
	 rcall	L0A5F
	 rcall	L0A5F
	 rcall	L0A5F
	 rcall	L083D
	 rcall	L083F
	sbi	PORTB,b3
	ret
;----------------------*
; pc=0x84C(0x1098)
;
L084C:
	 call	L1538
	mov	r12,r16
	mov	r13,r17
	mov	r26,r18
	mov	r27,r19
	mov	r8,r20
	mov	r9,r21
	mov	r14,r22
	ldd	r10,Y+o0F
	ldd	r11,Y+o10
	cbi	PORTB,b3
	mov	r16,r20
	mov	r17,r21
	subi	r16,k01
	sbci	r17,k00
	 rcall	L08D6
	add	r12,r16
	adc	r13,r17
	add	r26,r16
	adc	r27,r17
	ldi	r24,k01
	ldi	r25,k01
;	--------- this is skippy
	 sbrc	r11,b6
	 rjmp	L0867
;	--------- last may be skipped
; pc=0x865(0x10CA)
;
	 rcall	L083D
	 rcall	L0A5F
L0867:
	 rcall	L08D9
	 brcs	L0870
;	-----		branch on last line
	 rcall	L08E1
	 breq	L0870
;	-----		branch on last line
	 rcall	L08FC
	add	r16,r8
	adc	r17,r9
	 rcall	L08E3
	rjmp	L0874
;	-----------	jump on last line
L0870:
	mov	r6,r17
	clr	r7
	add	r6,r8
	adc	r7,r9
L0874:
	clr	r4
	clr	r5
	rjmp	L088F
;	-----------	jump on last line
L0877:
	cbi	PORTB,b5
L0878:
	 rcall	L0A5F
	 rcall	L08CC
	 brcc	L087E
;	-----		branch on last line
	tst	r16
	 breq	L087E
;	-----		branch on last line
	ldi	r24,k01
L087E:
	 rcall	L08E9
	 brcc	L0884
;	-----		branch on last line
	mov	r16,r17
	 rcall	L08D0
	 brcc	L0884
;	-----		branch on last line
	ldi	r25,k01
L0884:
	tst	r24
	 brne	L0888
;	-----		branch on last line
	sbiw	r26,k01
	ldi	r24,k01
L0888:
	tst	r25
	 brne	L088E
;	-----		branch on last line
	ldi	r16,kFF
	add	r12,r16
	adc	r13,r16
	ldi	r25,k01
L088E:
	 rcall	L08EF
L088F:
	mov	r30,r6
	mov	r31,r7
	sbiw	r30,k01
	cp	r4,r30
	cpc	r5,r31
	 brcc	L08A4
;	-----		branch on last line
;	--------- this is skippy
	 sbis	PINB,b6
	 rjmp	L089A
;	--------- last may be skipped
; pc=0x897(0x112E)
;
	 rcall	L08F4
	st	X,r16
	rjmp	L089B
;	-----------	jump on last line
L089A:
	 rcall	L08D4
L089B:
	tst	r14
	 breq	L08A1
;	-----		branch on last line
;	--------- this is skippy
	 sbis	PINB,b6
	 rjmp	L0877
;	--------- last may be skipped
; pc=0x89F(0x113E)
;
L089F:
	sbi	PORTB,b5
	rjmp	L0878
;	-----------	jump on last line
L08A1:
	 rcall	L08F7
	 breq	L0877
;	-----		branch on last line
	rjmp	L089F
;	-----------	jump on last line
L08A4:
;	--------- this is skippy
	 sbis	PINB,b6
	 rjmp	L08A8
;	--------- last may be skipped
; pc=0x8A6(0x114C)
;
	 rcall	L08F4
	rjmp	L08AB
;	-----------	jump on last line
L08A8:
	com	r24
	ld	r16,X
	and	r16,r24
L08AB:
	st	X,r16
	tst	r14
	 breq	L08B2
;	-----		branch on last line
;	--------- this is skippy
	 sbis	PINB,b6
	 rjmp	L08B4
;	--------- last may be skipped
; pc=0x8B0(0x1160)
;
L08B0:
	sbi	PORTB,b5
	rjmp	L08B5
;	-----------	jump on last line
L08B2:
	 rcall	L08F7
	 brne	L08B0
;	-----		branch on last line
L08B4:
	cbi	PORTB,b5
L08B5:
;	--------- this is skippy
	 sbrc	r11,b7
	 rjmp	L08C7
;	--------- last may be skipped
; pc=0x8B7(0x116E)
;
	 rcall	L083F
	 rcall	L0A5F
	ldi	r16,k3F
	and	r11,r16
	mov	r16,r10
	or	r16,r11
	 breq	L08C7
;	-----		branch on last line
	ldi	r24,k00
	rjmp	L08C2
;	-----------	jump on last line
L08C0:
	 rcall	L083D
	inc	r24
L08C2:
	ldi	r25,k00
	cp	r24,r10
	cpc	r25,r11
	 brcs	L08C0
;	-----		branch on last line
	sbi	PORTB,b1
L08C7:
	 rcall	L0A5F
	sbi	PORTB,b3
	ldi	r30,k11
	jmp	L1549
;	-----------	jump on last line
L08CC:
	lsl	r24
	lsl	r25
L08CE:
	lds	r16,D007A
L08D0:
	ldi	r17,k00
	cp	r4,r16
	cpc	r5,r17
	ret
;----------------------*
; pc=0x8D4(0x11A8)
;
L08D4:
	mov	r16,r24
	rjmp	L08FF
;	-----------	jump on last line
L08D6:
	ldi	r20,k03
	jmp	L146D
;	-----------	jump on last line
L08D9:
	ldi	r16,k00
	st	X,r16
L08DB:
	lds	r16,D007A
	lds	r17,D0079
	cp	r16,r17
	ret
;----------------------*
; pc=0x8E1(0x11C2)
;
L08E1:
	mov	r16,r17
	rjmp	L08EB
;	-----------	jump on last line
L08E3:
	lds	r6,D0079
	clr	r7
	add	r6,r16
	adc	r7,r17
	ret
;----------------------*
; pc=0x8E9(0x11D2)
;
L08E9:
	lds	r16,D0079
L08EB:
	lds	r17,D007A
	cp	r16,r17
	ret
;----------------------*
; pc=0x8EF(0x11DE)
;
L08EF:
	ldi	r16,k01
	add	r4,r16
	ldi	r16,k00
	adc	r5,r16
	ret
;----------------------*
; pc=0x8F4(0x11E8)
;
L08F4:
	ld	r16,X
	or	r16,r24
	ret
;----------------------*
; pc=0x8F7(0x11EE)
;
L08F7:
	mov	r30,r12
	mov	r31,r13
	ld	r16,Z
	and	r16,r25
	ret
;----------------------*
; pc=0x8FC(0x11F8)
;
L08FC:
	mov	r16,r17
	ldi	r17,k00
	ret
;----------------------*
; pc=0x8FF(0x11FE)
;
L08FF:
	com	r16
	ld	r17,X
	and	r17,r16
	st	X,r17
	ret
;----------------------*
; pc=0x904(0x1208)
;
L0904:
	 call	L1539
	mov	r8,r16
	mov	r9,r17
	mov	r26,r18
	mov	r27,r19
	mov	r10,r20
	mov	r11,r21
	mov	r12,r22
	mov	r13,r23
	cbi	PORTB,b3
	ldi	r16,kFF
	add	r10,r16
	adc	r11,r16
	mov	r16,r10
	mov	r17,r11
	 rcall	L08D6
	mov	r4,r16
	mov	r5,r17
	 rcall	L0987
	 breq	L091B
;	-----		branch on last line
	add	r8,r4
	adc	r9,r17
L091B:
	 rcall	L098A
	 breq	L091F
;	-----		branch on last line
	add	r26,r4
	adc	r27,r5
L091F:
	ldi	r24,k01
	ldi	r25,k01
	 rcall	L098D
	 rcall	L0A76
	 rcall	L098A
	 breq	L0927
;	-----		branch on last line
	ldi	r16,k00
	st	X,r16
L0927:
	 rcall	L098F
	 brcs	L0930
;	-----		branch on last line
	 rcall	L08E1
	 breq	L0930
;	-----		branch on last line
	 rcall	L08FC
	add	r16,r10
	adc	r17,r11
	 rcall	L08E3
	rjmp	L0934
;	-----------	jump on last line
L0930:
	mov	r6,r17
	clr	r7
	add	r6,r10
	adc	r7,r11
L0934:
	clr	r4
	clr	r5
	rjmp	L0953
;	-----------	jump on last line
L0937:
	cbi	PORTB,b5
L0938:
	 rcall	L0A76
	 rcall	L08CC
	 brcc	L093E
;	-----		branch on last line
	tst	r16
	 breq	L093E
;	-----		branch on last line
	ldi	r24,k01
L093E:
	 rcall	L08E9
	 brcc	L0944
;	-----		branch on last line
	mov	r16,r17
	 rcall	L08D0
	 brcc	L0944
;	-----		branch on last line
	ldi	r25,k01
L0944:
	tst	r25
	 brne	L094C
;	-----		branch on last line
	 rcall	L0987
	 breq	L094B
;	-----		branch on last line
	ldi	r16,kFF
	add	r8,r16
	adc	r9,r16
L094B:
	ldi	r25,k01
L094C:
	tst	r24
	 brne	L0952
;	-----		branch on last line
	 rcall	L098A
	 breq	L0951
;	-----		branch on last line
	sbiw	r26,k01
L0951:
	ldi	r24,k01
L0952:
	 rcall	L08EF
L0953:
	cp	r4,r6
	cpc	r5,r7
	 rcall	L098A
	 brcc	L0964
;	-----		branch on last line
	 breq	L095E
;	-----		branch on last line
;	--------- this is skippy
	 sbis	PINB,b6
	 rjmp	L095D
;	--------- last may be skipped
; pc=0x95A(0x12B4)
;
	 rcall	L08F4
	st	X,r16
	rjmp	L095E
;	-----------	jump on last line
L095D:
	 rcall	L08D4
L095E:
	 rcall	L0987
	 breq	L0938
;	-----		branch on last line
	 rcall	L0990
	 breq	L0937
;	-----		branch on last line
	sbi	PORTB,b5
	rjmp	L0938
;	-----------	jump on last line
L0964:
	 breq	L096D
;	-----		branch on last line
;	--------- this is skippy
	 sbis	PINB,b6
	 rjmp	L0969
;	--------- last may be skipped
; pc=0x967(0x12CE)
;
	 rcall	L08F4
	rjmp	L096C
;	-----------	jump on last line
L0969:
	com	r24
	ld	r16,X
	and	r16,r24
L096C:
	st	X,r16
L096D:
	 rcall	L0987
	 breq	L0974
;	-----		branch on last line
	 rcall	L0990
	 breq	L0973
;	-----		branch on last line
	sbi	PORTB,b5
	rjmp	L0974
;	-----------	jump on last line
L0973:
	cbi	PORTB,b5
L0974:
	sbi	PORTB,b1
	 rcall	L0A76
	 rcall	L0A76
	mov	r16,r12
	or	r16,r13
	 breq	L0982
;	-----		branch on last line
	ldi	r24,k00
L097B:
	 rcall	L098D
	inc	r24
	ldi	r25,k00
	cp	r24,r12
	cpc	r25,r13
	 brcs	L097B
;	-----		branch on last line
	sbi	PORTB,b1
L0982:
	 rcall	L0A76
	sbi	PORTB,b3
	ldi	r30,k0E
	jmp	L154A
;	-----------	jump on last line
L0987:
	mov	r16,r8
	or	r16,r9
	ret
;----------------------*
; pc=0x98A(0x1314)
;
L098A:
	mov	r16,r26
	or	r16,r27
	ret
;----------------------*
; pc=0x98D(0x131A)
;
L098D:
	cbi	PORTB,b1
	rjmp	L0A76
;	-----------	jump on last line
L098F:
	rjmp	L08DB
;	-----------	jump on last line
L0990:
	mov	r30,r8
	mov	r31,r9
	ld	r16,Z
	and	r16,r25
	ret
;----------------------*
; pc=0x995(0x132A)
;
L0995:
	 call	L153D
	mov	r26,r16
	mov	r27,r17
	mov	r4,r18
	mov	r5,r19
	mov	r24,r20
	mov	r25,r21
	ldi	r16,kFF
	add	r4,r16
	adc	r5,r16
	mov	r16,r4
	mov	r17,r5
	 rcall	L08D6
	add	r26,r16
	adc	r27,r17
	clr	r6
	inc	r6
	 rcall	L098D
	 rcall	L0A76
	 rcall	L08D9
	 brcs	L09B6
;	-----		branch on last line
	 rcall	L08E1
	 breq	L09B6
;	-----		branch on last line
	 rcall	L08FC
	add	r16,r4
	adc	r17,r5
	lds	r8,D0079
	clr	r9
	add	r8,r16
	adc	r9,r17
	rjmp	L09BA
;	-----------	jump on last line
L09B6:
	mov	r8,r17
	clr	r9
	add	r8,r4
	adc	r9,r5
L09BA:
	clr	r4
	clr	r5
	rjmp	L09CD
;	-----------	jump on last line
L09BD:
	mov	r16,r6
	 rcall	L08FF
L09BF:
	 rcall	L0A76
	lsl	r6
	 rcall	L08CE
	 brcc	L09C7
;	-----		branch on last line
	tst	r16
	 breq	L09C7
;	-----		branch on last line
	clr	r6
	inc	r6
L09C7:
	tst	r6
	 brne	L09CC
;	-----		branch on last line
	sbiw	r26,k01
	clr	r6
	inc	r6
L09CC:
	 rcall	L08EF
L09CD:
	cp	r4,r8
	cpc	r5,r9
	 brcc	L09D6
;	-----		branch on last line
;	--------- this is skippy
	 sbis	PINB,b6
	 rjmp	L09BD
;	--------- last may be skipped
; pc=0x9D2(0x13A4)
;
	ld	r16,X
	or	r16,r6
	st	X,r16
	rjmp	L09BF
;	-----------	jump on last line
L09D6:
;	--------- this is skippy
	 sbis	PINB,b6
	 rjmp	L09DB
;	--------- last may be skipped
; pc=0x9D8(0x13B0)
;
	ld	r16,X
	or	r16,r6
	rjmp	L09DE
;	-----------	jump on last line
L09DB:
	com	r6
	ld	r16,X
	and	r16,r6
L09DE:
	st	X,r16
	sbi	PORTB,b1
	 rcall	L0A76
	 rcall	L0A76
	mov	r16,r24
	or	r16,r25
	 breq	L09E9
;	-----		branch on last line
	ldi	r26,k00
L09E6:
	 rcall	L09F0
	 brcs	L09E6
;	-----		branch on last line
	sbi	PORTB,b1
L09E9:
	 rcall	L0A76
	ldi	r16,k00
	sts	D0080,r16
	ldi	r30,k0A
	jmp	L154E
;	-----------	jump on last line
L09F0:
	cbi	PORTB,b1
	 rcall	L0A76
	inc	r26
	ldi	r27,k00
	cp	r26,r24
	cpc	r27,r25
	ret
;----------------------*
; pc=0x9F7(0x13EE)
;
L09F7:
	 call	L153D
	mov	r26,r16
	mov	r27,r17
	mov	r24,r20
	mov	r25,r21
	subi	r18,k01
	sbci	r19,k00
	cbi	PORTB,b3
	mov	r16,r18
	mov	r17,r19
	 rcall	L08D6
	add	r26,r16
	adc	r27,r17
	clr	r4
	inc	r4
	ld	r5,X
	lds	r16,D0079
	tst	r16
	 brne	L0A0F
;	-----		branch on last line
	ldi	r16,k01
	sts	D018B,r16
L0A0F:
	 rcall	L098F
	 brcs	L0A18
;	-----		branch on last line
	 rcall	L08E1
	 breq	L0A18
;	-----		branch on last line
	 rcall	L08FC
	add	r16,r18
	adc	r17,r19
	 rcall	L08E3
	rjmp	L0A1C
;	-----------	jump on last line
L0A18:
	mov	r6,r17
	clr	r7
	add	r6,r18
	adc	r7,r19
L0A1C:
	lds	r16,D018B
	tst	r16
	 breq	L0A22
;	-----		branch on last line
	mov	r6,r18
	mov	r7,r19
L0A22:
	 rcall	L098D
	 rcall	L0A76
	clr	r8
	clr	r9
	rjmp	L0A3F
;	-----------	jump on last line
L0A27:
	cbi	PORTB,b5
L0A28:
	 rcall	L0A76
	lsl	r4
	 rcall	L08E9
	 brcc	L0A36
;	-----		branch on last line
	 rcall	L08FC
	cp	r8,r16
	cpc	r9,r17
	 brcc	L0A36
;	-----		branch on last line
	lds	r16,D018B
	tst	r16
	 brne	L0A36
;	-----		branch on last line
	clr	r4
	inc	r4
L0A36:
	tst	r4
	 brne	L0A3B
;	-----		branch on last line
	ld	r5,-X
	clr	r4
	inc	r4
L0A3B:
	ldi	r16,k01
	add	r8,r16
	ldi	r16,k00
	adc	r9,r16
L0A3F:
	cp	r8,r6
	cpc	r9,r7
	 brcc	L0A47
;	-----		branch on last line
	mov	r16,r4
	and	r16,r5
	 breq	L0A27
;	-----		branch on last line
	sbi	PORTB,b5
	rjmp	L0A28
;	-----------	jump on last line
L0A47:
	ld	r16,X
	and	r16,r4
	 breq	L0A4C
;	-----		branch on last line
	sbi	PORTB,b5
	rjmp	L0A4D
;	-----------	jump on last line
L0A4C:
	cbi	PORTB,b5
L0A4D:
	sbi	PORTB,b1
	 rcall	L0A76
	 rcall	L0A76
	mov	r16,r24
	or	r16,r25
	 breq	L0A57
;	-----		branch on last line
	ldi	r26,k00
L0A54:
	 rcall	L09F0
	 brcs	L0A54
;	-----		branch on last line
	sbi	PORTB,b1
L0A57:
	 rcall	L0A76
	sbi	PORTB,b3
	ldi	r16,k00
	sts	D018B,r16
	ldi	r30,k0A
	jmp	L154E
;	-----------	jump on last line
L0A5F:
	lds	r16,D018A
	tst	r16
	sbi	PORTB,b7
	 brne	L0A66
;	-----		branch on last line
	cbi	PORTB,b7
	ret
;----------------------*
; pc=0xA66(0x14CC)
;
L0A66:
	ldi	r16,k01
	rjmp	L0A69
;	-----------	jump on last line
L0A68:
	inc	r16
L0A69:
	lds	r17,D018A
	cp	r16,r17
	 brcs	L0A68
;	-----		branch on last line
	cbi	PORTB,b7
	ldi	r16,k01
	rjmp	L0A71
;	-----------	jump on last line
L0A70:
	inc	r16
L0A71:
	lds	r17,D018A
	cp	r16,r17
	 brcs	L0A70
;	-----		branch on last line
	ret
;----------------------*
; pc=0xA76(0x14EC)
;
L0A76:
	sbi	PORTB,b7
	cbi	PORTB,b7
	ret
;----------------------*
; pc=0xA79(0x14F2)
;
L0A79:
	ldi	r17,kFF
	sub	r17,r16
	sts	D018A,r17
	ret
;----------------------*
; pc=0xA7E(0x14FC)
;
L0A7E:
	 rcall	L0A82
	 breq	L0A93
;	-----		branch on last line
	 rcall	L0A8A
	rjmp	L0A93
;	-----------	jump on last line
L0A82:
	 rcall	L0F6C
	ldi	r16,k00
	sts	D018E,r16
	lds	r16,D018D
	tst	r16
	ret
;----------------------*
; pc=0xA8A(0x1514)
;
L0A8A:
	 rcall	L0EC0
L0A8B:
	ldi	r16,k00
	sts	D018D,r16
	ret
;----------------------*
; pc=0xA8F(0x151E)
;
L0A8F:
	 rcall	L0A93
	ldi	r16,k04
	jmp	L0115
;	-----------	jump on last line
L0A93:
	ldi	r17,k00
	ldi	r16,k09
	jmp	L07D1
;	-----------	jump on last line
L0A97:
	 rcall	L0A99
L0A98:
	rjmp	L0A9D
;	-----------	jump on last line
L0A99:
	ldi	r17,k00
	ldi	r16,k08
	jmp	L07D1
;	-----------	jump on last line
L0A9D:
	 rcall	L0E8A
	ldi	r16,k01
	sts	D018E,r16
	rjmp	L0A8B
;	-----------	jump on last line
L0AA2:
	sbiw	r28,k06
	ldi	r17,k00
	 rcall	L0B07
	 brne	L0AD4
;	-----		branch on last line
	 rcall	L0A99
	 rcall	L0B10
	ldi	r16,k10
	std	Y+o00,r16
	lds	r16,D007D
	std	Y+o01,r16
	lds	r16,D007E
	std	Y+o02,r16
	ldi	r16,k00
	ldi	r17,k00
	 rcall	L0AD6
	 rcall	L0AEA
	 rcall	L0AE2
	 rcall	L0B14
	ldi	r16,k01
	 rcall	L0B2F
	 rcall	L0B1E
	 rcall	L0B32
	 rcall	L0B14
	ldi	r16,k00
	std	Y+o00,r16
	 rcall	L0B1E
	 rcall	L0B2A
L0ABF:
	 rcall	L0B36
	 breq	L0AC3
;	-----		branch on last line
	 rcall	L0B3A
	 brne	L0ABF
;	-----		branch on last line
L0AC3:
	 rcall	L0B10
	 rcall	L0B21
	 rcall	L0AE9
	 rcall	L0A93
	 rcall	L0B2B
L0AC8:
	 rcall	L0B36
	 breq	L0ACC
;	-----		branch on last line
	 rcall	L0B3A
	 brne	L0AC8
;	-----		branch on last line
L0ACC:
	 rcall	L0B10
	 rcall	L0ADA
	 rcall	L0AEA
	 rcall	L0B3F
	ldd	r16,Y+o04
	andi	r16,kF7
	 rcall	L0AE6
	 rcall	L0A9D
L0AD4:
	adiw	r28,k06
	ret
;----------------------*
; pc=0xAD6(0x15AC)
;
L0AD6:
	st	-Y,r17
	st	-Y,r16
	 rcall	L0B49
	 rcall	L0B59
L0ADA:
	ldi	r16,k08
L0ADB:
	std	Y+o00,r16
	 rcall	L0B44
	ldi	r22,k00
	ldi	r20,k05
	 rcall	L0B53
	ldi	r16,k00
	ret
;----------------------*
; pc=0xAE2(0x15C4)
;
L0AE2:
	ldd	r16,Y+o05
	std	Y+o02,r16
	ldd	r16,Y+o04
	ori	r16,k08
L0AE6:
	std	Y+o01,r16
	ldi	r16,k18
	std	Y+o00,r16
L0AE9:
	ldi	r16,k00
L0AEA:
	 rcall	L0B45
	 rcall	L0B49
	rjmp	L0B59
;	-----------	jump on last line
L0AED:
	ldi	r16,k0A
	 rcall	L0B42
	ldi	r22,k01
	ldi	r20,k10
	 rcall	L0B53
	ldi	r16,k00
	 rcall	L10F7
	std	Y+o00,r16
	ldi	r16,k01
	 rcall	L10F7
	std	Y+o01,r16
	ldi	r16,k01
	ret
;----------------------*
; pc=0xAFA(0x15F4)
;
L0AFA:
	st	-Y,r17
	st	-Y,r16
	ldi	r22,k00
	 rcall	L0B5E
	subi	r18,kF9
	 rcall	L0B57
L0B00:
	 rcall	L0B44
	ldi	r22,k00
	ldi	r20,k15
	 rcall	L0B61
	subi	r18,kF9
	sbci	r19,kFF
	rjmp	L0B58
;	-----------	jump on last line
L0B07:
	ldi	r16,k0C
	 rcall	L0B42
	ldi	r22,k01
	 rcall	L0B52
	ldd	r16,Y+o03
	tst	r16
	ret
;----------------------*
; pc=0xB0E(0x161C)
;
L0B0E:
	 rcall	L0B66
L0B0F:
	mov	r24,r16
L0B10:
	ldi	r17,k00
	ldi	r16,k0B
	jmp	L07D1
;	-----------	jump on last line
L0B14:
	ldi	r17,k00
	ldi	r16,k0C
	jmp	L07D1
;	-----------	jump on last line
L0B18:
	 rcall	L0B5E
	subi	r18,kFC
	 rcall	L0B57
	ldi	r16,k00
	std	Y+o00,r16
	std	Y+o01,r16
L0B1E:
	 rcall	L0B45
	ldi	r22,k00
	ret
;----------------------*
; pc=0xB21(0x1642)
;
L0B21:
	ldi	r16,k10
	std	Y+o00,r16
	lds	r16,D007C
	std	Y+o01,r16
	lds	r16,D007B
	std	Y+o02,r16
	ret
;----------------------*
; pc=0xB2A(0x1654)
;
L0B2A:
	 rcall	L0B52
L0B2B:
	ldi	r16,k10
	jmp	L0115
;	-----------	jump on last line
L0B2E:
	ldi	r16,k0D
L0B2F:
	std	Y+o00,r16
	ldi	r16,k00
	ret
;----------------------*
; pc=0xB32(0x1664)
;
L0B32:
	ldi	r20,k01
	 rcall	L0B61
	subi	r18,kFB
L0B35:
	rjmp	L0B57
;	-----------	jump on last line
L0B36:
	 rcall	L0D62
	andi	r16,k06
	cpi	r16,k04
	ret
;----------------------*
; pc=0xB3A(0x1674)
;
L0B3A:
	lds	r16,D006E
	tst	r16
	ret
;----------------------*
; pc=0xB3E(0x167C)
;
L0B3E:
	std	Y+o01,r16
L0B3F:
	ldd	r16,Y+o05
	std	Y+o02,r16
	ret
;----------------------*
; pc=0xB42(0x1684)
;
L0B42:
	 call	L07D1
L0B44:
	ldi	r16,k00
L0B45:
	ldi	r17,k00
	st	-Y,r17
	st	-Y,r16
	ret
;----------------------*
; pc=0xB49(0x1692)
;
L0B49:
	ldi	r22,k00
	ldi	r20,k15
	ldi	r21,k00
	mov	r18,r28
	mov	r19,r29
	subi	r18,kFB
	sbci	r19,kFF
	mov	r16,r28
	ret
;----------------------*
; pc=0xB52(0x16A4)
;
L0B52:
	ldi	r20,k01
L0B53:
	ldi	r21,k00
	mov	r18,r28
	mov	r19,r29
	subi	r18,kFB
L0B57:
	sbci	r19,kFF
L0B58:
	mov	r16,r28
L0B59:
	mov	r17,r29
	subi	r16,kFE
	sbci	r17,kFF
	jmp	L084C
;	-----------	jump on last line
L0B5E:
	ldi	r20,k05
	rjmp	L0B61
;	-----------	jump on last line
L0B60:
	ldi	r20,k20
L0B61:
	ldi	r21,k00
	mov	r18,r28
	mov	r19,r29
	ret
;----------------------*
; pc=0xB65(0x16CA)
;
L0B65:
	st	-Y,r25
L0B66:
	st	-Y,r24
	sbiw	r28,k06
	ret
;----------------------*
; pc=0xB69(0x16D2)
;
L0B69:
	sbiw	r28,k06
	ldi	r17,k00
	 rcall	L0B07
	 brne	L0B94
;	-----		branch on last line
	lds	r16,D0080
	tst	r16
	 breq	L0B77
;	-----		branch on last line
	 rcall	L0A99
	 rcall	L0B2B
L0B73:
	 rcall	L0B36
	 breq	L0B77
;	-----		branch on last line
	 rcall	L0B3A
	 brne	L0B73
;	-----		branch on last line
L0B77:
	 rcall	L0B14
	ldi	r16,k01
	 rcall	L0B2F
	 rcall	L0B1E
	 rcall	L0B32
	 rcall	L0B10
	 rcall	L0B21
	ldi	r16,k00
	ldi	r17,k00
	 rcall	L0AD6
	 rcall	L0AEA
	 rcall	L0AE2
	 rcall	L0B14
	ldi	r16,k00
	std	Y+o00,r16
	 rcall	L0B1E
	 rcall	L0B2A
L0B88:
	 rcall	L0B36
	 breq	L0B8C
;	-----		branch on last line
	 rcall	L0B3A
	 brne	L0B88
;	-----		branch on last line
L0B8C:
	 rcall	L0B10
	 rcall	L0ADA
	 rcall	L0AEA
	 rcall	L0B3F
	ldd	r16,Y+o04
	andi	r16,kF7
	 rcall	L0AE6
	 rcall	L0A9D
L0B94:
	adiw	r28,k06
	ret
;----------------------*
; pc=0xB96(0x172C)
;
L0B96:
	 rcall	L0A82
	 breq	L0B99
;	-----		branch on last line
	 rcall	L0A8A
L0B99:
	 rcall	L0BA1
	 rcall	L0A8F
L0B9B:
	 rcall	L0B36
	 breq	L0B9F
;	-----		branch on last line
	 rcall	L0B3A
	 brne	L0B9B
;	-----		branch on last line
L0B9F:
	 rcall	L0BA6
	rjmp	L0A98
;	-----------	jump on last line
L0BA1:
	ldi	r16,k20
	rjmp	L102D
;	-----------	jump on last line
L0BA3:
	 rcall	L0BA8
	subi	r18,kFB
L0BA5:
	 rcall	L0B57
L0BA6:
	ldi	r16,k40
	rjmp	L102D
;	-----------	jump on last line
L0BA8:
	ldi	r20,k10
	rjmp	L0B61
;	-----------	jump on last line
L0BAA:
	 rcall	L0BB1
	 rcall	L0BB6
	st	Z,r17
	ret
;----------------------*
; pc=0xBAE(0x175C)
;
L0BAE:
	mov	r16,r27
	 rcall	L0EA4
	ldi	r17,k00
L0BB1:
	mov	r30,r16
	ldi	r31,k00
	ret
;----------------------*
; pc=0xBB4(0x1768)
;
L0BB4:
	mov	r30,r24
L0BB5:
	ldi	r31,k00
L0BB6:
	subi	r30,k71
	sbci	r31,kFE
	ret
;----------------------*
; pc=0xBB9(0x1772)
;
L0BB9:
	 rcall	L0BB1
	 rcall	L0BB6
	ld	r16,Z
	ret
;----------------------*
; pc=0xBBD(0x177A)
;
L0BBD:
	 rcall	L0BCC
	mov	r24,r17
	 rcall	L0BC9
	mov	r16,r26
	 rcall	L0F7F
	 rcall	L0BD0
	 rcall	L0BD4
L0BC4:
	st	Z,r24
	ld	r24,Y+
	ld	r26,Y+
	ret
;----------------------*
; pc=0xBC8(0x1790)
;
L0BC8:
	ld	r17,Z
L0BC9:
	 rcall	L0BD7
	ldi	r17,k10
	ret
;----------------------*
; pc=0xBCC(0x1798)
;
L0BCC:
	st	-Y,r26
	st	-Y,r24
	mov	r26,r16
	ret
;----------------------*
; pc=0xBD0(0x17A0)
;
L0BD0:
	mov	r30,r26
	ldi	r31,k00
	ret
;----------------------*
; pc=0xBD3(0x17A6)
;
L0BD3:
	ldi	r31,k00
L0BD4:
	subi	r30,k51
	sbci	r31,kFE
	ret
;----------------------*
; pc=0xBD7(0x17AE)
;
L0BD7:
	ldi	r16,k10
	rjmp	L0FA1
;	-----------	jump on last line
L0BD9:
	 rcall	L0BB1
	 rcall	L0BD4
	ld	r16,Z
	ret
;----------------------*
; pc=0xBDD(0x17BA)
;
L0BDD:
	 rcall	L0BCC
	mov	r24,r17
	mov	r20,r17
	 rcall	L0BE9
	 rcall	L0FDD
	mov	r16,r26
	 rcall	L0EA4
	 rcall	L0BB1
	 rcall	L0BED
	rjmp	L0BC4
;	-----------	jump on last line
L0BE7:
	lds	r16,D02A3
L0BE9:
	ldi	r17,k00
L0BEA:
	ldi	r18,k00
	ldi	r19,k00
	ret
;----------------------*
; pc=0xBED(0x17DA)
;
L0BED:
	subi	r30,k53
	sbci	r31,kFD
	ret
;----------------------*
; pc=0xBF0(0x17E0)
;
L0BF0:
	 rcall	L0EA4
	 rcall	L0BB1
	 rcall	L0BED
	ld	r16,Z
	ret
;----------------------*
; pc=0xBF5(0x17EA)
;
L0BF5:
	 rcall	L0C1D
	st	Z,r16
	std	Z+o01,r17
	std	Z+o02,r18
	std	Z+o03,r19
	ret
;----------------------*
; pc=0xBFB(0x17F6)
;
L0BFB:
	ldi	r31,k00
	 rcall	L0C17
	 rcall	L0C1D
	 rcall	L0C13
	 rcall	L0FF7
	 rcall	L0FC5
	lds	r17,D01AE
	 rcall	L0C1B
	lds	r17,D01AD
	ldi	r16,k1E
	rjmp	L0FA1
;	-----------	jump on last line
L0C08:
	mov	r18,r19
	lsl	r18
	sbc	r18,r18
	 rcall	L0C1D
	st	Z,r16
	std	Z+o01,r19
	std	Z+o02,r18
	std	Z+o03,r18
	ret
;----------------------*
; pc=0xC11(0x1822)
;
L0C11:
	ldi	r30,kA4
	ldi	r31,k02
L0C13:
	ld	r17,Z
	subi	r17,k06
L0C15:
	ldi	r16,k1E
	rjmp	L0FA1
;	-----------	jump on last line
L0C17:
	ld	r24,Z
	ldd	r25,Z+o01
	sbiw	r24,k06
	mov	r17,r25
L0C1B:
	ldi	r16,k1F
	rjmp	L0FA1
;	-----------	jump on last line
L0C1D:
	ldi	r30,k65
	ldi	r31,k00
	ret
;----------------------*
; pc=0xC20(0x1840)
;
L0C20:
	 rcall	L0C1D
	rjmp	L0C35
;	-----------	jump on last line
L0C22:
	 rcall	L0FA1
L0C23:
	ldi	r30,k6F
	ldi	r31,k00
	 rcall	L0C35
	andi	r19,k0F
	cpi	r16,k3F
	sbci	r17,k50
	sbci	r18,k40
	sbci	r19,k09
	ret
;----------------------*
; pc=0xC2C(0x1858)
;
L0C2C:
	 rcall	L0C11
	ldi	r30,kA4
	ldi	r31,k02
	ld	r16,Z
	ldd	r17,Z+o01
	subi	r16,k06
	sbci	r17,k00
	 rcall	L0C1B
	rjmp	L0FC5
;	-----------	jump on last line
L0C35:
	ld	r16,Z
	ldd	r17,Z+o01
	ldd	r18,Z+o02
	ldd	r19,Z+o03
	ret
;----------------------*
; pc=0xC3A(0x1874)
;
L0C3A:
	mov	r20,r18
	 rcall	L0BEA
	rjmp	L0FDD
;	-----------	jump on last line
L0C3D:
	 rcall	L0BEA
	rjmp	L0FCB
;	-----------	jump on last line
L0C3F:
	 rcall	L0BCC
	mov	r24,r18
	 rcall	L0BD7
	mov	r17,r26
	ldi	r16,k11
	 rcall	L0C90
	ldi	r16,k12
	 rcall	L0FA1
	ldi	r17,k04
	ldi	r16,k13
	 rcall	L0FA1
	ldi	r17,k02
	ldi	r16,k14
	 rcall	L0C22
	 brne	L0C50
;	-----		branch on last line
	ldi	r18,k01
	rjmp	L0C51
;	-----------	jump on last line
L0C50:
	ldi	r18,k00
L0C51:
	 rcall	L0C93
	 brne	L0C55
;	-----		branch on last line
	ldi	r16,k01
	rjmp	L0C56
;	-----------	jump on last line
L0C55:
	ldi	r16,k00
L0C56:
	or	r16,r18
	or	r16,r19
	ldi	r17,k10
	 breq	L0C63
;	-----		branch on last line
	 rcall	L0C9D
	ldi	r16,k20
	 rcall	L0F7F
	ldi	r17,k13
	ldi	r16,k1F
	 rcall	L0F7F
	ldi	r17,k14
	ldi	r16,k1F
	rjmp	L0C6B
;	-----------	jump on last line
L0C63:
	 rcall	L0CA2
	ldi	r16,k1D
	 rcall	L0F7F
	ldi	r17,k13
	ldi	r16,k1C
	 rcall	L0F7F
	ldi	r17,k14
	ldi	r16,k1C
L0C6B:
	 rcall	L0F7F
	 rcall	L0B2B
L0C6D:
	 rcall	L0C23
	 brne	L0C71
;	-----		branch on last line
	ldi	r18,k01
	rjmp	L0C72
;	-----------	jump on last line
L0C71:
	ldi	r18,k00
L0C72:
	 rcall	L0C93
	 brne	L0C76
;	-----		branch on last line
	ldi	r16,k01
	rjmp	L0C77
;	-----------	jump on last line
L0C76:
	ldi	r16,k00
L0C77:
	or	r16,r18
	or	r16,r19
	 breq	L0C7C
;	-----		branch on last line
	ldi	r17,k1F
	rjmp	L0C7D
;	-----------	jump on last line
L0C7C:
	ldi	r17,k1C
L0C7D:
	ldi	r16,k10
	 rcall	L0FB4
	ldi	r16,k10
	 rcall	L0BE9
	 rcall	L0FCB
	andi	r16,k02
	 breq	L0C86
;	-----		branch on last line
	 rcall	L0B3A
	 brne	L0C6D
;	-----		branch on last line
L0C86:
	ld	r24,Y+
	ld	r26,Y+
	ret
;----------------------*
; pc=0xC89(0x1912)
;
L0C89:
	ldi	r16,k10
	 rcall	L0FB4
	ldi	r17,k10
	lds	r16,D02A2
	rjmp	L0F7F
;	-----------	jump on last line
L0C8F:
	ldi	r16,k1F
L0C90:
	 rcall	L0FA1
	mov	r17,r24
	ret
;----------------------*
; pc=0xC93(0x1926)
;
L0C93:
	ldi	r19,k00
	ld	r20,Z
	ldd	r21,Z+o01
	ldd	r22,Z+o02
	ldd	r23,Z+o03
	cpi	r20,k3F
	sbci	r21,k10
	sbci	r22,k78
	sbci	r23,k09
	ret
;----------------------*
; pc=0xC9D(0x193A)
;
L0C9D:
	ldi	r16,k22
	 rcall	L0F7F
	ldi	r17,k11
	ldi	r16,k21
	rjmp	L0CA6
;	-----------	jump on last line
L0CA2:
	ldi	r16,k1F
	 rcall	L0F7F
	ldi	r17,k11
	ldi	r16,k1E
L0CA6:
	 rcall	L0F7F
	ldi	r17,k12
	ret
;----------------------*
; pc=0xCA9(0x1952)
;
L0CA9:
	st	-Y,r24
	mov	r24,r16
	ldi	r16,k10
	 rcall	L0C90
	ldi	r16,k11
	 rcall	L0FA1
	ldi	r17,k01
	ldi	r16,k12
	 rcall	L0C22
	 brne	L0CB5
;	-----		branch on last line
	ldi	r18,k01
	rjmp	L0CB6
;	-----------	jump on last line
L0CB5:
	ldi	r18,k00
L0CB6:
	 rcall	L0C93
	 brne	L0CBA
;	-----		branch on last line
	ldi	r16,k01
	rjmp	L0CBB
;	-----------	jump on last line
L0CBA:
	ldi	r16,k00
L0CBB:
	or	r16,r18
	or	r16,r19
	ldi	r17,k10
	 breq	L0CC4
;	-----		branch on last line
	 rcall	L0C9D
	ldi	r16,k1F
	 rcall	L0F7F
	ldi	r17,k20
	rjmp	L0CC8
;	-----------	jump on last line
L0CC4:
	 rcall	L0CA2
	ldi	r16,k1C
	 rcall	L0F7F
	ldi	r17,k1D
L0CC8:
	 rcall	L0C89
	ld	r24,Y+
	ret
;----------------------*
; pc=0xCCB(0x1996)
;
	 rcall	L0CE2
	 rcall	L0CDE
	ldi	r16,k00
	std	Y+o00,r16
	std	Y+o01,r16
	std	Y+o02,r25
	std	Y+o03,r24
	 rcall	L0B1E
	 rcall	L0CE6
	ldi	r16,k00
	 rcall	L0B1E
	 rcall	L0CE6
L0CD7:
	ldd	r17,Y+o04
	ldd	r16,Y+o05
	adiw	r28,k08
	ld	r24,Y+
	ld	r25,Y+
	ret
;----------------------*
; pc=0xCDD(0x19BA)
;
L0CDD:
	std	Y+o01,r16
L0CDE:
	ldi	r17,k00
	ldi	r16,k0A
	jmp	L07D1
;	-----------	jump on last line
L0CE2:
	st	-Y,r25
	st	-Y,r24
	sbiw	r28,k08
	rjmp	L0CE9
;	-----------	jump on last line
L0CE6:
	 rcall	L0B60
	subi	r18,kFA
	rjmp	L0B35
;	-----------	jump on last line
L0CE9:
	mov	r24,r16
	mov	r25,r17
	ret
;----------------------*
; pc=0xCEC(0x19D8)
;
	 rcall	L0CE2
	ldi	r16,k94
	std	Y+o00,r16
	ldi	r16,k0C
	std	Y+o01,r16
	ldi	r16,k00
	 rcall	L102D
	 rcall	L0CDE
	ldi	r16,k01
	 rcall	L0B1E
	 rcall	L0CE6
	std	Y+o00,r25
	std	Y+o01,r24
	ldi	r16,k02
	 rcall	L0B1E
	 rcall	L0BA8
	subi	r18,kFA
	 rcall	L0D12
	 rcall	L0D05
	subi	r18,kFA
	 rcall	L0BA5
	rjmp	L0CD7
;	-----------	jump on last line
L0D02:
	ldi	r16,k0A
	 call	L07D1
L0D05:
	 rcall	L0B44
	ldi	r22,k01
	rjmp	L0B60
;	-----------	jump on last line
L0D08:
	 rcall	L0BA8
	subi	r18,kFC
	rjmp	L0D12
;	-----------	jump on last line
L0D0B:
	 rcall	L0BA8
	subi	r18,kFB
	rjmp	L0D12
;	-----------	jump on last line
L0D0E:
	 rcall	L0B61
	 rcall	L0D17
	subi	r16,kFB
	rjmp	L0D14
;	-----------	jump on last line
L0D12:
	 rcall	L0D18
	subi	r16,kFE
L0D14:
	sbci	r17,kFF
	jmp	L084C
;	-----------	jump on last line
L0D17:
	subi	r18,kFE
L0D18:
	sbci	r19,kFF
	mov	r16,r28
	mov	r17,r29
	ret
;----------------------*
; pc=0xD1C(0x1A38)
;
L0D1C:
	 call	L1543
	sbiw	r28,k06
	mov	r26,r16
	mov	r27,r17
	mov	r24,r18
	cpi	r24,k02
	 brcc	L0D37
;	-----		branch on last line
	 rcall	L0B10
	mov	r16,r24
	ori	r16,k10
	std	Y+o00,r16
	std	Y+o01,r27
	std	Y+o02,r26
	ldi	r16,k00
	ldi	r17,k00
	 rcall	L0AD6
	 rcall	L0AEA
	 rcall	L0B3F
	ldd	r18,Y+o04
	ldi	r16,k08
	ldi	r17,k00
	mov	r20,r24
	 call	L1473
	or	r16,r18
	 rcall	L0AE6
L0D37:
	adiw	r28,k06
	ldi	r30,k04
	jmp	L1554
;	-----------	jump on last line
L0D3B:
	sbiw	r28,k06
	 rcall	L0B10
	 rcall	L0ADA
	 rcall	L0AEA
	 rcall	L0D48
	andi	r16,kE0
	std	Y+o01,r16
	ldd	r16,Y+o05
	andi	r16,k07
L0D44:
	std	Y+o02,r16
	 rcall	L0AE9
	adiw	r28,k06
	ret
;----------------------*
; pc=0xD48(0x1A90)
;
L0D48:
	ldi	r16,k18
L0D49:
	std	Y+o00,r16
	ldd	r16,Y+o04
	ret
;----------------------*
; pc=0xD4C(0x1A98)
;
L0D4C:
	sbiw	r28,k08
	 call	L0841
	ldi	r17,k00
	ldi	r16,k01
	 call	L07D1
	ldi	r16,k00
	 rcall	L0B1E
	 rcall	L0B60
	 rcall	L0D61
	subi	r16,kFA
	sbci	r17,kFF
	 call	L084C
	ldd	r19,Y+o00
	ldd	r18,Y+o01
	ldd	r17,Y+o02
	ldd	r16,Y+o03
	adiw	r28,k08
	ret
;----------------------*
; pc=0xD61(0x1AC2)
;
L0D61:
	rjmp	L0D17
;	-----------	jump on last line
L0D62:
	st	-Y,r24
	sbiw	r28,k04
	in	r24,PIND
	andi	r24,k08
	 rcall	L0B10
	 rcall	L0B2E
	 rcall	L0B1E
	 rcall	L0B18
	 rcall	L0D08
	in	r16,PIND
	andi	r16,k08
	or	r24,r16
	 breq	L0D71
;	-----		branch on last line
	ldi	r16,k00
	rjmp	L0D74
;	-----------	jump on last line
L0D71:
	ldd	r16,Y+o03
	andi	r16,k1F
	ori	r16,k80
L0D74:
	adiw	r28,k04
	ld	r24,Y+
	ret
;----------------------*
; pc=0xD77(0x1AEE)
;
L0D77:
	st	-Y,r24
	sbiw	r28,k0A
	 rcall	L0B0F
	 rcall	L0B2E
	ldi	r17,k00
	 rcall	L0AFA
	ldi	r16,k1D
	std	Y+o00,r16
	tst	r24
	ldd	r16,Y+o06
	 breq	L0D84
;	-----		branch on last line
	ori	r16,k80
	rjmp	L0D85
;	-----------	jump on last line
L0D84:
	andi	r16,k7F
L0D85:
	 rcall	L0D8A
	 rcall	L0B00
	adiw	r28,k0A
	ld	r24,Y+
	ret
;----------------------*
; pc=0xD8A(0x1B14)
;
L0D8A:
	std	Y+o01,r16
	ldd	r16,Y+o07
	std	Y+o02,r16
	ret
;----------------------*
; pc=0xD8E(0x1B1C)
;
L0D8E:
	 call	L1541
	sbiw	r28,k0A
;	--------- this is skippy
	 sbic	PIND,b3
	 rjmp	L0E4A
;	--------- last may be skipped
; pc=0xD93(0x1B26)
;
	lds	r16,D018E
	tst	r16
	 brne	L0D9E
;	-----		branch on last line
	ldi	r17,k00
	 rcall	L0D02
	subi	r18,kF9
	 rcall	L0D12
	ldd	r19,Y+o07
	ldd	r16,Y+o08
	 rcall	L0C08
L0D9E:
	 rcall	L0E69
	ldi	r26,k00
L0DA0:
	mov	r17,r26
	 rcall	L0E6C
	mov	r30,r26
	 rcall	L0BB5
	st	Z,r16
	inc	r26
	cpi	r26,k20
	 brcs	L0DA0
;	-----		branch on last line
	lds	r16,D02A3
	cpi	r16,k60
	 brcs	L0DB0
;	-----		branch on last line
	 rcall	L0BE7
	 rcall	L0FCB
	sts	D018C,r16
L0DB0:
	 rcall	L0E74
L0DB1:
	 rcall	L0E77
	ld	r24,Z
	ldi	r26,k08
L0DB4:
	bst	r24,b0
	 brtc	L0DCC
;	-----		branch on last line
	 rcall	L0E79
	 brne	L0DBA
;	-----		branch on last line
	ldi	r16,k00
	 rcall	L0D77
L0DBA:
	mov	r17,r4
	ldi	r16,k10
	 rcall	L0FB4
	 rcall	L0E79
	 brne	L0DC0
;	-----		branch on last line
	 rcall	L0E69
L0DC0:
	lds	r16,D0076
	cpi	r16,k01
	 brne	L0DCA
;	-----		branch on last line
	 rcall	L0E79
	 brne	L0DCA
;	-----		branch on last line
	ldi	r16,k00
	sts	D0076,r16
	rjmp	L0DD0
;	-----------	jump on last line
L0DCA:
	 rcall	L0E6B
	rjmp	L0DCD
;	-----------	jump on last line
L0DCC:
	ldi	r16,k00
L0DCD:
	mov	r30,r4
	 rcall	L0BD3
	st	Z,r16
L0DD0:
	lsr	r24
	inc	r4
	dec	r26
	 brne	L0DB4
;	-----		branch on last line
	inc	r25
	cpi	r25,k08
	 brcs	L0DB1
;	-----		branch on last line
	 rcall	L0E82
	 breq	L0DF1
;	-----		branch on last line
	 rcall	L0E73
	rjmp	L0DED
;	-----------	jump on last line
L0DDB:
	 rcall	L0E77
	ldd	r24,Z+o20
	ldi	r26,k00
L0DDE:
	bst	r24,b0
	 brtc	L0DE8
;	-----		branch on last line
	mov	r16,r27
	 rcall	L0BE9
	 rcall	L0FCB
	mov	r30,r4
	ldi	r31,k00
	 rcall	L0BED
	st	Z,r16
	inc	r4
L0DE8:
	 rcall	L0E7D
	 breq	L0DEC
;	-----		branch on last line
	 rcall	L0E6F
	 brcs	L0DDE
;	-----		branch on last line
L0DEC:
	inc	r25
L0DED:
	 rcall	L0E4E
	cp	r16,r25
	sbci	r17,k00
	 brge	L0DDB
;	-----		branch on last line
L0DF1:
	 rcall	L0B10
	ldi	r16,k08
	 rcall	L0B2F
	ldi	r17,k00
	 rcall	L0AFA
	ldi	r16,k18
	 rcall	L0E5F
	 rcall	L0B00
	 rcall	L0B10
	 rcall	L0B2E
	ldi	r17,k00
	 rcall	L0AFA
	ldi	r16,k1D
	 rcall	L0E5F
	 rcall	L0B00
	 rcall	L0E74
L0E01:
	 rcall	L0E77
	ldd	r24,Z+o08
	ldi	r26,k00
L0E04:
	bst	r24,b0
	 brtc	L0E11
;	-----		branch on last line
	mov	r17,r4
	 rcall	L0C89
	mov	r18,r4
	ldi	r19,k00
	subi	r18,kC0
	sbci	r19,kFF
	mov	r30,r18
	mov	r31,r19
	 rcall	L0BD4
	st	Z,r16
	rjmp	L0E15
;	-----------	jump on last line
L0E11:
	ldi	r18,k00
	mov	r16,r4
	 rcall	L0E57
	st	Z,r18
L0E15:
	lsr	r24
	clr	r5
	lds	r30,D02AC
	ldi	r31,k00
	subi	r30,k60
	sbci	r31,k00
	cp	r4,r30
	cpc	r5,r31
	 breq	L0E22
;	-----		branch on last line
	inc	r4
	 rcall	L0E70
	 brcs	L0E04
;	-----		branch on last line
L0E22:
	inc	r25
	cpi	r25,k08
	 brcs	L0E01
;	-----		branch on last line
	 rcall	L0E82
	 breq	L0E40
;	-----		branch on last line
	 rcall	L0E73
	rjmp	L0E3C
;	-----------	jump on last line
L0E29:
	 rcall	L0E77
	ldd	r24,Z+o34
	ldi	r26,k00
L0E2C:
	bst	r24,b0
	 brtc	L0E37
;	-----		branch on last line
	mov	r16,r27
	 rcall	L0BE9
	 rcall	L0FCB
	mov	r30,r4
	ldi	r31,k00
	subi	r30,k15
	sbci	r31,kFD
	st	Z,r16
	inc	r4
L0E37:
	 rcall	L0E7D
	 breq	L0E3B
;	-----		branch on last line
	 rcall	L0E6F
	 brcs	L0E2C
;	-----		branch on last line
L0E3B:
	inc	r25
L0E3C:
	 rcall	L0E4E
	cp	r16,r25
	sbci	r17,k00
	 brge	L0E29
;	-----		branch on last line
L0E40:
	 rcall	L0B10
	 rcall	L0B2E
	ldi	r17,k00
	 rcall	L0AFA
	ldi	r16,k1D
	std	Y+o00,r16
	ldd	r16,Y+o06
	andi	r16,kBF
	 rcall	L0D8A
	 rcall	L0B00
L0E4A:
	adiw	r28,k0A
	ldi	r30,k06
	jmp	L1552
;	-----------	jump on last line
L0E4E:
	lds	r16,D02AC
	ldi	r17,k00
	subi	r16,k60
	sbci	r17,k00
	ldi	r20,k08
	ldi	r21,k00
	jmp	L1492
;	-----------	jump on last line
L0E57:
	ldi	r17,k00
	subi	r16,kC0
	sbci	r17,kFF
	mov	r30,r16
	mov	r31,r17
	subi	r30,k51
	sbci	r31,kFE
	ret
;----------------------*
; pc=0xE5F(0x1CBE)
;
L0E5F:
	std	Y+o00,r16
	ldd	r16,Y+o06
	ori	r16,k40
	rjmp	L0D8A
;	-----------	jump on last line
L0E63:
	ldi	r16,k00
	 rcall	L0D77
	lds	r16,D022F
	tst	r16
	ret
;----------------------*
; pc=0xE69(0x1CD2)
;
L0E69:
	ldi	r16,k01
	rjmp	L0D77
;	-----------	jump on last line
L0E6B:
	ldi	r17,k10
L0E6C:
	lds	r16,D02A2
	rjmp	L0F7F
;	-----------	jump on last line
L0E6F:
	inc	r27
L0E70:
	inc	r26
	cpi	r26,k08
	ret
;----------------------*
; pc=0xE73(0x1CE6)
;
L0E73:
	ldi	r27,k60
L0E74:
	clr	r4
	ldi	r25,k00
	ret
;----------------------*
; pc=0xE77(0x1CEE)
;
L0E77:
	mov	r30,r25
	rjmp	L0E86
;	-----------	jump on last line
L0E79:
	lds	r16,D02A2
	cp	r4,r16
	ret
;----------------------*
; pc=0xE7D(0x1CFA)
;
L0E7D:
	lsr	r24
L0E7E:
	lds	r16,D02AC
	cp	r27,r16
	ret
;----------------------*
; pc=0xE82(0x1D04)
;
L0E82:
	lds	r16,D02AC
	tst	r16
	ret
;----------------------*
; pc=0xE86(0x1D0C)
;
L0E86:
	ldi	r31,k00
L0E87:
	subi	r30,kCE
	sbci	r31,kFD
	ret
;----------------------*
; pc=0xE8A(0x1D14)
;
L0E8A:
	st	-Y,r24
	sbiw	r28,k0A
;	--------- this is skippy
	 sbic	PIND,b3
	 rjmp	L0EA1
;	--------- last may be skipped
; pc=0xE8E(0x1D1C)
;
	ldi	r17,k00
	 rcall	L0D02
	 rcall	L0D61
	subi	r16,kF9
	sbci	r17,kFF
	 call	L084C
	ldd	r19,Y+o02
	ldd	r16,Y+o03
	 rcall	L0C08
	 rcall	L0E69
	ldi	r24,k1E
L0E9A:
	mov	r17,r24
	 rcall	L0E6C
	 rcall	L0BB4
	st	Z,r16
	inc	r24
	cpi	r24,k20
	 brcs	L0E9A
;	-----		branch on last line
L0EA1:
	adiw	r28,k0A
	ld	r24,Y+
	ret
;----------------------*
; pc=0xEA4(0x1D48)
;
L0EA4:
	ldi	r19,k00
	subi	r16,k60
	ldi	r17,k00
	ldi	r20,k00
L0EA8:
	mov	r30,r20
	 rcall	L0E86
	ldd	r21,Z+o20
	ldi	r18,k00
L0EAC:
	bst	r21,b0
	 brtc	L0EAF
;	-----		branch on last line
	inc	r17
L0EAF:
	lsr	r21
	cp	r19,r16
	 breq	L0EB6
;	-----		branch on last line
	inc	r19
	inc	r18
	cpi	r18,k08
	 brcs	L0EAC
;	-----		branch on last line
L0EB6:
	inc	r20
	mov	r18,r16
	lsr	r18
	lsr	r18
	lsr	r18
	cp	r18,r20
	 brcc	L0EA8
;	-----		branch on last line
	dec	r17
	mov	r16,r17
	ret
;----------------------*
; pc=0xEC0(0x1D80)
;
L0EC0:
	 call	L1543
	sbiw	r28,k06
;	--------- this is skippy
	 sbic	PIND,b3
	 rjmp	L0F65
;	--------- last may be skipped
; pc=0xEC5(0x1D8A)
;
	lds	r16,D02A3
	cpi	r16,k60
	 brcs	L0ECD
;	-----		branch on last line
	lds	r20,D018C
	 rcall	L0BE7
	 rcall	L0FDD
L0ECD:
	ldi	r24,k00
	ldi	r26,k00
L0ECF:
	 rcall	L0BD0
	 rcall	L0E87
	ldd	r25,Z+o10
	ldi	r27,k08
L0ED3:
	bst	r25,b0
	 brtc	L0EE3
;	-----		branch on last line
	mov	r30,r24
	 rcall	L0BD3
	ld	r17,Z
	 rcall	L0BD7
	 rcall	L0F68
	 brne	L0EDD
;	-----		branch on last line
	ldi	r16,k00
	 rcall	L0D77
L0EDD:
	ldi	r17,k10
	mov	r16,r24
	 rcall	L0F7F
	 rcall	L0F68
	 brne	L0EE3
;	-----		branch on last line
	 rcall	L0E69
L0EE3:
	lsr	r25
	inc	r24
	dec	r27
	 brne	L0ED3
;	-----		branch on last line
	 rcall	L0E70
	 brcs	L0ECF
;	-----		branch on last line
	 rcall	L0E82
	 breq	L0F06
;	-----		branch on last line
	ldi	r27,k60
	ldi	r26,k00
	rjmp	L0F02
;	-----------	jump on last line
L0EEE:
	 rcall	L0BD0
	subi	r30,k86
	sbci	r31,kFD
	ld	r25,Z
	ldi	r24,k00
L0EF3:
	bst	r25,b0
	 brtc	L0EFB
;	-----		branch on last line
	 rcall	L0BAE
	 rcall	L0BED
	ld	r20,Z
	mov	r16,r27
	 rcall	L0BEA
	 rcall	L0FDD
L0EFB:
	 rcall	L0F66
	 breq	L0F01
;	-----		branch on last line
	inc	r27
	inc	r24
	cpi	r24,k08
	 brcs	L0EF3
;	-----		branch on last line
L0F01:
	inc	r26
L0F02:
	 rcall	L0E4E
	cp	r16,r26
	sbci	r17,k00
	 brge	L0EEE
;	-----		branch on last line
L0F06:
	 rcall	L0B10
	ldi	r16,k0D
	 rcall	L0ADB
	 rcall	L0AEA
	ldi	r16,k1D
	 rcall	L0D49
	ori	r16,k40
	 rcall	L0B3E
	 rcall	L0AE9
	ldi	r24,k00
	ldi	r26,k00
L0F11:
	 rcall	L0BD0
	 rcall	L0E87
	ldd	r25,Z+o18
	ldi	r27,k08
L0F15:
	bst	r25,b0
	 brtc	L0F1C
;	-----		branch on last line
	mov	r16,r24
	 rcall	L0E57
	 rcall	L0BC8
	mov	r16,r24
	 rcall	L0F7F
L0F1C:
	lsr	r25
	inc	r24
	dec	r27
	 brne	L0F15
;	-----		branch on last line
	 rcall	L0E70
	 brcs	L0F11
;	-----		branch on last line
	 rcall	L0E82
	 breq	L0F40
;	-----		branch on last line
	ldi	r27,k60
	ldi	r26,k00
	rjmp	L0F3C
;	-----------	jump on last line
L0F27:
	 rcall	L0BD0
	subi	r30,k72
	sbci	r31,kFD
	ld	r25,Z
	ldi	r24,k00
L0F2C:
	bst	r25,b0
	 brtc	L0F35
;	-----		branch on last line
	 rcall	L0BAE
	subi	r30,k15
	sbci	r31,kFD
	ld	r20,Z
	mov	r16,r27
	 rcall	L0BEA
	 rcall	L0FDD
L0F35:
	 rcall	L0F66
	 breq	L0F3B
;	-----		branch on last line
	inc	r27
	inc	r24
	cpi	r24,k08
	 brcs	L0F2C
;	-----		branch on last line
L0F3B:
	inc	r26
L0F3C:
	 rcall	L0E4E
	cp	r16,r26
	sbci	r17,k00
	 brge	L0F27
;	-----		branch on last line
L0F40:
	ldi	r24,k00
L0F41:
	 rcall	L0BB4
	 rcall	L0BC8
	mov	r16,r24
	 rcall	L0FF0
	inc	r24
	cpi	r24,k10
	 brcs	L0F41
;	-----		branch on last line
	ldi	r24,k10
L0F49:
	 rcall	L0BB4
	ld	r17,Z
	mov	r16,r24
	 rcall	L0FA1
	inc	r24
	cpi	r24,k20
	 brcs	L0F49
;	-----		branch on last line
	ldi	r30,k65
	 rcall	L0BFB
	 rcall	L0B10
	ldi	r16,k0D
	 rcall	L0ADB
	 rcall	L0AEA
	ldi	r16,k1D
	 rcall	L0D49
	andi	r16,kBF
	 rcall	L0B3E
	 rcall	L0AE9
	 rcall	L0E63
	 breq	L0F65
;	-----		branch on last line
	 rcall	L0BA1
	ldi	r17,k00
	 rcall	L0AED
	 rcall	L0B1E
	 rcall	L0BA3
	ldi	r16,k00
	sts	D022F,r16
L0F65:
	rjmp	L0D37
;	-----------	jump on last line
L0F66:
	lsr	r25
	rjmp	L0E7E
;	-----------	jump on last line
L0F68:
	lds	r16,D02A2
	cp	r24,r16
	ret
;----------------------*
; pc=0xF6C(0x1ED8)
;
L0F6C:
	 rcall	L0B65
	ldi	r30,k65
	 rcall	L0BFB
	 rcall	L0E63
	 breq	L0F79
;	-----		branch on last line
	 rcall	L0BA1
	ldi	r17,k00
	 rcall	L0AED
	 rcall	L0B1E
	 rcall	L0BA3
	ldi	r16,k00
	sts	D022F,r16
L0F79:
	 rcall	L0F7C
	ld	r25,Y+
	ret
;----------------------*
; pc=0xF7C(0x1EF8)
;
L0F7C:
	adiw	r28,k06
	ld	r24,Y+
	ret
;----------------------*
; pc=0xF7F(0x1EFE)
;
L0F7F:
	st	-Y,r24
	sbiw	r28,k04
	mov	r24,r16
	mov	r18,r16
	andi	r18,k30
	asr	r18
	asr	r18
	asr	r18
	mov	r16,r17
	andi	r16,k10
	asr	r16
	asr	r16
	asr	r16
	asr	r16
	or	r16,r18
	ori	r16,kB8
	std	Y+o00,r16
	swap	r17
	andi	r17,kF0
	mov	r16,r24
	andi	r16,k0F
	or	r16,r17
	 rcall	L0CDD
	ldi	r16,k01
	 rcall	L0B1E
	 rcall	L0D08
	 rcall	L0F68
	 brne	L0F9D
;	-----		branch on last line
	 rcall	L1023
	rjmp	L0F9E
;	-----------	jump on last line
L0F9D:
	ldi	r16,k00
L0F9E:
	adiw	r28,k04
	ld	r24,Y+
	ret
;----------------------*
; pc=0xFA1(0x1F42)
;
L0FA1:
	sbiw	r28,k04
	mov	r18,r17
	swap	r18
	andi	r18,k0F
	ori	r18,kE0
L0FA6:
	 rcall	L0FAD
L0FA7:
	 rcall	L0CDE
	ldi	r16,k01
	 rcall	L0B1E
	 rcall	L0D08
	adiw	r28,k04
	ret
;----------------------*
; pc=0xFAD(0x1F5A)
;
L0FAD:
	std	Y+o00,r18
	swap	r16
	andi	r16,kF0
	andi	r17,k0F
	or	r17,r16
	std	Y+o01,r17
	ret
;----------------------*
; pc=0xFB4(0x1F68)
;
L0FB4:
	sbiw	r28,k04
	mov	r19,r17
	andi	r19,k30
	 rcall	L0FBA
	ori	r18,kB0
	rjmp	L0FA6
;	-----------	jump on last line
L0FBA:
	asr	r19
	asr	r19
	asr	r19
	mov	r18,r16
	andi	r18,k10
	asr	r18
	asr	r18
	asr	r18
	asr	r18
	or	r18,r19
	ret
;----------------------*
; pc=0xFC5(0x1F8A)
;
L0FC5:
	sbiw	r28,k04
	ldi	r16,k94
	std	Y+o00,r16
	ldi	r16,k09
L0FC9:
	std	Y+o01,r16
	rjmp	L0FA7
;	-----------	jump on last line
L0FCB:
	 rcall	L0B66
	mov	r24,r16
	 rcall	L0C8F
	 rcall	L0C15
	ldi	r16,k81
	 rcall	L0B2F
	 rcall	L0CDD
	ldi	r16,k01
	 rcall	L0B1E
	 rcall	L0D0B
	 rcall	L0E6B
	rjmp	L0F7C
;	-----------	jump on last line
L0FD7:
	 rcall	L0B65
	 rcall	L0CE9
	mov	r17,r20
	 rcall	L0BD7
	mov	r17,r25
	ret
;----------------------*
; pc=0xFDD(0x1FBA)
;
L0FDD:
	 rcall	L0FD7
	 rcall	L0C8F
	 rcall	L0C15
	ldi	r16,k83
	 rcall	L0B2F
L0FE2:
	 rcall	L0CDD
	ldi	r16,k01
	 rcall	L0B1E
	 rcall	L0D0B
	rjmp	L0F79
;	-----------	jump on last line
L0FE7:
	 rcall	L0FD7
	ldi	r16,k1D
	 rcall	L0C90
	ldi	r16,k1C
	 rcall	L0FA1
	ldi	r16,k83
	std	Y+o00,r16
	ldi	r16,k08
	rjmp	L0FE2
;	-----------	jump on last line
L0FF0:
	sbiw	r28,k04
	mov	r19,r17
	andi	r19,k10
	 rcall	L0FBA
	ori	r18,k2C
	 rcall	L0FAD
	rjmp	L0FA7
;	-----------	jump on last line
L0FF7:
	sbiw	r28,k04
	ldi	r16,k95
	std	Y+o00,r16
	ldi	r16,kA8
	rjmp	L0FC9
;	-----------	jump on last line
L0FFC:
	st	-Y,r25
	st	-Y,r24
	sbiw	r28,k04
	mov	r20,r16
	 rcall	L0BE7
	 rcall	L0FE7
	 rcall	L0BA1
	 rcall	L0CDE
	ldi	r16,k95
	std	Y+o00,r16
	ldi	r16,kE8
	std	Y+o01,r16
	ldi	r16,k01
	 rcall	L0B1E
	 rcall	L0D08
	 rcall	L0A8F
L100C:
	 rcall	L0B36
	 breq	L1010
;	-----		branch on last line
	 rcall	L0B3A
	 brne	L100C
;	-----		branch on last line
L1010:
	 rcall	L0BA6
	ldi	r16,k04
	 call	L0115
L1014:
	 rcall	L0BE7
	 rcall	L0FCB
	andi	r16,k01
	 breq	L101A
;	-----		branch on last line
	 rcall	L0B3A
	 brne	L1014
;	-----		branch on last line
L101A:
	 rcall	L0C11
	ldi	r30,kA4
	ldi	r31,k02
	 rcall	L0C17
	 rcall	L0FC5
	adiw	r28,k04
	ld	r24,Y+
	ld	r25,Y+
	ret
;----------------------*
; pc=0x1023(0x2046)
;
L1023:
	sbiw	r28,k04
	 rcall	L0B10
	ldi	r16,k0C
	 rcall	L0B2F
	 rcall	L0B1E
	 rcall	L0B18
	 rcall	L0D08
	ldd	r16,Y+o02
	adiw	r28,k04
	ret
;----------------------*
; pc=0x102D(0x205A)
;
L102D:
	 rcall	L0B0E
	 rcall	L0ADA
	 rcall	L0AEA
	 rcall	L0D48
	andi	r16,k9F
	or	r16,r24
	std	Y+o01,r16
L1034:
	 rcall	L0B3F
	 rcall	L0AE9
	 rcall	L0F7C
	ret
;----------------------*
; pc=0x1038(0x2070)
;
L1038:
	 rcall	L0B0E
	 rcall	L0ADA
	 rcall	L0AEA
	 rcall	L0D48
	andi	r16,k7F
	std	Y+o01,r16
	tst	r24
	 breq	L1043
;	-----		branch on last line
	ldd	r16,Y+o01
	ori	r16,k80
	std	Y+o01,r16
L1043:
	rjmp	L1034
;	-----------	jump on last line
L1044:
	sbiw	r28,k06
	 rcall	L0B10
	 rcall	L0ADA
	 rcall	L0AEA
	 rcall	L0D48
	ori	r16,k10
	std	Y+o01,r16
	ldd	r16,Y+o05
	rjmp	L0D44
;	-----------	jump on last line
L104D:
	 call	L1541
	sbiw	r28,k06
	mov	r4,r16
	mov	r5,r17
	mov	r24,r18
	mov	r25,r19
	mov	r26,r20
	 rcall	L0B10
	ldi	r16,k12
	std	Y+o00,r16
	std	Y+o01,r5
	std	Y+o02,r4
	 rcall	L0AE9
	ldi	r16,k13
	std	Y+o00,r16
	std	Y+o01,r25
	std	Y+o02,r24
	ldi	r16,k00
	ldi	r17,k00
	 rcall	L0AD6
	 rcall	L0AEA
	ldi	r16,k18
	std	Y+o00,r16
	ldd	r17,Y+o04
	andi	r17,kFC
	mov	r16,r26
	swap	r16
	andi	r16,k0F
	lsr	r16
	or	r16,r17
	std	Y+o01,r16
	ldd	r16,Y+o05
	andi	r16,k03
	lsl	r26
	lsl	r26
	lsl	r26
	or	r26,r16
	std	Y+o02,r26
	 rcall	L0AE9
	adiw	r28,k06
	ldi	r30,k06
	jmp	L1552
;	-----------	jump on last line
L1079:
	 rcall	L0B0E
	andi	r24,k0F
	std	Y+o03,r24
	ldi	r16,k00
	 rcall	L0B1E
	ldi	r20,k05
	 rcall	L0D0E
	ldi	r16,k00
	 rcall	L0B1E
	ldi	r20,k15
	 rcall	L0D0E
	ldd	r17,Y+o01
	ldd	r16,Y+o02
	 rcall	L0F7C
	ret
;----------------------*
; pc=0x1088(0x2110)
;
L1088:
	in	r16,PINC
	andi	r16,k0F
	ori	r16,kC0
	ret
;----------------------*
; pc=0x108C(0x2118)
;
L108C:
	 call	L1544
	 rcall	L0CE9
	ldi	r30,kA9
	ldi	r31,k02
	ld	r26,Z
	lds	r16,D02A8
	tst	r16
	 breq	L109E
;	-----		branch on last line
;	--------- this is skippy
	 sbrs	r17,b7
	 rjmp	L109A
;	--------- last may be skipped
; pc=0x1098(0x2130)
;
	ldi	r17,k01
	rjmp	L109B
;	-----------	jump on last line
L109A:
	ldi	r17,k00
L109B:
	 rcall	L0BC9
	ldi	r16,k3B
	 rcall	L0F7F
L109E:
	lsl	r24
	rol	r25
	 rcall	L0C2C
	mov	r17,r26
	 rcall	L10AB
	 rcall	L0FA1
	ldi	r16,k03
	 rcall	L0FFC
	ldi	r16,k11
	 rcall	L0FFC
	ldi	r30,k03
	jmp	L1555
;	-----------	jump on last line
L10AB:
	and	r17,r24
L10AC:
	 rcall	L0C15
	mov	r17,r25
	ldi	r16,k1F
	ret
;----------------------*
; pc=0x10B0(0x2160)
;
L10B0:
	 call	L1540
	 rcall	L0CE9
	mov	r26,r18
	mov	r27,r19
	mov	r4,r20
	ldi	r30,kA9
	ldi	r31,k02
	ld	r6,Z
	lds	r16,D02A8
	tst	r16
	 breq	L10C5
;	-----		branch on last line
;	--------- this is skippy
	 sbrs	r17,b7
	 rjmp	L10C1
;	--------- last may be skipped
; pc=0x10BF(0x217E)
;
	ldi	r17,k01
	rjmp	L10C2
;	-----------	jump on last line
L10C1:
	ldi	r17,k00
L10C2:
	 rcall	L0BC9
	ldi	r16,k3B
	 rcall	L0F7F
L10C5:
	lsl	r24
	rol	r25
	inc	r4
	 rcall	L0C2C
	rjmp	L10D9
;	-----------	jump on last line
L10CA:
	mov	r17,r24
	andi	r17,kFE
	 rcall	L10AC
	 rcall	L0FA1
	ld	r17,X+
	 rcall	L0BC9
	ldi	r16,k01
	 rcall	L0FF0
	ld	r17,X+
	 rcall	L0BC9
	ldi	r16,k00
	 rcall	L0FF0
	ldi	r16,k01
	 rcall	L0FFC
	adiw	r24,k02
L10D9:
	mov	r16,r4
	dec	r4
	tst	r16
	 brne	L10CA
;	-----		branch on last line
	sbiw	r24,k02
	mov	r17,r6
	 rcall	L10AB
	 rcall	L0FA1
	ldi	r16,k05
	 rcall	L0FFC
	ldi	r16,k11
	 rcall	L0FFC
	ldi	r30,k07
	jmp	L1551
;	-----------	jump on last line
L10E8:
	tst	r17
	ldi	r30,k30
	ldi	r31,k02
	ld	r18,Z
	ldd	r19,Z+o01
	 breq	L10F1
;	-----		branch on last line
	st	Z,r18
	std	Z+o01,r16
	rjmp	L10F3
;	-----------	jump on last line
L10F1:
	st	Z,r16
	std	Z+o01,r19
L10F3:
	ldi	r16,k01
	sts	D022F,r16
	ret
;----------------------*
; pc=0x10F7(0x21EE)
;
L10F7:
	tst	r16
	ldi	r30,k30
	ldi	r31,k02
	 breq	L10FD
;	-----		branch on last line
	ldd	r16,Z+o01
	ret
;----------------------*
; pc=0x10FD(0x21FA)
;
L10FD:
	ld	r16,Z
	ret
;----------------------*
; pc=0x10FF(0x21FE)
;
L10FF:
	subi	r16,kF4
	 breq	L1115
;	-----		branch on last line
	subi	r16,k04
	 breq	L1113
;	-----		branch on last line
	subi	r16,k02
	 breq	L1111
;	-----		branch on last line
	subi	r16,k03
	 breq	L110F
;	-----		branch on last line
	dec	r16
	 breq	L110D
;	-----		branch on last line
	dec	r16
	 brne	L1116
;	-----		branch on last line
	ldi	r17,k03
	rjmp	L1116
;	-----------	jump on last line
L110D:
	ldi	r17,k07
	rjmp	L1116
;	-----------	jump on last line
L110F:
	ldi	r17,k0B
	rjmp	L1116
;	-----------	jump on last line
L1111:
	ldi	r17,k17
	rjmp	L1116
;	-----------	jump on last line
L1113:
	ldi	r17,k1F
	rjmp	L1116
;	-----------	jump on last line
L1115:
	ldi	r17,k2F
L1116:
	mov	r16,r17
	ret
;----------------------*
; pc=0x1118(0x2230)
;
L1118:
	sbiw	r28,k02
	ldi	r17,k01
	ldi	r16,k0C
	 call	L07D1
	ldi	r16,k01
	std	Y+o00,r16
	ldi	r20,k01
	 rcall	L113C
	ldi	r16,k06
	 call	L0115
L1124:
	 rcall	L1140
	 brne	L1124
;	-----		branch on last line
	ldi	r17,k01
	ldi	r16,k04
	 call	L07D1
	ldi	r16,kA3
	std	Y+o00,r16
	ldi	r16,k70
	std	Y+o01,r16
	ldi	r20,k01
	 rcall	L1144
	adiw	r28,k02
	ret
;----------------------*
; pc=0x1132(0x2264)
;
L1132:
	ldi	r16,k37
L1133:
	std	Y+o00,r16
	 rcall	L1150
	rjmp	L113E
;	-----------	jump on last line
L1136:
	ldi	r16,k08
L1137:
	std	Y+o01,r16
L1138:
	 rcall	L1150
	ldi	r19,k00
	mov	r16,r28
	rjmp	L114D
;	-----------	jump on last line
L113C:
	ldi	r21,k00
	ldi	r18,k01
L113E:
	ldi	r19,k00
	rjmp	L114C
;	-----------	jump on last line
L1140:
	lds	r16,D006E
	tst	r16
	ret
;----------------------*
; pc=0x1144(0x2288)
;
L1144:
	ldi	r21,k00
	ldi	r18,k10
L1146:
	rjmp	L114B
;	-----------	jump on last line
L1147:
	std	Y+o01,r16
L1148:
	ldi	r20,k01
	ldi	r21,k00
	ldi	r18,k0F
L114B:
	ldi	r19,k00
L114C:
	mov	r16,r28
L114D:
	mov	r17,r29
	jmp	L09F7
;	-----------	jump on last line
L1150:
	ldi	r20,k01
	ldi	r21,k00
	ldi	r18,k0F
	ret
;----------------------*
; pc=0x1154(0x22A8)
;
L1154:
	ldi	r21,k00
	ldi	r18,k0F
L1156:
	ldi	r19,k00
	mov	r16,r28
	mov	r17,r29
	ret
;----------------------*
; pc=0x115A(0x22B4)
;
L115A:
	sbiw	r28,k03
	 rcall	L1174
	ldi	r16,k00
	 rcall	L1137
	 rcall	L1180
	ldi	r17,k00
	ldi	r16,k04
	 rcall	L117B
	std	Y+o01,r16
	ldi	r20,k00
	 rcall	L1144
	ldi	r17,k00
	ldi	r16,k0C
	 rcall	L117B
	ldi	r20,k00
	 rcall	L113C
	adiw	r28,k03
	ret
;----------------------*
; pc=0x116C(0x22D8)
;
L116C:
	mov	r4,r16
	mov	r5,r17
	mov	r24,r18
	mov	r25,r19
	ldi	r30,kA9
	ldi	r31,k02
	ld	r26,Z
	ldd	r27,Z+o01
L1174:
	ldi	r17,k01
	ldi	r16,k05
	 call	L07D1
	ldi	r16,k23
	std	Y+o00,r16
	ret
;----------------------*
; pc=0x117B(0x22F6)
;
L117B:
	 call	L07D1
	ldi	r16,k00
	std	Y+o00,r16
	ret
;----------------------*
; pc=0x1180(0x2300)
;
L1180:
	ldi	r16,k33
L1181:
	std	Y+o00,r16
	ldi	r16,k00
	std	Y+o01,r16
	 rcall	L1150
	rjmp	L1146
;	-----------	jump on last line
L1186:
	sbiw	r28,k04
	 rcall	L1174
	ldi	r16,k80
	 rcall	L1137
	ldi	r16,k31
	 rcall	L1199
	ldi	r16,k33
	 rcall	L1199
	 rcall	L119E
L118F:
	ldi	r22,k00
	 rcall	L11A6
	ldd	r16,Y+o02
;	--------- this is skippy
	 sbrc	r16,b1
	 rjmp	L1196
;	--------- last may be skipped
; pc=0x1194(0x2328)
;
	 rcall	L1140
	 brne	L118F
;	-----		branch on last line
L1196:
	adiw	r28,k04
	ret
;----------------------*
; pc=0x1198(0x2330)
;
L1198:
	ldi	r16,k11
L1199:
	std	Y+o00,r16
	ldi	r20,k00
L119B:
	 rcall	L1154
	jmp	L09F7
;	-----------	jump on last line
L119E:
	ldi	r20,k00
	 rcall	L1154
	 call	L09F7
	ldi	r16,k10
	jmp	L0115
;	-----------	jump on last line
L11A5:
	ldi	r22,k01
L11A6:
	 rcall	L11A9
	jmp	L0904
;	-----------	jump on last line
L11A9:
	ldi	r23,k00
	ldi	r20,k0F
	ldi	r21,k00
	mov	r18,r28
	mov	r19,r29
	subi	r18,kFE
	sbci	r19,kFF
	mov	r16,r28
	mov	r17,r29
	ret
;----------------------*
; pc=0x11B3(0x2366)
;
L11B3:
	 call	L1541
	sbiw	r28,k04
	 rcall	L116C
	ldi	r16,k10
	 rcall	L120B
	 rcall	L121A
	mov	r16,r4
	andi	r16,kC0
	 rcall	L1137
	ldi	r17,k00
	ldi	r16,k06
	 rcall	L11F5
	 brne	L11C3
;	-----		branch on last line
	ldi	r18,k01
	rjmp	L11C4
;	-----------	jump on last line
L11C3:
	ldi	r18,k00
L11C4:
	 rcall	L121D
	 brne	L11C8
;	-----		branch on last line
	ldi	r16,k01
	rjmp	L11C9
;	-----------	jump on last line
L11C8:
	ldi	r16,k00
L11C9:
	or	r16,r18
	or	r16,r19
	 breq	L11DE
;	-----		branch on last line
	 rcall	L1227
	 brne	L11D0
;	-----		branch on last line
	subi	r24,k81
	rjmp	L11D3
;	-----------	jump on last line
L11D0:
	 rcall	L1231
	 brne	L11D4
;	-----		branch on last line
	subi	r24,k01
L11D3:
	sbci	r25,kFF
L11D4:
	clr	r4
	clr	r5
L11D6:
	cp	r4,r26
	cpc	r5,r27
	 brcc	L11E2
;	-----		branch on last line
	 rcall	L1215
	 call	L09F7
	 rcall	L11FA
	rjmp	L11D6
;	-----------	jump on last line
L11DE:
	 rcall	L1239
	 rcall	L123F
	 call	L09F7
L11E2:
	 rcall	L1211
	ldi	r16,k37
	 rcall	L1206
	ldi	r16,k35
	 rcall	L1199
	ldi	r16,k37
	 rcall	L1199
	 rcall	L119E
L11EA:
	ldi	r22,k00
	 rcall	L11A6
	ldd	r16,Y+o02
;	--------- this is skippy
	 sbrc	r16,b1
	 rjmp	L11F1
;	--------- last may be skipped
; pc=0x11EF(0x23DE)
;
	 rcall	L1140
	 brne	L11EA
;	-----		branch on last line
L11F1:
	adiw	r28,k04
	ldi	r30,k06
	jmp	L1552
;	-----------	jump on last line
L11F5:
	 call	L07D1
	ldi	r30,k6F
	ldi	r31,k00
	rjmp	L1227
;	-----------	jump on last line
L11FA:
	sbiw	r24,k01
	ldi	r16,k01
	add	r4,r16
	ldi	r16,k00
	adc	r5,r16
	ret
;----------------------*
; pc=0x1200(0x2400)
;
L1200:
	std	Y+o01,r24
	ldi	r20,k01
L1202:
	 rcall	L1154
	 call	L09F7
	ldi	r16,k32
L1206:
	std	Y+o00,r16
	ldi	r16,k00
	std	Y+o01,r16
	ldi	r20,k00
	rjmp	L119B
;	-----------	jump on last line
L120B:
	 rcall	L1147
	ldi	r16,k07
L120D:
	std	Y+o00,r16
	std	Y+o01,r5
	ldi	r20,k01
	rjmp	L119B
;	-----------	jump on last line
L1211:
	ldi	r17,k00
	ldi	r16,k05
	jmp	L07D1
;	-----------	jump on last line
L1215:
	ldi	r20,k00
	ldi	r21,k00
	ldi	r18,k08
	ldi	r19,k00
	rjmp	L1242
;	-----------	jump on last line
L121A:
	ldi	r16,k03
	std	Y+o00,r16
	ret
;----------------------*
; pc=0x121D(0x243A)
;
L121D:
	ldi	r19,k00
	ld	r20,Z
	ldd	r21,Z+o01
	ldd	r22,Z+o02
	ldd	r23,Z+o03
	cpi	r20,k3F
	sbci	r21,k10
	sbci	r22,k78
	sbci	r23,k09
	ret
;----------------------*
; pc=0x1227(0x244E)
;
L1227:
	ld	r16,Z
	ldd	r17,Z+o01
	ldd	r18,Z+o02
	ldd	r19,Z+o03
	andi	r19,k0F
	cpi	r16,k3F
	sbci	r17,k50
	sbci	r18,k40
	sbci	r19,k09
	ret
;----------------------*
; pc=0x1231(0x2462)
;
L1231:
	ldd	r17,Z+o01
	ldd	r18,Z+o02
	ldd	r19,Z+o03
	cpi	r16,k3F
	sbci	r17,k10
	sbci	r18,k78
	sbci	r19,k09
	ret
;----------------------*
; pc=0x1239(0x2472)
;
L1239:
	ldi	r21,k00
	mov	r16,r26
	mov	r17,r27
	ldi	r20,k03
	jmp	L1467
;	-----------	jump on last line
L123F:
	mov	r18,r16
	mov	r19,r17
	ldi	r20,k00
L1242:
	mov	r16,r24
	mov	r17,r25
	ret
;----------------------*
; pc=0x1245(0x248A)
;
L1245:
	 call	L153F
	 rcall	L128B
	mov	r4,r18
	mov	r5,r19
	ldi	r30,kA9
	ldi	r31,k02
	ld	r24,Z
	ldd	r25,Z+o01
	 rcall	L1174
	ldi	r16,k10
	 rcall	L1283
	clr	r6
	rjmp	L1261
;	-----------	jump on last line
L1253:
	 rcall	L121A
	mov	r16,r26
	add	r16,r6
	 rcall	L1137
	ldi	r16,k13
	 rcall	L1279
	ldi	r16,k17
	 rcall	L1279
	ldi	r16,k37
	 rcall	L1181
	ldi	r16,k77
	 rcall	L1133
	 rcall	L1132
	inc	r6
L1261:
	clr	r7
	mov	r16,r24
	mov	r17,r25
	lsr	r17
	ror	r16
	cp	r6,r16
	cpc	r7,r17
	 brcs	L1253
;	-----		branch on last line
	 rcall	L1132
	ldi	r16,k35
	 rcall	L1133
	 rcall	L1132
	 rcall	L1138
	 rcall	L128F
L126F:
	 rcall	L11A5
	ldd	r16,Y+o02
;	--------- this is skippy
	 sbrc	r16,b1
	 rjmp	L1275
;	--------- last may be skipped
; pc=0x1273(0x24E6)
;
	 rcall	L1140
	 brne	L126F
;	-----		branch on last line
L1275:
	adiw	r28,k04
	ldi	r30,k08
	jmp	L1550
;	-----------	jump on last line
L1279:
	std	Y+o00,r16
	mov	r30,r4
	mov	r31,r5
	ld	r16,Z+
	mov	r4,r30
	mov	r5,r31
	std	Y+o01,r16
	ldi	r20,k01
	rjmp	L1288
;	-----------	jump on last line
L1282:
	ldi	r16,k11
L1283:
	 rcall	L1147
	ldi	r16,k07
	std	Y+o00,r16
	std	Y+o01,r27
L1287:
	ldi	r20,k01
L1288:
	 rcall	L1154
	jmp	L09F7
;	-----------	jump on last line
L128B:
	sbiw	r28,k04
	mov	r26,r16
	mov	r27,r17
	ret
;----------------------*
; pc=0x128F(0x251E)
;
L128F:
	ldi	r16,k10
	jmp	L0115
;	-----------	jump on last line
L1292:
	 call	L1541
	sbiw	r28,k02
	 rcall	L116C
	ldi	r16,k02
	 rcall	L120B
	 rcall	L121A
	cpi	r26,k81
	ldi	r16,k00
	cpc	r27,r16
	 brcs	L129F
;	-----		branch on last line
	ldi	r16,k80
	rjmp	L12A0
;	-----------	jump on last line
L129F:
	ldi	r16,kC0
L12A0:
	and	r4,r16
	std	Y+o01,r4
	 rcall	L1138
	ldi	r17,k00
	ldi	r16,k07
	 rcall	L11F5
	 brne	L12A9
;	-----		branch on last line
	ldi	r18,k01
	rjmp	L12AA
;	-----------	jump on last line
L12A9:
	ldi	r18,k00
L12AA:
	 rcall	L121D
	 brne	L12AE
;	-----		branch on last line
	ldi	r16,k01
	rjmp	L12AF
;	-----------	jump on last line
L12AE:
	ldi	r16,k00
L12AF:
	or	r16,r18
	or	r16,r19
	 breq	L12C4
;	-----		branch on last line
	 rcall	L1227
	 brne	L12B6
;	-----		branch on last line
	subi	r24,k80
	rjmp	L12B9
;	-----------	jump on last line
L12B6:
	 rcall	L1231
	 brne	L12BA
;	-----		branch on last line
	subi	r24,k00
L12B9:
	sbci	r25,kFF
L12BA:
	clr	r4
	clr	r5
L12BC:
	cp	r4,r26
	cpc	r5,r27
	 brcc	L12CA
;	-----		branch on last line
	 rcall	L1215
	 call	L0995
	 rcall	L11FA
	rjmp	L12BC
;	-----------	jump on last line
L12C4:
	 rcall	L1239
	subi	r16,kF8
	sbci	r17,kFF
	 rcall	L123F
	 call	L0995
L12CA:
	 rcall	L1211
	adiw	r28,k02
	ldi	r30,k06
	jmp	L1552
;	-----------	jump on last line
	 rcall	L12EB
	mov	r25,r17
	 rcall	L1174
	ldi	r16,k02
	 rcall	L12E6
	 rcall	L121A
	 rcall	L1200
	ldi	r16,k36
	 rcall	L12E1
	ldd	r24,Y+o03
	ldi	r16,k37
	 rcall	L12E1
	ldd	r16,Y+o03
	mov	r17,r24
L12DD:
	adiw	r28,k04
	ld	r24,Y+
	ld	r25,Y+
	ret
;----------------------*
; pc=0x12E1(0x25C2)
;
L12E1:
	std	Y+o00,r16
	ldi	r22,k00
	 rcall	L11A9
	jmp	L0904
;	-----------	jump on last line
L12E6:
	 rcall	L1147
	ldi	r16,k07
L12E8:
	std	Y+o00,r16
	std	Y+o01,r25
	rjmp	L1287
;	-----------	jump on last line
L12EB:
	st	-Y,r25
L12EC:
	st	-Y,r24
	sbiw	r28,k04
	mov	r24,r16
	ret
;----------------------*
; pc=0x12F0(0x25E0)
;
L12F0:
	 call	L1543
	 rcall	L128B
	mov	r24,r18
	 rcall	L1174
	 rcall	L1282
	 rcall	L121A
	std	Y+o01,r26
	 rcall	L130A
	ldi	r16,k13
	 rcall	L1206
	 rcall	L1198
	ldi	r16,k13
	 rcall	L1199
	 rcall	L128F
L12FF:
	ldi	r22,k00
	 rcall	L11A6
	ldd	r16,Y+o02
;	--------- this is skippy
	 sbrc	r16,b1
	 rjmp	L1306
;	--------- last may be skipped
; pc=0x1304(0x2608)
;
	 rcall	L1140
	 brne	L12FF
;	-----		branch on last line
L1306:
	adiw	r28,k04
	ldi	r30,k04
	jmp	L1554
;	-----------	jump on last line
L130A:
	 rcall	L1148
	ldi	r16,k13
L130C:
	std	Y+o00,r16
	std	Y+o01,r24
L130E:
	 rcall	L1150
	 rcall	L1156
	jmp	L09F7
;	-----------	jump on last line
L1312:
	 call	L1541
	 rcall	L128B
	mov	r24,r18
	mov	r25,r19
	 rcall	L1174
	 rcall	L1282
	clr	r4
	rjmp	L132E
;	-----------	jump on last line
L131B:
	 rcall	L121A
	mov	r16,r26
	add	r16,r4
	 rcall	L1137
	ldi	r16,k13
	std	Y+o00,r16
	clr	r5
	mov	r30,r24
	mov	r31,r25
	add	r30,r4
	adc	r31,r5
	ld	r16,Z
	 rcall	L1137
	ldi	r16,k37
	 rcall	L120D
	ldi	r16,k77
	 rcall	L1133
	 rcall	L1132
	inc	r4
L132E:
	lds	r16,D02AB
	cp	r4,r16
	 brcs	L131B
;	-----		branch on last line
	ldi	r16,k33
	 rcall	L1133
	ldi	r16,k31
	 rcall	L1133
	ldi	r16,k33
	 rcall	L1133
	ldi	r16,k33
	 rcall	L1133
	 rcall	L128F
L133B:
	 rcall	L11A5
	ldd	r16,Y+o02
;	--------- this is skippy
	 sbrc	r16,b1
	 rjmp	L1341
;	--------- last may be skipped
; pc=0x133F(0x267E)
;
	 rcall	L1140
	 brne	L133B
;	-----		branch on last line
L1341:
	rjmp	L11F1
;	-----------	jump on last line
L1342:
	 rcall	L12EB
	mov	r25,r17
	 rcall	L1174
	ldi	r16,k03
	 rcall	L12E6
	ldi	r16,k03
	 rcall	L130C
	ldi	r16,k33
	std	Y+o00,r16
	std	Y+o01,r24
	ldi	r20,k00
	 rcall	L1202
	ldi	r16,k33
	 rcall	L12E1
	ldd	r16,Y+o03
	rjmp	L12DD
;	-----------	jump on last line
L1352:
	st	-Y,r25
	st	-Y,r24
	sbiw	r28,k04
	mov	r25,r16
	mov	r24,r17
	 rcall	L1174
	ldi	r16,k40
	 rcall	L1137
	ldi	r16,k13
	 rcall	L12E8
	tst	r24
	 brne	L136C
;	-----		branch on last line
	 rcall	L1180
	ldi	r16,k31
	 rcall	L1133
	ldi	r16,k33
	 rcall	L1133
	 rcall	L1138
	 rcall	L138D
L1365:
	 rcall	L11A5
	ldd	r16,Y+o02
;	--------- this is skippy
	 sbrc	r16,b1
	 rjmp	L138C
;	--------- last may be skipped
; pc=0x1369(0x26D2)
;
	 rcall	L1140
	 brne	L1365
;	-----		branch on last line
	rjmp	L12DD
;	-----------	jump on last line
L136C:
	cpi	r24,k01
	 brne	L137C
;	-----		branch on last line
	ldi	r16,k37
	 rcall	L1181
	ldi	r16,k35
	 rcall	L1133
	 rcall	L1132
	 rcall	L1138
	 rcall	L138D
L1375:
	 rcall	L11A5
	ldd	r16,Y+o02
;	--------- this is skippy
	 sbrc	r16,b1
	 rjmp	L138C
;	--------- last may be skipped
; pc=0x1379(0x26F2)
;
	 rcall	L1140
	 brne	L1375
;	-----		branch on last line
	rjmp	L12DD
;	-----------	jump on last line
L137C:
	cpi	r24,k02
	 brne	L138C
;	-----		branch on last line
	ldi	r16,k3B
	 rcall	L1181
	ldi	r16,k39
	 rcall	L1133
	ldi	r16,k3B
	 rcall	L1133
	 rcall	L1138
	 rcall	L138D
L1386:
	 rcall	L11A5
	ldd	r16,Y+o02
;	--------- this is skippy
	 sbrc	r16,b1
	 rjmp	L138C
;	--------- last may be skipped
; pc=0x138A(0x2714)
;
	 rcall	L1140
	 brne	L1386
;	-----		branch on last line
L138C:
	rjmp	L12DD
;	-----------	jump on last line
L138D:
	ldi	r16,k0A
	jmp	L0115
;	-----------	jump on last line
L1390:
	 rcall	L12EC
	 rcall	L1174
	ldi	r16,k20
	std	Y+o01,r16
	 rcall	L130A
	ldi	r16,k13
	 rcall	L1206
	 rcall	L1198
	ldi	r16,k13
	 rcall	L1199
	 rcall	L138D
L139B:
	ldi	r22,k00
	 rcall	L11A6
	ldd	r16,Y+o02
;	--------- this is skippy
	 sbrc	r16,b1
	 rjmp	L13A2
;	--------- last may be skipped
; pc=0x13A0(0x2740)
;
	 rcall	L1140
	 brne	L139B
;	-----		branch on last line
L13A2:
	adiw	r28,k04
	ld	r24,Y+
	ret
;----------------------*
; pc=0x13A5(0x274A)
;
L13A5:
	st	-Y,r24
	sbiw	r28,k04
	cpi	r17,k02
	 breq	L13BA
;	-----		branch on last line
	tst	r16
	 brne	L13AD
;	-----		branch on last line
	ldi	r24,k04
	rjmp	L13B2
;	-----------	jump on last line
L13AD:
	cpi	r17,k01
	 brne	L13B1
;	-----		branch on last line
	ldi	r24,k0C
	rjmp	L13B2
;	-----------	jump on last line
L13B1:
	ldi	r24,k00
L13B2:
	 rcall	L1211
	 rcall	L13C5
	mov	r16,r24
	ori	r16,k32
	 rcall	L1181
	ori	r24,k33
	std	Y+o00,r24
	rjmp	L13BF
;	-----------	jump on last line
L13BA:
	 rcall	L13C5
	ldi	r16,k3A
	 rcall	L1181
	ldi	r16,k3B
	std	Y+o00,r16
L13BF:
	ldi	r22,k01
L13C0:
	 rcall	L11A6
	ldd	r16,Y+o03
	adiw	r28,k04
	ld	r24,Y+
	ret
;----------------------*
; pc=0x13C5(0x278A)
;
L13C5:
	ldi	r16,k23
	std	Y+o00,r16
	ldi	r16,k04
	std	Y+o01,r16
	rjmp	L130E
;	-----------	jump on last line
L13CA:
	 rcall	L12EC
	 rcall	L1174
	 rcall	L1136
	 rcall	L121A
	 rcall	L1200
	ldi	r16,k33
L13D0:
	std	Y+o00,r16
	ldi	r22,k00
	rjmp	L13C0
;	-----------	jump on last line
L13D3:
	 rcall	L12EC
	 rcall	L1174
	 rcall	L1136
	ldi	r16,k03
	 rcall	L130C
	ldi	r16,k36
	 rcall	L1206
	ldi	r16,k37
	rjmp	L13D0
;	-----------	jump on last line
L13DC:
	ldi	r17,k00
	out	UCSRC,r17
	out	UBRRL,r16
	ldi	r16,k98
	out	UCSRB,r16
	sts	D036A,r17
	sts	D0369,r17
	sts	D037C,r17
	sts	D037B,r17
	ret
;----------------------*
; pc=0x13EA(0x27D4)
;
L13EA:
	st	-Y,r31
	st	-Y,r30
	st	-Y,r19
	st	-Y,r18
	st	-Y,r17
	st	-Y,r16
	in	r19,SREG
	in	r17,UDR
	lds	r16,D0369
	inc	r16
	andi	r16,k3F
	sts	D0369,r16
	lds	r18,D036A
	 rcall	L1404
	st	Z,r17
	out	SREG,r19
	ld	r16,Y+
	ld	r17,Y+
	ld	r18,Y+
	ld	r19,Y+
	ld	r30,Y+
	ld	r31,Y+
	reti
;----------------------*
; pc=0x1404(0x2808)
;
L1404:
	mov	r30,r16
	ldi	r31,k00
	subi	r30,kD7
	sbci	r31,kFC
	ret
;----------------------*
; pc=0x1409(0x2812)
;
L1409:
	st	-Y,r31
	st	-Y,r30
	st	-Y,r18
	st	-Y,r17
	st	-Y,r16
	in	r18,SREG
	lds	r16,D037B
	lds	r17,D037C
	cp	r16,r17
	 breq	L1422
;	-----		branch on last line
	lds	r16,D037C
	inc	r16
	andi	r16,k0F
	sts	D037C,r16
	mov	r30,r16
	ldi	r31,k00
	subi	r30,k95
	sbci	r31,kFC
	ld	r16,Z
	out	UDR,r16
	rjmp	L1423
;	-----------	jump on last line
L1422:
	cbi	UCSRB,b5
L1423:
	out	SREG,r18
	ld	r16,Y+
	ld	r17,Y+
	ld	r18,Y+
	ld	r30,Y+
	ld	r31,Y+
	reti
;----------------------*
; pc=0x142A(0x2854)
;
L142A:
	 rcall	L1436
	 breq	L142A
;	-----		branch on last line
	lds	r16,D036A
	inc	r16
	andi	r16,k3F
	sts	D036A,r16
	ldi	r17,k00
	 rcall	L1404
	ld	r16,Z
	ret
;----------------------*
; pc=0x1436(0x286C)
;
L1436:
	lds	r16,D0369
	lds	r17,D036A
	cp	r16,r17
	ret
;----------------------*
; pc=0x143C(0x2878)
;
L143C:
	lds	r18,D037B
	inc	r18
	andi	r18,k0F
L1440:
	lds	r19,D037C
	cp	r18,r19
	 breq	L1440
;	-----		branch on last line
	mov	r30,r18
	ldi	r31,k00
	subi	r30,k95
	sbci	r31,kFC
	st	Z,r16
	sts	D037B,r18
	sbi	UCSRB,b5
	ret
;----------------------*
; pc=0x144D(0x289A)
;
L144D:
	 rcall	L1436
	 breq	L1451
;	-----		branch on last line
	ldi	r16,k01
	ret
;----------------------*
; pc=0x1451(0x28A2)
;
L1451:
	ldi	r16,k00
	ret
;----------------------*
; pc=0x1453(0x28A6)
;
_reset:
; L1453:
	ldi	r16,k9C
	out	SPL,r16
	ldi	r16,k03
	out	SPH,r16
	ldi	r28,k1D
	ldi	r29,k04
	 call	L012B
	tst	r16
	 breq	L145F
;	-----		branch on last line
	 call	L1588
L145F:
	ldi	r16,k00
	out	GICR,r16
	 call	L0144
	 call	L15BA
	jmp	L15BA
;	-----------	jump on last line
L1467:
	dec	r20
	 brmi	L146C
;	-----		branch on last line
	lsl	r16
	rol	r17
	rjmp	L1467
;	-----------	jump on last line
L146C:
	ret
;----------------------*
; pc=0x146D(0x28DA)
;
L146D:
	dec	r20
	 brmi	L1472
;	-----		branch on last line
	lsr	r17
	ror	r16
	rjmp	L146D
;	-----------	jump on last line
L1472:
	ret
;----------------------*
; pc=0x1473(0x28E6)
;
L1473:
	dec	r20
	 brmi	L1478
;	-----		branch on last line
	asr	r17
	ror	r16
	rjmp	L1473
;	-----------	jump on last line
L1478:
	ret
;----------------------*
; pc=0x1479(0x28F2)
;
L1479:
	clr	r0
	clr	r1
	ldi	r30,k0F
L147C:
	rol	r16
	rol	r17
	rol	r0
	rol	r1
	cp	r0,r20
	cpc	r1,r21
	 brcs	L1485
;	-----		branch on last line
	sub	r0,r20
	sbc	r1,r21
L1485:
	dec	r30
	 brpl	L147C
;	-----		branch on last line
	rol	r16
	rol	r17
	mov	r20,r0
	mov	r21,r1
	com	r16
	com	r17
	ret
;----------------------*
; pc=0x148E(0x291C)
;
L148E:
	neg	r21
	neg	r20
	sbci	r21,k00
	ret
;----------------------*
; pc=0x1492(0x2924)
;
L1492:
	clr	r31
	tst	r21
	 brpl	L1497
;	-----		branch on last line
	ori	r31,k01
	 rcall	L148E
L1497:
	tst	r17
	 brpl	L149B
;	-----		branch on last line
	com	r31
	 rcall	L14A2
L149B:
	 call	L1479
;	--------- this is skippy
	 sbrc	r31,b0
	 rcall	L14A2
;	--------- last may be skipped
; pc=0x149F(0x293E)
;
;	--------- this is skippy
	 sbrc	r31,b1
	 rjmp	L148E
;	--------- last may be skipped
; pc=0x14A1(0x2942)
;
	ret
;----------------------*
; pc=0x14A2(0x2944)
;
L14A2:
	neg	r17
	neg	r16
	sbci	r17,k00
	ret
;----------------------*
; pc=0x14A6(0x294C)
;
L14A6:
	dec	r20
	 brmi	L14AD
;	-----		branch on last line
	lsl	r16
	rol	r17
	rol	r18
	rol	r19
	rjmp	L14A6
;	-----------	jump on last line
L14AD:
	ret
;----------------------*
; pc=0x14AE(0x295C)
;
L14AE:
	clr	r0
	clr	r1
	clr	r2
	clr	r3
	ldi	r30,k20
L14B3:
	dec	r30
	 brmi	L14C7
;	-----		branch on last line
	rol	r16
	rol	r17
	rol	r18
	rol	r19
	rol	r0
	rol	r1
	rol	r2
	rol	r3
	cp	r0,r20
	cpc	r1,r21
	cpc	r2,r22
	cpc	r3,r23
	 brcs	L14B3
;	-----		branch on last line
	sub	r0,r20
	sbc	r1,r21
	sbc	r2,r22
	sbc	r3,r23
	rjmp	L14B3
;	-----------	jump on last line
L14C7:
	rol	r16
	rol	r17
	rol	r18
	rol	r19
	mov	r20,r0
	mov	r21,r1
	mov	r22,r2
	mov	r23,r3
	com	r16
	com	r17
	com	r18
	com	r19
	ret
;----------------------*
; pc=0x14D4(0x29A8)
;
L14D4:
	 rcall	L1534
	mov	r23,r0
	 rcall	L1534
	mov	r22,r0
L14D8:
	 rcall	L1534
	mov	r21,r0
L14DA:
	 rcall	L1534
	mov	r20,r0
	 rcall	L1534
	mov	r1,r0
	bst	r0,b1
	 rcall	L1534
	mov	r2,r0
	 rcall	L1534
	mov	r3,r0
	ret
;----------------------*
; pc=0x14E4(0x29C8)
;
L14E4:
	 rcall	L14DA
	sub	r16,r20
	ldi	r17,k00
	rjmp	L14EB
;	-----------	jump on last line
L14E8:
	 rcall	L14D8
	sub	r16,r20
	sbc	r17,r21
L14EB:
	ldi	r18,k00
	ldi	r19,k00
	rjmp	L14F3
;	-----------	jump on last line
	 rcall	L14D4
	sub	r16,r20
	sbc	r17,r21
	sbc	r18,r22
	sbc	r19,r23
L14F3:
	 brcs	L1510
;	-----		branch on last line
;	--------- this is skippy
	 sbrc	r1,b0
	 rjmp	L1513
;	--------- last may be skipped
; pc=0x14F6(0x29EC)
;
	 rcall	L1534
	mov	r20,r0
	 rcall	L1534
	add	r30,r16
	adc	r31,r17
	cp	r16,r20
	cpc	r17,r0
	ldi	r20,k00
	cpc	r18,r20
	cpc	r19,r20
	 brcc	L1510
;	-----		branch on last line
	 brtc	L150A
;	-----		branch on last line
L1502:
	lpm
	mov	r16,r0
	clr	r0
	mov	r30,r2
	mov	r31,r3
	sub	r30,r16
	sbc	r31,r0
	ijmp
;	-----------	jump on last line
L150A:
	add	r30,r16
	adc	r31,r17
L150C:
	 rcall	L1534
	mov	r2,r0
	 rcall	L1534
	mov	r3,r0
L1510:
	mov	r30,r2
	mov	r31,r3
	ijmp
;	-----------	jump on last line
L1513:
	 brne	L1516
;	-----		branch on last line
L1514:
	 brtc	L150C
;	-----		branch on last line
	rjmp	L1502
;	-----------	jump on last line
L1516:
	adiw	r30,k01
	 brts	L1519
;	-----		branch on last line
	adiw	r30,k01
L1519:
	ldi	r21,k00
	ldi	r22,k00
	ldi	r23,k00
	 rcall	L1534
	mov	r20,r0
	cpi	r20,kFB
	 brcs	L152D
;	-----		branch on last line
	 breq	L1510
;	-----		branch on last line
	cpi	r20,kFF
	 breq	L152B
;	-----		branch on last line
	cpi	r20,kFE
	 breq	L1529
;	-----		branch on last line
	 rcall	L1534
	mov	r23,r0
	 rcall	L1534
	mov	r22,r0
L1529:
	 rcall	L1534
	mov	r21,r0
L152B:
	 rcall	L1534
	mov	r20,r0
L152D:
	sub	r16,r20
	sbc	r17,r21
	sbc	r18,r22
	sbc	r19,r23
	 breq	L1514
;	-----		branch on last line
	 brcs	L1510
;	-----		branch on last line
	rjmp	L1516
;	-----------	jump on last line
L1534:
	lpm
	adiw	r30,k01
	ret
;----------------------*
; pc=0x1537(0x2A6E)
;
L1537:
	st	-Y,r15
L1538:
	st	-Y,r14
L1539:
	st	-Y,r13
	st	-Y,r12
	st	-Y,r11
	st	-Y,r10
L153D:
	st	-Y,r9
	st	-Y,r8
L153F:
	st	-Y,r7
L1540:
	st	-Y,r6
L1541:
	st	-Y,r5
	st	-Y,r4
L1543:
	st	-Y,r27
L1544:
	st	-Y,r26
	st	-Y,r25
	st	-Y,r24
	ret
;----------------------*
; pc=0x1548(0x2A90)
;
L1548:
	ldd	r15,Y+o0F
L1549:
	ldd	r14,Y+o0E
L154A:
	ldd	r13,Y+o0D
	ldd	r12,Y+o0C
	ldd	r11,Y+o0B
	ldd	r10,Y+o0A
L154E:
	ldd	r9,Y+o09
	ldd	r8,Y+o08
L1550:
	ldd	r7,Y+o07
L1551:
	ldd	r6,Y+o06
L1552:
	ldd	r5,Y+o05
	ldd	r4,Y+o04
L1554:
	ldd	r27,Y+o03
L1555:
	ldd	r26,Y+o02
	ldd	r25,Y+o01
	ldd	r24,Y+o00
	ldi	r31,k00
	in	r0,SREG
	cli
	add	r28,r30
	adc	r29,r31
	out	SREG,r0
	ret
;----------------------*
; pc=0x155F(0x2ABE)
;
	ldi	r17,k00
	jmp	L143C
;	-----------	jump on last line
L1562:
	sbiw	r28,k02
	mov	r20,r28
	mov	r21,r29
	subi	r20,kFE
	sbci	r21,kFF
	std	Y+o00,r20
	std	Y+o01,r21
	mov	r20,r28
	mov	r21,r29
	st	-Y,r21
	st	-Y,r20
	ldi	r22,k00
	ldi	r23,k00
	ldi	r20,k5F
	ldi	r21,k15
	 call	L15BD
	adiw	r28,k02
	ret
;----------------------*
; pc=0x1575(0x2AEA)
;
L1575:
	ldi	r18,k00
	st	X+,r18
	 rcall	L157A
	 brne	L1575
;	-----		branch on last line
	ret
;----------------------*
; pc=0x157A(0x2AF4)
;
L157A:
	subi	r16,k01
	sbci	r17,k00
	mov	r18,r16
	or	r18,r17
	ret
;----------------------*
; pc=0x157F(0x2AFE)
;
L157F:
	out	GICR,r19
	elpm
	subi	r30,kFF
	sbci	r31,kFF
	sbci	r19,kFF
	st	X+,r0
	 rcall	L157A
	 brne	L157F
;	-----		branch on last line
	ret
;----------------------*
; pc=0x1588(0x2B10)
;
L1588:
	ldi	r16,k22
	ldi	r17,k01
	mov	r4,r16
	mov	r5,r17
L158C:
	mov	r30,r4
	mov	r31,r5
	ldi	r19,k00
	out	GICR,r19
	elpm
	mov	r16,r0
	 rcall	L15B7
	mov	r17,r0
	mov	r30,r4
	mov	r31,r5
	adiw	r30,k02
	elpm
	mov	r26,r0
	 rcall	L15B7
	mov	r27,r0
	mov	r30,r4
	mov	r31,r5
	adiw	r30,k04
	elpm
	mov	r20,r0
	 rcall	L15B7
	mov	r21,r0
	 rcall	L15B7
	mov	r30,r20
	mov	r31,r21
	mov	r19,r0
	mov	r18,r20
	or	r18,r21
	or	r18,r0
	 breq	L15AC
;	-----		branch on last line
	 rcall	L157F
	rjmp	L15AD
;	-----------	jump on last line
L15AC:
	 rcall	L1575
L15AD:
	ldi	r16,k07
	add	r4,r16
	ldi	r16,k00
	adc	r5,r16
	mov	r20,r4
	mov	r21,r5
	cpi	r20,k30
	sbci	r21,k01
	 brcs	L158C
;	-----		branch on last line
	ret
;----------------------*
; pc=0x15B7(0x2B6E)
;
L15B7:
	adiw	r30,k01
	elpm
	ret
;----------------------*
; pc=0x15BA(0x2B74)
;
L15BA:
	nop
L15BB:
	sleep
	rjmp	L15BB
;	-----------	jump on last line
L15BD:
	 call	L1537
	sbiw	r28,k07
	std	Y+o04,r16
	std	Y+o05,r17
	std	Y+o06,r18
	std	Y+o00,r20
	std	Y+o01,r21
	std	Y+o02,r22
	std	Y+o03,r23
	ldd	r8,Y+o17
	ldd	r9,Y+o18
	clr	r12
	clr	r13
	rjmp	L15CD
;	-----------	jump on last line
L15CC:
	 rcall	L1689
L15CD:
	 rcall	L168D
	ldi	r16,k25
	cp	r0,r16
	 breq	L15D9
;	-----		branch on last line
	tst	r0
	 brne	L15CC
;	-----		branch on last line
	mov	r16,r12
	mov	r17,r13
	adiw	r28,k07
	ldi	r30,k12
	jmp	L1548
;	-----------	jump on last line
L15D9:
	ldi	r21,k00
	ldi	r20,k00
	elpm
	mov	r16,r0
	subi	r16,k68
	 breq	L15E3
;	-----		branch on last line
	subi	r16,k04
	 brne	L15EA
;	-----		branch on last line
	ldi	r20,k01
	rjmp	L15E4
;	-----------	jump on last line
L15E3:
	ldi	r21,k01
L15E4:
	mov	r16,r30
	mov	r17,r31
	subi	r16,kFF
	sbci	r17,kFF
	std	Y+o04,r16
	std	Y+o05,r17
L15EA:
	 rcall	L168D
	mov	r16,r0
	subi	r16,k58
	 brne	L15EF
;	-----		branch on last line
	rjmp	L1631

;	-----------	jump on last line
L15EF:
	subi	r16,k0B
	 breq	L15FA
;	-----		branch on last line
	dec	r16
	 breq	L1623
;	-----		branch on last line
	subi	r16,k0B
	 breq	L160B
;	-----		branch on last line
	subi	r16,k04
	 breq	L15FE
;	-----		branch on last line
	subi	r16,k05
	 breq	L1631
;	-----		branch on last line
	rjmp	L15CC
;	-----------	jump on last line
L15FA:
	 rcall	L16AC
	ld	r10,Z
	 rcall	L16A6
	rjmp	L15CC
;	-----------	jump on last line
L15FE:
	 rcall	L16AC
	ld	r24,Z
	ldd	r25,Z+o01
	 rcall	L16A6
L1602:
	mov	r30,r24
	mov	r31,r25
	ld	r10,Z+
	mov	r24,r30
	mov	r25,r31
	tst	r10
	 breq	L15CD
;	-----		branch on last line
	 rcall	L1689
	rjmp	L1602
;	-----------	jump on last line
L160B:
	ldi	r16,k08
	mov	r14,r16
	tst	r21
	 brne	L1611
;	-----		branch on last line
	tst	r20
	 brne	L161E
;	-----		branch on last line
L1611:
	ldi	r24,k00
	ldi	r25,k80
L1613:
	ldi	r26,k00
	ldi	r27,k00
	tst	r21
	 breq	L163F
;	-----		branch on last line
	ldi	r16,k64
	cp	r10,r16
	 rcall	L16AC
	ld	r4,Z
	ldd	r5,Z+o01
	 brne	L164C
;	-----		branch on last line
	rjmp	L164C
;	-----------	jump on last line
L161E:
	ldi	r24,k00
	ldi	r25,k00
	ldi	r26,k00
	ldi	r27,k40
	rjmp	L1641
;	-----------	jump on last line
L1623:
	ldi	r16,k0A
	mov	r14,r16
	tst	r21
	 brne	L1629
;	-----		branch on last line
	tst	r20
	 brne	L162C
;	-----		branch on last line
L1629:
	ldi	r24,k10
	ldi	r25,k27
	rjmp	L1613
;	-----------	jump on last line
L162C:
	ldi	r24,k00
	ldi	r25,kCA
	ldi	r26,k9A
	ldi	r27,k3B
	rjmp	L1641
;	-----------	jump on last line
L1631:
	ldi	r16,k10
	mov	r14,r16
	tst	r21
	 brne	L1637
;	-----		branch on last line
	tst	r20
	 brne	L163A
;	-----		branch on last line
L1637:
	ldi	r24,k00
	ldi	r25,k10
	rjmp	L1613
;	-----------	jump on last line
L163A:
	ldi	r24,k00
	ldi	r25,k00
	ldi	r26,k00
	ldi	r27,k10
	rjmp	L1641
;	-----------	jump on last line
L163F:
	tst	r20
	 breq	L1649
;	-----		branch on last line
L1641:
	 rcall	L16AC
	ld	r4,Z
	ldd	r5,Z+o01

	ldd	r6,Z+o02
	ldd	r7,Z+o03
	 rcall	L16C2
	subi	r16,kFC
	rjmp	L1650
;	-----------	jump on last line
L1649:
	 rcall	L16AC
	ld	r4,Z
	ldd	r5,Z+o01
L164C:
	clr	r6
	clr	r7
	 rcall	L16C2
	subi	r16,kFE
L1650:
	 rcall	L16A8
	ldi	r16,k64
	cp	r10,r16
	 brne	L1662
;	-----		branch on last line
	tst	r7
	 brpl	L1662
;	-----		branch on last line
	com	r5
	com	r6
	com	r7
	sbci	r16,k64
	neg	r4
	sbc	r5,r16
	sbc	r6,r16
	sbc	r7,r16
	ldd	r18,Y+o02
	ldd	r19,Y+o03
	ldi	r16,k2D
	 rcall	L16B0
L1662:
	cpi	r24,k02
	ldi	r16,k00
	cpc	r25,r16
	cpc	r26,r16
	cpc	r27,r16
	 brcs	L167F
;	-----		branch on last line
	cp	r4,r24
	cpc	r5,r25
	cpc	r6,r26
	cpc	r7,r27
	 brcc	L167F
;	-----		branch on last line
	 rcall	L1697
	rjmp	L1662
;	-----------	jump on last line
L166F:
	subi	r20,kF9
L1670:
	ldd	r18,Y+o02
	ldd	r19,Y+o03
	mov	r16,r20
	 rcall	L16B0
	 rcall	L16B8
	mov	r4,r20
	mov	r5,r21
	mov	r6,r22
	mov	r7,r23
	 rcall	L1697
	or	r16,r17
	or	r16,r18
	or	r16,r19
	 brne	L167F
;	-----		branch on last line
	rjmp	L15CD
;	-----------	jump on last line
L167F:
	 rcall	L16B8
	mov	r20,r16
	subi	r20,kD0
	cpi	r20,k3A
	 brcs	L1670
;	-----		branch on last line
	ldi	r16,k78
	cp	r10,r16
	 brne	L166F
;	-----		branch on last line
	subi	r20,kD9
	rjmp	L1670
;	-----------	jump on last line
L1689:
	ldd	r18,Y+o02
	ldd	r19,Y+o03
	mov	r16,r10
	rjmp	L16B0
;	-----------	jump on last line
L168D:
	ldd	r30,Y+o04
	ldd	r31,Y+o05
	ldd	r19,Y+o06
	out	GICR,r19
	elpm
	mov	r10,r0
	adiw	r30,k01
	std	Y+o04,r30
	std	Y+o05,r31
	ret
;----------------------*
; pc=0x1697(0x2D2E)
;
L1697:
	mov	r16,r24
	mov	r17,r25
	mov	r18,r26
	mov	r19,r27
	mov	r20,r14
	ldi	r21,k00
	ldi	r22,k00
	ldi	r23,k00
	 call	L14AE
	mov	r24,r16
	mov	r25,r17
	mov	r26,r18
	mov	r27,r19
	ret
;----------------------*
; pc=0x16A6(0x2D4C)
;
L16A6:
	 rcall	L16C2
	subi	r16,kFE
L16A8:
	sbci	r17,kFF
	st	Z,r16
	std	Z+o01,r17
	ret
;----------------------*
; pc=0x16AC(0x2D58)
;
L16AC:
	 rcall	L16C2
	mov	r30,r16
	mov	r31,r17
	ret
;----------------------*
; pc=0x16B0(0x2D60)
;
L16B0:
	ldd	r30,Y+o00
	ldd	r31,Y+o01
	 icall
	ldi	r16,k01
	add	r12,r16
	ldi	r16,k00
	adc	r13,r16
	ret
;----------------------*
; pc=0x16B8(0x2D70)
;
L16B8:
	mov	r16,r4
	mov	r17,r5
	mov	r18,r6
	mov	r19,r7
	mov	r20,r24
	mov	r21,r25
	mov	r22,r26
	mov	r23,r27
	jmp	L14AE
;	-----------	jump on last line
L16C2:
	mov	r30,r8
	mov	r31,r9
	ld	r16,Z
	ldd	r17,Z+o01
	ret
;----------------------*
; pc=0x16C7(0x2D8E)
;
; begin of const block at 0x16C7(0x2D8E)
; Init DATA
C2D8E:
	.db	0x01,0x17,0x01,0xCB,0x0C,0x01,0x00,0x00	; "........"
	.db	0x00,0xFF                              	; ".."
; end of const block at 0x16CB(0x2D97)
;

;
; last flash byte address = 0x7FFF
; last flash word address = 0x3FFF
;---------------------------------------
	.dseg
	.org	0x0060
;
D0060:
	.byte	1
D0061:
	.byte	1
D0062:
	.byte	11
D006D:
	.byte	1
D006E:

	.byte	5
D0073:
	.byte	1
D0074:
	.byte	1
D0075:
	.byte	1
D0076:
	.byte	1
D0077:
	.byte	1
D0078:
	.byte	1
D0079:
	.byte	1
D007A:
	.byte	1
D007B:
	.byte	1
D007C:
	.byte	1
D007D:
	.byte	1
D007E:
	.byte	1
D007F:
	.byte	1
D0080:
	.byte	266
D018A:
	.byte	1
D018B:
	.byte	1
D018C:
	.byte	1
D018D:
	.byte	1
D018E:
	.byte	31
D01AD:
	.byte	1
D01AE:
	.byte	129
D022F:
	.byte	115
D02A2:
	.byte	1
D02A3:
	.byte	5
D02A8:
	.byte	3
D02AB:
	.byte	1
D02AC:
	.byte	189
D0369:
	.byte	1
D036A:
	.byte	17
D037B:
	.byte	1
D037C:
;
; last lds/sts data byte at 0x037C
;---------------------------------------
;<eof>
