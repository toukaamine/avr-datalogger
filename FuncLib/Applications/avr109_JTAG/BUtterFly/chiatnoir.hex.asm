; reassembly of "chiatnoir.hex"
; created by ReAVR V3.2.0
; at 2007/04/22 - 18:43:11
; for Atmel AVR assembler
;---------------------------------------
; AVR_TYPE=<unknown>
; FLASH_SIZE=16KB
; SRAM_START=0x100
;---------------------------------------
; ""
; "Unccomment to select which"
; "system to assemble for:"
; ""
; ".include "m169def.inc""
; ""
; .include "m163def.inc"
;---------------------------------------
; const blocks:
; 0x0048..0x004F ;OCD ID
; 0x0050..0x009D ;commands9
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
.equ	k39	= 0x39	; '9'
.equ	k3A	= 0x3A	; ':'
.equ	k3B	= 0x3B	; ';'
.equ	k3E	= 0x3E	; '>'
.equ	k3F	= 0x3F	; '?'
.equ	k40	= 0x40	; '@'
.equ	k41	= 0x41	; 'A'
.equ	k42	= 0x42	; 'B'
.equ	k43	= 0x43	; 'C'
.equ	k45	= 0x45	; 'E'
.equ	k46	= 0x46	; 'F'
.equ	k47	= 0x47	; 'G'
.equ	k48	= 0x48	; 'H'
.equ	k49	= 0x49	; 'I'
.equ	k4A	= 0x4A	; 'J'
.equ	k4C	= 0x4C	; 'L'
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
.equ	k63	= 0x63	; 'c'
.equ	k64	= 0x64	; 'd'
.equ	k65	= 0x65	; 'e'
.equ	k66	= 0x66	; 'f'
.equ	k67	= 0x67	; 'g'
.equ	k68	= 0x68	; 'h'
.equ	k69	= 0x69	; 'i'
.equ	k6B	= 0x6B	; 'k'
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
.equ	k79	= 0x79	; 'y'
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
.equ	ADCSR	= 0x06
.equ	ADMUX	= 0x07
.equ	UBBR	= 0x09
.equ	UCSRA	= 0x0A
.equ	UCSRB	= 0x0B
.equ	UDR	= 0x0C
.equ	VTARGPIN	= 0x10
.equ	VTARGDDR	= 0x11
.equ	VTARGPORT	= 0x12
.equ	HWREVPIN	= 0x13
.equ	HWREVDDR	= 0x14
.equ	HWREVPORT	= 0x15
.equ	JTAGPIN	= 0x16
.equ	JTAGDDR	= 0x17
.equ	JTAGPORT	= 0x18
.equ	DDRA	= 0x1A
.equ	PORTA	= 0x1B
.equ	EECR	= 0x1C
.equ	EEDR	= 0x1D
.equ	EEARL	= 0x1E
.equ	EEARH	= 0x1F
.equ	UBRRHI	= 0x20
.equ	TCCR0	= 0x33
.equ	SPMCR	= 0x37
.equ	TIMSK	= 0x39
.equ	GIMSK	= 0x3B
.equ	SPL	= 0x3D
.equ	SPH	= 0x3E
.equ	SREG	= 0x3F
;		; memory mapped io (if used)
.equ	p60	= 0x60
.equ	p61	= 0x61
.equ	p62	= 0x62
.equ	p6D	= 0x6D
.equ	p6E	= 0x6E
.equ	p73	= 0x73
.equ	p74	= 0x74
.equ	p75	= 0x75
.equ	p76	= 0x76
.equ	p77	= 0x77
.equ	p78	= 0x78
.equ	p79	= 0x79
.equ	p7A	= 0x7A
.equ	p7B	= 0x7B
.equ	p7C	= 0x7C
.equ	p7D	= 0x7D
.equ	p7E	= 0x7E
.equ	p7F	= 0x7F
.equ	p80	= 0x80
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
	out	ADCSR,r16
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
	sbi	ADCSR,b6
	ret
;----------------------*
; pc=0xA5(0x14A)
;
L00A5:
;	--------- this is skippy
	 sbis	VTARGPIN,b3
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
	in	r22,GIMSK
	ldi	r16,k00
	out	GIMSK,r16
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
	sts	p6D,r16	; mem mapped io
	ldi	r30,k69
	ldi	r31,k00
	st	Z,r16
	std	Z+o01,r16
L00DA:
	out	GIMSK,r22
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
	in	r25,GIMSK
	ldi	r16,k00
	out	GIMSK,r16
	lds	r16,p6E	; mem mapped io
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
	out	GIMSK,r25
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
	sts	p6E,r16	; mem mapped io
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
	out	JTAGDDR,r16
	cbi	JTAGPORT,b4
	sbi	JTAGPORT,b4
	ldi	r16,kF0
	out	HWREVDDR,r16
	ldi	r16,k00
	out	HWREVPORT,r16
	ldi	r16,kB0
	out	VTARGDDR,r16
	ldi	r16,k00
	out	VTARGPORT,r16
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
	lds	r17,p74	; mem mapped io
	in	r16,VTARGPIN
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
	 sbic	VTARGPIN,b3
	 rjmp	L0170
;	--------- last may be skipped
; pc=0x164(0x2C8)
;
	ldi	r17,k00
	ldi	r16,k08
	 call	L07D1
	 call	L0841
	ldi	r16,k01
	sts	p76,r16	; mem mapped io
	 rcall	L0214
	 breq	L0170
;	-----		branch on last line
	 rcall	L01F5
L0170:
	in	r16,VTARGPIN
	andi	r16,k08
	sts	p74,r16	; mem mapped io
	lds	r16,p80	; mem mapped io
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
	lds	r17,p73	; mem mapped io
	cp	r16,r17
	 breq	L018B
;	-----		branch on last line
	sts	p73,r16	; mem mapped io
	ldi	r16,k48
	 rcall	L01FC
	lds	r16,p73	; mem mapped io
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
	lds	r17,p60	; mem mapped io
	cp	r16,r17
	 breq	L019D
;	-----		branch on last line
	sts	p60,r16	; mem mapped io
	ldi	r16,k49
	 rcall	L01FC
	lds	r16,p60	; mem mapped io
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
	lds	r16,p7F	; mem mapped io
	andi	r16,k06
	cpi	r16,k04
	 brne	L01B6
;	-----		branch on last line
	ldi	r16,k00
	sts	p80,r16	; mem mapped io
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
	lds	r16,p6E	; mem mapped io
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
	sts	p7F,r16	; mem mapped io
	ret
;----------------------*
; pc=0x21D(0x43A)
;
L021D:
	sts	p73,r16	; mem mapped io
	 call	L0A97
	jmp	L0D3B
;	-----------	jump on last line
L0223:
	ldi	r16,k00
	sts	p80,r16	; mem mapped io
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
	lds	r16,p80	; mem mapped io
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
	lds	r16,p75	; mem mapped io
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
	lds	r16,p79	; mem mapped io
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
	sts	p75,r16	; mem mapped io
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
	sts	p75,r16	; mem mapped io
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
	sts	p61,r24	; mem mapped io
	 rcall	L01FB
	ldi	r30,kA0
	ldi	r31,k0F
L054A:
	sbiw	r30,k01
	mov	r16,r30
	or	r16,r31
	 brne	L054A
;	-----		branch on last line
	lds	r16,p61	; mem mapped io
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
	sts	p62,r24	; mem mapped io
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
	sts	p79,r24	; mem mapped io
	rjmp	L0558
;	-----------	jump on last line
	sts	p7A,r24	; mem mapped io
	rjmp	L0558
;	-----------	jump on last line
	sts	p77,r24	; mem mapped io
	rjmp	L0558
;	-----------	jump on last line
	sts	p78,r24	; mem mapped io
	rjmp	L0558
;	-----------	jump on last line
	sts	p7C,r24	; mem mapped io
	rjmp	L0558
;	-----------	jump on last line
	sts	p7B,r24	; mem mapped io
	rjmp	L0558
;	-----------	jump on last line
	sts	p7D,r24	; mem mapped io
	rjmp	L0558
;	-----------	jump on last line
	sts	p7E,r24	; mem mapped io
	rjmp	L0558
;	-----------	jump on last line
	tst	r24
	 breq	L05CD
;	-----		branch on last line
	sbi	JTAGDDR,b4
	cbi	JTAGPORT,b4
	rjmp	L0558
;	-----------	jump on last line
L05CD:
	cbi	JTAGDDR,b4
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
	lds	r16,p61	; mem mapped io
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
	ldi	r16,k7F
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
	lds	r16,p80	; mem mapped io
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
	sts	p80,r16	; mem mapped io
	rjmp	L0679
;	-----------	jump on last line
L0673:
	lds	r16,p7F	; mem mapped io
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
	sts	p80,r16	; mem mapped io
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
	lds	r16,p62	; mem mapped io
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
	sts	p80,r16	; mem mapped io
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
	in	r18,JTAGPIN
	andi	r18,k40
	ldi	r21,k04
L07AF:
	ldi	r19,k00
	cp	r16,r19
	cpc	r17,r19
	 breq	L07C6
;	-----		branch on last line
	ldi	r20,k20
	in	r19,JTAGPORT
	eor	r19,r20
	out	JTAGPORT,r19
	in	r19,JTAGPIN
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
	lds	r16,p77	; mem mapped io
	lds	r6,p78	; mem mapped io
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
	lds	r16,p77	; mem mapped io
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
	lds	r16,p78	; mem mapped io
	cp	r4,r16
	 brcs	L07FE
;	-----		branch on last line
	cbi	JTAGPORT,b3
	 rcall	L083F
	 rcall	L083D
	 rcall	L0A5F
	clr	r4
	rjmp	L0812
;	-----------	jump on last line
L080B:
	cbi	JTAGPORT,b5
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
	sbi	JTAGPORT,b5
	rjmp	L080C
;	-----------	jump on last line
L081B:
;	--------- this is skippy
	 sbrs	r16,b0
	 rjmp	L081F
;	--------- last may be skipped
; pc=0x81D(0x103A)
;
	sbi	JTAGPORT,b5
	rjmp	L0820
;	-----------	jump on last line
L081F:
	cbi	JTAGPORT,b5
L0820:
	 rcall	L083F
	 rcall	L0A5F
	clr	r4
	rjmp	L0827
;	-----------	jump on last line
L0824:
	 rcall	L083D
	sbi	JTAGPORT,b1
	inc	r4
L0827:
	cp	r4,r5
	 brcs	L0824
;	-----		branch on last line
	 rcall	L0A5F
	sbi	JTAGPORT,b3
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
	cbi	JTAGPORT,b1
	rjmp	L0A5F
;	-----------	jump on last line
L083F:
	sbi	JTAGPORT,b1
	rjmp	L0A5F
;	-----------	jump on last line
L0841:
	sbi	JTAGPORT,b1
	cbi	JTAGPORT,b3
	 rcall	L0A5F
	 rcall	L0A5F
	 rcall	L0A5F
	 rcall	L0A5F
	 rcall	L0A5F
	 rcall	L083D
	 rcall	L083F
	sbi	JTAGPORT,b3
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
	cbi	JTAGPORT,b3
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
	cbi	JTAGPORT,b5
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
	 sbis	JTAGPIN,b6
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
	 sbis	JTAGPIN,b6
	 rjmp	L0877
;	--------- last may be skipped
; pc=0x89F(0x113E)
;
L089F:
	sbi	JTAGPORT,b5
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
	 sbis	JTAGPIN,b6
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
	 sbis	JTAGPIN,b6
	 rjmp	L08B4
;	--------- last may be skipped
; pc=0x8B0(0x1160)
;
L08B0:
	sbi	JTAGPORT,b5
	rjmp	L08B5
;	-----------	jump on last line
L08B2:
	 rcall	L08F7
	 brne	L08B0
;	-----		branch on last line
L08B4:
	cbi	JTAGPORT,b5
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
	sbi	JTAGPORT,b1
L08C7:
	 rcall	L0A5F
	sbi	JTAGPORT,b3
	ldi	r30,k11
	jmp	L1549
;	-----------	jump on last line
L08CC:
	lsl	r24
	lsl	r25
L08CE:
	lds	r16,p7A	; mem mapped io
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
	lds	r16,p7A	; mem mapped io
	lds	r17,p79	; mem mapped io
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
	lds	r6,p79	; mem mapped io
	clr	r7
	add	r6,r16
	adc	r7,r17
	ret
;----------------------*
; pc=0x8E9(0x11D2)
;
L08E9:
	lds	r16,p79	; mem mapped io
L08EB:
	lds	r17,p7A	; mem mapped io
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
	cbi	JTAGPORT,b3
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
	cbi	JTAGPORT,b5
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
	 sbis	JTAGPIN,b6
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
	sbi	JTAGPORT,b5
	rjmp	L0938
;	-----------	jump on last line
L0964:
	 breq	L096D
;	-----		branch on last line
;	--------- this is skippy
	 sbis	JTAGPIN,b6
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
	sbi	JTAGPORT,b5
	rjmp	L0974
;	-----------	jump on last line
L0973:
	cbi	JTAGPORT,b5
L0974:
	sbi	JTAGPORT,b1
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
	sbi	JTAGPORT,b1
L0982:
	 rcall	L0A76
	sbi	JTAGPORT,b3
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
	cbi	JTAGPORT,b1
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
	lds	r8,p79	; mem mapped io
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
	 sbis	JTAGPIN,b6
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
	 sbis	JTAGPIN,b6
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
	sbi	JTAGPORT,b1
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
	sbi	JTAGPORT,b1
L09E9:
	 rcall	L0A76
	ldi	r16,k00
	sts	p80,r16	; mem mapped io
	ldi	r30,k0A
	jmp	L154E
;	-----------	jump on last line
L09F0:
	cbi	JTAGPORT,b1
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
	cbi	JTAGPORT,b3
	mov	r16,r18
	mov	r17,r19
	 rcall	L08D6
	add	r26,r16
	adc	r27,r17
	clr	r4
	inc	r4
	ld	r5,X
	lds	r16,p79	; mem mapped io
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
	cbi	JTAGPORT,b5
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
	sbi	JTAGPORT,b5
	rjmp	L0A28
;	-----------	jump on last line
L0A47:
	ld	r16,X
	and	r16,r4
	 breq	L0A4C
;	-----		branch on last line
	sbi	JTAGPORT,b5
	rjmp	L0A4D
;	-----------	jump on last line
L0A4C:
	cbi	JTAGPORT,b5
L0A4D:
	sbi	JTAGPORT,b1
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
	sbi	JTAGPORT,b1
L0A57:
	 rcall	L0A76
	sbi	JTAGPORT,b3
	ldi	r16,k00
	sts	D018B,r16
	ldi	r30,k0A
	jmp	L154E
;	-----------	jump on last line
L0A5F:
	lds	r16,D018A
	tst	r16
	sbi	JTAGPORT,b7
	 brne	L0A66
;	-----		branch on last line
	cbi	JTAGPORT,b7
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
	cbi	JTAGPORT,b7
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
	sbi	JTAGPORT,b7
	cbi	JTAGPORT,b7
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
	lds	r16,p7D	; mem mapped io
	std	Y+o01,r16
	lds	r16,p7E	; mem mapped io
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
	lds	r16,p7C	; mem mapped io
	std	Y+o01,r16
	lds	r16,p7B	; mem mapped io
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
	lds	r16,p6E	; mem mapped io
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
	lds	r16,p80	; mem mapped io
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
	in	r24,VTARGPIN
	andi	r24,k08
	 rcall	L0B10
	 rcall	L0B2E
	 rcall	L0B1E
	 rcall	L0B18
	 rcall	L0D08
	in	r16,VTARGPIN
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
	 sbic	VTARGPIN,b3
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
	lds	r16,p76	; mem mapped io
	cpi	r16,k01
	 brne	L0DCA
;	-----		branch on last line
	 rcall	L0E79
	 brne	L0DCA
;	-----		branch on last line
	ldi	r16,k00
	sts	p76,r16	; mem mapped io
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
	 sbic	VTARGPIN,b3
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
	 sbic	VTARGPIN,b3
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
	in	r16,HWREVPIN
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
	lds	r16,p6E	; mem mapped io
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
	out	UBRRHI,r17
	out	UBBR,r16
	ldi	r16,k98
	out	UCSRA,r16
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
	cbi	UCSRA,b5
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
	sbi	UCSRA,b5
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
	out	GIMSK,r16
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
	out	GIMSK,r19
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
	out	GIMSK,r19
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
	out	GIMSK,r19
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
	.dw	0xFFFF	; pc=0x16CC(0x2D98)
	.dw	0xFFFF	; pc=0x16CD(0x2D9A)
	.dw	0xFFFF	; pc=0x16CE(0x2D9C)
	.dw	0xFFFF	; pc=0x16CF(0x2D9E)
	.dw	0xFFFF	; pc=0x16D0(0x2DA0)
	.dw	0xFFFF	; pc=0x16D1(0x2DA2)
	.dw	0xFFFF	; pc=0x16D2(0x2DA4)
	.dw	0xFFFF	; pc=0x16D3(0x2DA6)
	.dw	0xFFFF	; pc=0x16D4(0x2DA8)
	.dw	0xFFFF	; pc=0x16D5(0x2DAA)
	.dw	0xFFFF	; pc=0x16D6(0x2DAC)
	.dw	0xFFFF	; pc=0x16D7(0x2DAE)
	.dw	0xFFFF	; pc=0x16D8(0x2DB0)
	.dw	0xFFFF	; pc=0x16D9(0x2DB2)
	.dw	0xFFFF	; pc=0x16DA(0x2DB4)
	.dw	0xFFFF	; pc=0x16DB(0x2DB6)
	.dw	0xFFFF	; pc=0x16DC(0x2DB8)
	.dw	0xFFFF	; pc=0x16DD(0x2DBA)
	.dw	0xFFFF	; pc=0x16DE(0x2DBC)
	.dw	0xFFFF	; pc=0x16DF(0x2DBE)
	.dw	0xFFFF	; pc=0x16E0(0x2DC0)
	.dw	0xFFFF	; pc=0x16E1(0x2DC2)
	.dw	0xFFFF	; pc=0x16E2(0x2DC4)
	.dw	0xFFFF	; pc=0x16E3(0x2DC6)
	.dw	0xFFFF	; pc=0x16E4(0x2DC8)
	.dw	0xFFFF	; pc=0x16E5(0x2DCA)
	.dw	0xFFFF	; pc=0x16E6(0x2DCC)
	.dw	0xFFFF	; pc=0x16E7(0x2DCE)
	.dw	0xFFFF	; pc=0x16E8(0x2DD0)
	.dw	0xFFFF	; pc=0x16E9(0x2DD2)
	.dw	0xFFFF	; pc=0x16EA(0x2DD4)
	.dw	0xFFFF	; pc=0x16EB(0x2DD6)
	.dw	0xFFFF	; pc=0x16EC(0x2DD8)
	.dw	0xFFFF	; pc=0x16ED(0x2DDA)
	.dw	0xFFFF	; pc=0x16EE(0x2DDC)
	.dw	0xFFFF	; pc=0x16EF(0x2DDE)
	.dw	0xFFFF	; pc=0x16F0(0x2DE0)
	.dw	0xFFFF	; pc=0x16F1(0x2DE2)
	.dw	0xFFFF	; pc=0x16F2(0x2DE4)
	.dw	0xFFFF	; pc=0x16F3(0x2DE6)
	.dw	0xFFFF	; pc=0x16F4(0x2DE8)
	.dw	0xFFFF	; pc=0x16F5(0x2DEA)
	.dw	0xFFFF	; pc=0x16F6(0x2DEC)
	.dw	0xFFFF	; pc=0x16F7(0x2DEE)
	.dw	0xFFFF	; pc=0x16F8(0x2DF0)
	.dw	0xFFFF	; pc=0x16F9(0x2DF2)
	.dw	0xFFFF	; pc=0x16FA(0x2DF4)
	.dw	0xFFFF	; pc=0x16FB(0x2DF6)
	.dw	0xFFFF	; pc=0x16FC(0x2DF8)
	.dw	0xFFFF	; pc=0x16FD(0x2DFA)
	.dw	0xFFFF	; pc=0x16FE(0x2DFC)
	.dw	0xFFFF	; pc=0x16FF(0x2DFE)
	.dw	0xFFFF	; pc=0x1700(0x2E00)
	.dw	0xFFFF	; pc=0x1701(0x2E02)
	.dw	0xFFFF	; pc=0x1702(0x2E04)
	.dw	0xFFFF	; pc=0x1703(0x2E06)
	.dw	0xFFFF	; pc=0x1704(0x2E08)
	.dw	0xFFFF	; pc=0x1705(0x2E0A)
	.dw	0xFFFF	; pc=0x1706(0x2E0C)
	.dw	0xFFFF	; pc=0x1707(0x2E0E)
	.dw	0xFFFF	; pc=0x1708(0x2E10)
	.dw	0xFFFF	; pc=0x1709(0x2E12)
	.dw	0xFFFF	; pc=0x170A(0x2E14)
	.dw	0xFFFF	; pc=0x170B(0x2E16)
	.dw	0xFFFF	; pc=0x170C(0x2E18)
	.dw	0xFFFF	; pc=0x170D(0x2E1A)
	.dw	0xFFFF	; pc=0x170E(0x2E1C)
	.dw	0xFFFF	; pc=0x170F(0x2E1E)
	.dw	0xFFFF	; pc=0x1710(0x2E20)
	.dw	0xFFFF	; pc=0x1711(0x2E22)
	.dw	0xFFFF	; pc=0x1712(0x2E24)
	.dw	0xFFFF	; pc=0x1713(0x2E26)
	.dw	0xFFFF	; pc=0x1714(0x2E28)
	.dw	0xFFFF	; pc=0x1715(0x2E2A)
	.dw	0xFFFF	; pc=0x1716(0x2E2C)
	.dw	0xFFFF	; pc=0x1717(0x2E2E)
	.dw	0xFFFF	; pc=0x1718(0x2E30)
	.dw	0xFFFF	; pc=0x1719(0x2E32)
	.dw	0xFFFF	; pc=0x171A(0x2E34)
	.dw	0xFFFF	; pc=0x171B(0x2E36)
	.dw	0xFFFF	; pc=0x171C(0x2E38)
	.dw	0xFFFF	; pc=0x171D(0x2E3A)
	.dw	0xFFFF	; pc=0x171E(0x2E3C)
	.dw	0xFFFF	; pc=0x171F(0x2E3E)
	.dw	0xFFFF	; pc=0x1720(0x2E40)
	.dw	0xFFFF	; pc=0x1721(0x2E42)
	.dw	0xFFFF	; pc=0x1722(0x2E44)
	.dw	0xFFFF	; pc=0x1723(0x2E46)
	.dw	0xFFFF	; pc=0x1724(0x2E48)
	.dw	0xFFFF	; pc=0x1725(0x2E4A)
	.dw	0xFFFF	; pc=0x1726(0x2E4C)
	.dw	0xFFFF	; pc=0x1727(0x2E4E)
	.dw	0xFFFF	; pc=0x1728(0x2E50)
	.dw	0xFFFF	; pc=0x1729(0x2E52)
	.dw	0xFFFF	; pc=0x172A(0x2E54)
	.dw	0xFFFF	; pc=0x172B(0x2E56)
	.dw	0xFFFF	; pc=0x172C(0x2E58)
	.dw	0xFFFF	; pc=0x172D(0x2E5A)
	.dw	0xFFFF	; pc=0x172E(0x2E5C)
	.dw	0xFFFF	; pc=0x172F(0x2E5E)
	.dw	0xFFFF	; pc=0x1730(0x2E60)
	.dw	0xFFFF	; pc=0x1731(0x2E62)
	.dw	0xFFFF	; pc=0x1732(0x2E64)
	.dw	0xFFFF	; pc=0x1733(0x2E66)
	.dw	0xFFFF	; pc=0x1734(0x2E68)
	.dw	0xFFFF	; pc=0x1735(0x2E6A)
	.dw	0xFFFF	; pc=0x1736(0x2E6C)
	.dw	0xFFFF	; pc=0x1737(0x2E6E)
	.dw	0xFFFF	; pc=0x1738(0x2E70)
	.dw	0xFFFF	; pc=0x1739(0x2E72)
	.dw	0xFFFF	; pc=0x173A(0x2E74)
	.dw	0xFFFF	; pc=0x173B(0x2E76)
	.dw	0xFFFF	; pc=0x173C(0x2E78)
	.dw	0xFFFF	; pc=0x173D(0x2E7A)
	.dw	0xFFFF	; pc=0x173E(0x2E7C)
	.dw	0xFFFF	; pc=0x173F(0x2E7E)
	.dw	0xFFFF	; pc=0x1740(0x2E80)
	.dw	0xFFFF	; pc=0x1741(0x2E82)
	.dw	0xFFFF	; pc=0x1742(0x2E84)
	.dw	0xFFFF	; pc=0x1743(0x2E86)
	.dw	0xFFFF	; pc=0x1744(0x2E88)
	.dw	0xFFFF	; pc=0x1745(0x2E8A)
	.dw	0xFFFF	; pc=0x1746(0x2E8C)
	.dw	0xFFFF	; pc=0x1747(0x2E8E)
	.dw	0xFFFF	; pc=0x1748(0x2E90)
	.dw	0xFFFF	; pc=0x1749(0x2E92)
	.dw	0xFFFF	; pc=0x174A(0x2E94)
	.dw	0xFFFF	; pc=0x174B(0x2E96)
	.dw	0xFFFF	; pc=0x174C(0x2E98)
	.dw	0xFFFF	; pc=0x174D(0x2E9A)
	.dw	0xFFFF	; pc=0x174E(0x2E9C)
	.dw	0xFFFF	; pc=0x174F(0x2E9E)
	.dw	0xFFFF	; pc=0x1750(0x2EA0)
	.dw	0xFFFF	; pc=0x1751(0x2EA2)
	.dw	0xFFFF	; pc=0x1752(0x2EA4)
	.dw	0xFFFF	; pc=0x1753(0x2EA6)
	.dw	0xFFFF	; pc=0x1754(0x2EA8)
	.dw	0xFFFF	; pc=0x1755(0x2EAA)
	.dw	0xFFFF	; pc=0x1756(0x2EAC)
	.dw	0xFFFF	; pc=0x1757(0x2EAE)
	.dw	0xFFFF	; pc=0x1758(0x2EB0)
	.dw	0xFFFF	; pc=0x1759(0x2EB2)
	.dw	0xFFFF	; pc=0x175A(0x2EB4)
	.dw	0xFFFF	; pc=0x175B(0x2EB6)
	.dw	0xFFFF	; pc=0x175C(0x2EB8)
	.dw	0xFFFF	; pc=0x175D(0x2EBA)
	.dw	0xFFFF	; pc=0x175E(0x2EBC)
	.dw	0xFFFF	; pc=0x175F(0x2EBE)
	.dw	0xFFFF	; pc=0x1760(0x2EC0)
	.dw	0xFFFF	; pc=0x1761(0x2EC2)
	.dw	0xFFFF	; pc=0x1762(0x2EC4)
	.dw	0xFFFF	; pc=0x1763(0x2EC6)
	.dw	0xFFFF	; pc=0x1764(0x2EC8)
	.dw	0xFFFF	; pc=0x1765(0x2ECA)
	.dw	0xFFFF	; pc=0x1766(0x2ECC)
	.dw	0xFFFF	; pc=0x1767(0x2ECE)
	.dw	0xFFFF	; pc=0x1768(0x2ED0)
	.dw	0xFFFF	; pc=0x1769(0x2ED2)
	.dw	0xFFFF	; pc=0x176A(0x2ED4)
	.dw	0xFFFF	; pc=0x176B(0x2ED6)
	.dw	0xFFFF	; pc=0x176C(0x2ED8)
	.dw	0xFFFF	; pc=0x176D(0x2EDA)
	.dw	0xFFFF	; pc=0x176E(0x2EDC)
	.dw	0xFFFF	; pc=0x176F(0x2EDE)
	.dw	0xFFFF	; pc=0x1770(0x2EE0)
	.dw	0xFFFF	; pc=0x1771(0x2EE2)
	.dw	0xFFFF	; pc=0x1772(0x2EE4)
	.dw	0xFFFF	; pc=0x1773(0x2EE6)
	.dw	0xFFFF	; pc=0x1774(0x2EE8)
	.dw	0xFFFF	; pc=0x1775(0x2EEA)
	.dw	0xFFFF	; pc=0x1776(0x2EEC)
	.dw	0xFFFF	; pc=0x1777(0x2EEE)
	.dw	0xFFFF	; pc=0x1778(0x2EF0)
	.dw	0xFFFF	; pc=0x1779(0x2EF2)
	.dw	0xFFFF	; pc=0x177A(0x2EF4)
	.dw	0xFFFF	; pc=0x177B(0x2EF6)
	.dw	0xFFFF	; pc=0x177C(0x2EF8)
	.dw	0xFFFF	; pc=0x177D(0x2EFA)
	.dw	0xFFFF	; pc=0x177E(0x2EFC)
	.dw	0xFFFF	; pc=0x177F(0x2EFE)
	.dw	0xFFFF	; pc=0x1780(0x2F00)
	.dw	0xFFFF	; pc=0x1781(0x2F02)
	.dw	0xFFFF	; pc=0x1782(0x2F04)
	.dw	0xFFFF	; pc=0x1783(0x2F06)
	.dw	0xFFFF	; pc=0x1784(0x2F08)
	.dw	0xFFFF	; pc=0x1785(0x2F0A)
	.dw	0xFFFF	; pc=0x1786(0x2F0C)
	.dw	0xFFFF	; pc=0x1787(0x2F0E)
	.dw	0xFFFF	; pc=0x1788(0x2F10)
	.dw	0xFFFF	; pc=0x1789(0x2F12)
	.dw	0xFFFF	; pc=0x178A(0x2F14)
	.dw	0xFFFF	; pc=0x178B(0x2F16)
	.dw	0xFFFF	; pc=0x178C(0x2F18)
	.dw	0xFFFF	; pc=0x178D(0x2F1A)
	.dw	0xFFFF	; pc=0x178E(0x2F1C)
	.dw	0xFFFF	; pc=0x178F(0x2F1E)
	.dw	0xFFFF	; pc=0x1790(0x2F20)
	.dw	0xFFFF	; pc=0x1791(0x2F22)
	.dw	0xFFFF	; pc=0x1792(0x2F24)
	.dw	0xFFFF	; pc=0x1793(0x2F26)
	.dw	0xFFFF	; pc=0x1794(0x2F28)
	.dw	0xFFFF	; pc=0x1795(0x2F2A)
	.dw	0xFFFF	; pc=0x1796(0x2F2C)
	.dw	0xFFFF	; pc=0x1797(0x2F2E)
	.dw	0xFFFF	; pc=0x1798(0x2F30)
	.dw	0xFFFF	; pc=0x1799(0x2F32)
	.dw	0xFFFF	; pc=0x179A(0x2F34)
	.dw	0xFFFF	; pc=0x179B(0x2F36)
	.dw	0xFFFF	; pc=0x179C(0x2F38)
	.dw	0xFFFF	; pc=0x179D(0x2F3A)
	.dw	0xFFFF	; pc=0x179E(0x2F3C)
	.dw	0xFFFF	; pc=0x179F(0x2F3E)
	.dw	0xFFFF	; pc=0x17A0(0x2F40)
	.dw	0xFFFF	; pc=0x17A1(0x2F42)
	.dw	0xFFFF	; pc=0x17A2(0x2F44)
	.dw	0xFFFF	; pc=0x17A3(0x2F46)
	.dw	0xFFFF	; pc=0x17A4(0x2F48)
	.dw	0xFFFF	; pc=0x17A5(0x2F4A)
	.dw	0xFFFF	; pc=0x17A6(0x2F4C)
	.dw	0xFFFF	; pc=0x17A7(0x2F4E)
	.dw	0xFFFF	; pc=0x17A8(0x2F50)
	.dw	0xFFFF	; pc=0x17A9(0x2F52)
	.dw	0xFFFF	; pc=0x17AA(0x2F54)
	.dw	0xFFFF	; pc=0x17AB(0x2F56)
	.dw	0xFFFF	; pc=0x17AC(0x2F58)
	.dw	0xFFFF	; pc=0x17AD(0x2F5A)
	.dw	0xFFFF	; pc=0x17AE(0x2F5C)
	.dw	0xFFFF	; pc=0x17AF(0x2F5E)
	.dw	0xFFFF	; pc=0x17B0(0x2F60)
	.dw	0xFFFF	; pc=0x17B1(0x2F62)
	.dw	0xFFFF	; pc=0x17B2(0x2F64)
	.dw	0xFFFF	; pc=0x17B3(0x2F66)
	.dw	0xFFFF	; pc=0x17B4(0x2F68)
	.dw	0xFFFF	; pc=0x17B5(0x2F6A)
	.dw	0xFFFF	; pc=0x17B6(0x2F6C)
	.dw	0xFFFF	; pc=0x17B7(0x2F6E)
	.dw	0xFFFF	; pc=0x17B8(0x2F70)
	.dw	0xFFFF	; pc=0x17B9(0x2F72)
	.dw	0xFFFF	; pc=0x17BA(0x2F74)
	.dw	0xFFFF	; pc=0x17BB(0x2F76)
	.dw	0xFFFF	; pc=0x17BC(0x2F78)
	.dw	0xFFFF	; pc=0x17BD(0x2F7A)
	.dw	0xFFFF	; pc=0x17BE(0x2F7C)
	.dw	0xFFFF	; pc=0x17BF(0x2F7E)
	.dw	0xFFFF	; pc=0x17C0(0x2F80)
	.dw	0xFFFF	; pc=0x17C1(0x2F82)
	.dw	0xFFFF	; pc=0x17C2(0x2F84)
	.dw	0xFFFF	; pc=0x17C3(0x2F86)
	.dw	0xFFFF	; pc=0x17C4(0x2F88)
	.dw	0xFFFF	; pc=0x17C5(0x2F8A)
	.dw	0xFFFF	; pc=0x17C6(0x2F8C)
	.dw	0xFFFF	; pc=0x17C7(0x2F8E)
	.dw	0xFFFF	; pc=0x17C8(0x2F90)
	.dw	0xFFFF	; pc=0x17C9(0x2F92)
	.dw	0xFFFF	; pc=0x17CA(0x2F94)
	.dw	0xFFFF	; pc=0x17CB(0x2F96)
	.dw	0xFFFF	; pc=0x17CC(0x2F98)
	.dw	0xFFFF	; pc=0x17CD(0x2F9A)
	.dw	0xFFFF	; pc=0x17CE(0x2F9C)
	.dw	0xFFFF	; pc=0x17CF(0x2F9E)
	.dw	0xFFFF	; pc=0x17D0(0x2FA0)
	.dw	0xFFFF	; pc=0x17D1(0x2FA2)
	.dw	0xFFFF	; pc=0x17D2(0x2FA4)
	.dw	0xFFFF	; pc=0x17D3(0x2FA6)
	.dw	0xFFFF	; pc=0x17D4(0x2FA8)
	.dw	0xFFFF	; pc=0x17D5(0x2FAA)
	.dw	0xFFFF	; pc=0x17D6(0x2FAC)
	.dw	0xFFFF	; pc=0x17D7(0x2FAE)
	.dw	0xFFFF	; pc=0x17D8(0x2FB0)
	.dw	0xFFFF	; pc=0x17D9(0x2FB2)
	.dw	0xFFFF	; pc=0x17DA(0x2FB4)
	.dw	0xFFFF	; pc=0x17DB(0x2FB6)
	.dw	0xFFFF	; pc=0x17DC(0x2FB8)
	.dw	0xFFFF	; pc=0x17DD(0x2FBA)
	.dw	0xFFFF	; pc=0x17DE(0x2FBC)
	.dw	0xFFFF	; pc=0x17DF(0x2FBE)
	.dw	0xFFFF	; pc=0x17E0(0x2FC0)
	.dw	0xFFFF	; pc=0x17E1(0x2FC2)
	.dw	0xFFFF	; pc=0x17E2(0x2FC4)
	.dw	0xFFFF	; pc=0x17E3(0x2FC6)
	.dw	0xFFFF	; pc=0x17E4(0x2FC8)
	.dw	0xFFFF	; pc=0x17E5(0x2FCA)
	.dw	0xFFFF	; pc=0x17E6(0x2FCC)
	.dw	0xFFFF	; pc=0x17E7(0x2FCE)
	.dw	0xFFFF	; pc=0x17E8(0x2FD0)
	.dw	0xFFFF	; pc=0x17E9(0x2FD2)
	.dw	0xFFFF	; pc=0x17EA(0x2FD4)
	.dw	0xFFFF	; pc=0x17EB(0x2FD6)
	.dw	0xFFFF	; pc=0x17EC(0x2FD8)
	.dw	0xFFFF	; pc=0x17ED(0x2FDA)
	.dw	0xFFFF	; pc=0x17EE(0x2FDC)
	.dw	0xFFFF	; pc=0x17EF(0x2FDE)
	.dw	0xFFFF	; pc=0x17F0(0x2FE0)
	.dw	0xFFFF	; pc=0x17F1(0x2FE2)
	.dw	0xFFFF	; pc=0x17F2(0x2FE4)
	.dw	0xFFFF	; pc=0x17F3(0x2FE6)
	.dw	0xFFFF	; pc=0x17F4(0x2FE8)
	.dw	0xFFFF	; pc=0x17F5(0x2FEA)
	.dw	0xFFFF	; pc=0x17F6(0x2FEC)
	.dw	0xFFFF	; pc=0x17F7(0x2FEE)
	.dw	0xFFFF	; pc=0x17F8(0x2FF0)
	.dw	0xFFFF	; pc=0x17F9(0x2FF2)
	.dw	0xFFFF	; pc=0x17FA(0x2FF4)
	.dw	0xFFFF	; pc=0x17FB(0x2FF6)
	.dw	0xFFFF	; pc=0x17FC(0x2FF8)
	.dw	0xFFFF	; pc=0x17FD(0x2FFA)
	.dw	0xFFFF	; pc=0x17FE(0x2FFC)
	.dw	0xFFFF	; pc=0x17FF(0x2FFE)
	.dw	0xFFFF	; pc=0x1800(0x3000)
	.dw	0xFFFF	; pc=0x1801(0x3002)
	.dw	0xFFFF	; pc=0x1802(0x3004)
	.dw	0xFFFF	; pc=0x1803(0x3006)
	.dw	0xFFFF	; pc=0x1804(0x3008)
	.dw	0xFFFF	; pc=0x1805(0x300A)
	.dw	0xFFFF	; pc=0x1806(0x300C)
	.dw	0xFFFF	; pc=0x1807(0x300E)
	.dw	0xFFFF	; pc=0x1808(0x3010)
	.dw	0xFFFF	; pc=0x1809(0x3012)
	.dw	0xFFFF	; pc=0x180A(0x3014)
	.dw	0xFFFF	; pc=0x180B(0x3016)
	.dw	0xFFFF	; pc=0x180C(0x3018)
	.dw	0xFFFF	; pc=0x180D(0x301A)
	.dw	0xFFFF	; pc=0x180E(0x301C)
	.dw	0xFFFF	; pc=0x180F(0x301E)
	.dw	0xFFFF	; pc=0x1810(0x3020)
	.dw	0xFFFF	; pc=0x1811(0x3022)
	.dw	0xFFFF	; pc=0x1812(0x3024)
	.dw	0xFFFF	; pc=0x1813(0x3026)
	.dw	0xFFFF	; pc=0x1814(0x3028)
	.dw	0xFFFF	; pc=0x1815(0x302A)
	.dw	0xFFFF	; pc=0x1816(0x302C)
	.dw	0xFFFF	; pc=0x1817(0x302E)
	.dw	0xFFFF	; pc=0x1818(0x3030)
	.dw	0xFFFF	; pc=0x1819(0x3032)
	.dw	0xFFFF	; pc=0x181A(0x3034)
	.dw	0xFFFF	; pc=0x181B(0x3036)
	.dw	0xFFFF	; pc=0x181C(0x3038)
	.dw	0xFFFF	; pc=0x181D(0x303A)
	.dw	0xFFFF	; pc=0x181E(0x303C)
	.dw	0xFFFF	; pc=0x181F(0x303E)
	.dw	0xFFFF	; pc=0x1820(0x3040)
	.dw	0xFFFF	; pc=0x1821(0x3042)
	.dw	0xFFFF	; pc=0x1822(0x3044)
	.dw	0xFFFF	; pc=0x1823(0x3046)
	.dw	0xFFFF	; pc=0x1824(0x3048)
	.dw	0xFFFF	; pc=0x1825(0x304A)
	.dw	0xFFFF	; pc=0x1826(0x304C)
	.dw	0xFFFF	; pc=0x1827(0x304E)
	.dw	0xFFFF	; pc=0x1828(0x3050)
	.dw	0xFFFF	; pc=0x1829(0x3052)
	.dw	0xFFFF	; pc=0x182A(0x3054)
	.dw	0xFFFF	; pc=0x182B(0x3056)
	.dw	0xFFFF	; pc=0x182C(0x3058)
	.dw	0xFFFF	; pc=0x182D(0x305A)
	.dw	0xFFFF	; pc=0x182E(0x305C)
	.dw	0xFFFF	; pc=0x182F(0x305E)
	.dw	0xFFFF	; pc=0x1830(0x3060)
	.dw	0xFFFF	; pc=0x1831(0x3062)
	.dw	0xFFFF	; pc=0x1832(0x3064)
	.dw	0xFFFF	; pc=0x1833(0x3066)
	.dw	0xFFFF	; pc=0x1834(0x3068)
	.dw	0xFFFF	; pc=0x1835(0x306A)
	.dw	0xFFFF	; pc=0x1836(0x306C)
	.dw	0xFFFF	; pc=0x1837(0x306E)
	.dw	0xFFFF	; pc=0x1838(0x3070)
	.dw	0xFFFF	; pc=0x1839(0x3072)
	.dw	0xFFFF	; pc=0x183A(0x3074)
	.dw	0xFFFF	; pc=0x183B(0x3076)
	.dw	0xFFFF	; pc=0x183C(0x3078)
	.dw	0xFFFF	; pc=0x183D(0x307A)
	.dw	0xFFFF	; pc=0x183E(0x307C)
	.dw	0xFFFF	; pc=0x183F(0x307E)
	.dw	0xFFFF	; pc=0x1840(0x3080)
	.dw	0xFFFF	; pc=0x1841(0x3082)
	.dw	0xFFFF	; pc=0x1842(0x3084)
	.dw	0xFFFF	; pc=0x1843(0x3086)
	.dw	0xFFFF	; pc=0x1844(0x3088)
	.dw	0xFFFF	; pc=0x1845(0x308A)
	.dw	0xFFFF	; pc=0x1846(0x308C)
	.dw	0xFFFF	; pc=0x1847(0x308E)
	.dw	0xFFFF	; pc=0x1848(0x3090)
	.dw	0xFFFF	; pc=0x1849(0x3092)
	.dw	0xFFFF	; pc=0x184A(0x3094)
	.dw	0xFFFF	; pc=0x184B(0x3096)
	.dw	0xFFFF	; pc=0x184C(0x3098)
	.dw	0xFFFF	; pc=0x184D(0x309A)
	.dw	0xFFFF	; pc=0x184E(0x309C)
	.dw	0xFFFF	; pc=0x184F(0x309E)
	.dw	0xFFFF	; pc=0x1850(0x30A0)
	.dw	0xFFFF	; pc=0x1851(0x30A2)
	.dw	0xFFFF	; pc=0x1852(0x30A4)
	.dw	0xFFFF	; pc=0x1853(0x30A6)
	.dw	0xFFFF	; pc=0x1854(0x30A8)
	.dw	0xFFFF	; pc=0x1855(0x30AA)
	.dw	0xFFFF	; pc=0x1856(0x30AC)
	.dw	0xFFFF	; pc=0x1857(0x30AE)
	.dw	0xFFFF	; pc=0x1858(0x30B0)
	.dw	0xFFFF	; pc=0x1859(0x30B2)
	.dw	0xFFFF	; pc=0x185A(0x30B4)
	.dw	0xFFFF	; pc=0x185B(0x30B6)
	.dw	0xFFFF	; pc=0x185C(0x30B8)
	.dw	0xFFFF	; pc=0x185D(0x30BA)
	.dw	0xFFFF	; pc=0x185E(0x30BC)
	.dw	0xFFFF	; pc=0x185F(0x30BE)
	.dw	0xFFFF	; pc=0x1860(0x30C0)
	.dw	0xFFFF	; pc=0x1861(0x30C2)
	.dw	0xFFFF	; pc=0x1862(0x30C4)
	.dw	0xFFFF	; pc=0x1863(0x30C6)
	.dw	0xFFFF	; pc=0x1864(0x30C8)
	.dw	0xFFFF	; pc=0x1865(0x30CA)
	.dw	0xFFFF	; pc=0x1866(0x30CC)
	.dw	0xFFFF	; pc=0x1867(0x30CE)
	.dw	0xFFFF	; pc=0x1868(0x30D0)
	.dw	0xFFFF	; pc=0x1869(0x30D2)
	.dw	0xFFFF	; pc=0x186A(0x30D4)
	.dw	0xFFFF	; pc=0x186B(0x30D6)
	.dw	0xFFFF	; pc=0x186C(0x30D8)
	.dw	0xFFFF	; pc=0x186D(0x30DA)
	.dw	0xFFFF	; pc=0x186E(0x30DC)
	.dw	0xFFFF	; pc=0x186F(0x30DE)
	.dw	0xFFFF	; pc=0x1870(0x30E0)
	.dw	0xFFFF	; pc=0x1871(0x30E2)
	.dw	0xFFFF	; pc=0x1872(0x30E4)
	.dw	0xFFFF	; pc=0x1873(0x30E6)
	.dw	0xFFFF	; pc=0x1874(0x30E8)
	.dw	0xFFFF	; pc=0x1875(0x30EA)
	.dw	0xFFFF	; pc=0x1876(0x30EC)
	.dw	0xFFFF	; pc=0x1877(0x30EE)
	.dw	0xFFFF	; pc=0x1878(0x30F0)
	.dw	0xFFFF	; pc=0x1879(0x30F2)
	.dw	0xFFFF	; pc=0x187A(0x30F4)
	.dw	0xFFFF	; pc=0x187B(0x30F6)
	.dw	0xFFFF	; pc=0x187C(0x30F8)
	.dw	0xFFFF	; pc=0x187D(0x30FA)
	.dw	0xFFFF	; pc=0x187E(0x30FC)
	.dw	0xFFFF	; pc=0x187F(0x30FE)
	.dw	0xFFFF	; pc=0x1880(0x3100)
	.dw	0xFFFF	; pc=0x1881(0x3102)
	.dw	0xFFFF	; pc=0x1882(0x3104)
	.dw	0xFFFF	; pc=0x1883(0x3106)
	.dw	0xFFFF	; pc=0x1884(0x3108)
	.dw	0xFFFF	; pc=0x1885(0x310A)
	.dw	0xFFFF	; pc=0x1886(0x310C)
	.dw	0xFFFF	; pc=0x1887(0x310E)
	.dw	0xFFFF	; pc=0x1888(0x3110)
	.dw	0xFFFF	; pc=0x1889(0x3112)
	.dw	0xFFFF	; pc=0x188A(0x3114)
	.dw	0xFFFF	; pc=0x188B(0x3116)
	.dw	0xFFFF	; pc=0x188C(0x3118)
	.dw	0xFFFF	; pc=0x188D(0x311A)
	.dw	0xFFFF	; pc=0x188E(0x311C)
	.dw	0xFFFF	; pc=0x188F(0x311E)
	.dw	0xFFFF	; pc=0x1890(0x3120)
	.dw	0xFFFF	; pc=0x1891(0x3122)
	.dw	0xFFFF	; pc=0x1892(0x3124)
	.dw	0xFFFF	; pc=0x1893(0x3126)
	.dw	0xFFFF	; pc=0x1894(0x3128)
	.dw	0xFFFF	; pc=0x1895(0x312A)
	.dw	0xFFFF	; pc=0x1896(0x312C)
	.dw	0xFFFF	; pc=0x1897(0x312E)
	.dw	0xFFFF	; pc=0x1898(0x3130)
	.dw	0xFFFF	; pc=0x1899(0x3132)
	.dw	0xFFFF	; pc=0x189A(0x3134)
	.dw	0xFFFF	; pc=0x189B(0x3136)
	.dw	0xFFFF	; pc=0x189C(0x3138)
	.dw	0xFFFF	; pc=0x189D(0x313A)
	.dw	0xFFFF	; pc=0x189E(0x313C)
	.dw	0xFFFF	; pc=0x189F(0x313E)
	.dw	0xFFFF	; pc=0x18A0(0x3140)
	.dw	0xFFFF	; pc=0x18A1(0x3142)
	.dw	0xFFFF	; pc=0x18A2(0x3144)
	.dw	0xFFFF	; pc=0x18A3(0x3146)
	.dw	0xFFFF	; pc=0x18A4(0x3148)
	.dw	0xFFFF	; pc=0x18A5(0x314A)
	.dw	0xFFFF	; pc=0x18A6(0x314C)
	.dw	0xFFFF	; pc=0x18A7(0x314E)
	.dw	0xFFFF	; pc=0x18A8(0x3150)
	.dw	0xFFFF	; pc=0x18A9(0x3152)
	.dw	0xFFFF	; pc=0x18AA(0x3154)
	.dw	0xFFFF	; pc=0x18AB(0x3156)
	.dw	0xFFFF	; pc=0x18AC(0x3158)
	.dw	0xFFFF	; pc=0x18AD(0x315A)
	.dw	0xFFFF	; pc=0x18AE(0x315C)
	.dw	0xFFFF	; pc=0x18AF(0x315E)
	.dw	0xFFFF	; pc=0x18B0(0x3160)
	.dw	0xFFFF	; pc=0x18B1(0x3162)
	.dw	0xFFFF	; pc=0x18B2(0x3164)
	.dw	0xFFFF	; pc=0x18B3(0x3166)
	.dw	0xFFFF	; pc=0x18B4(0x3168)
	.dw	0xFFFF	; pc=0x18B5(0x316A)
	.dw	0xFFFF	; pc=0x18B6(0x316C)
	.dw	0xFFFF	; pc=0x18B7(0x316E)
	.dw	0xFFFF	; pc=0x18B8(0x3170)
	.dw	0xFFFF	; pc=0x18B9(0x3172)
	.dw	0xFFFF	; pc=0x18BA(0x3174)
	.dw	0xFFFF	; pc=0x18BB(0x3176)
	.dw	0xFFFF	; pc=0x18BC(0x3178)
	.dw	0xFFFF	; pc=0x18BD(0x317A)
	.dw	0xFFFF	; pc=0x18BE(0x317C)
	.dw	0xFFFF	; pc=0x18BF(0x317E)
	.dw	0xFFFF	; pc=0x18C0(0x3180)
	.dw	0xFFFF	; pc=0x18C1(0x3182)
	.dw	0xFFFF	; pc=0x18C2(0x3184)
	.dw	0xFFFF	; pc=0x18C3(0x3186)
	.dw	0xFFFF	; pc=0x18C4(0x3188)
	.dw	0xFFFF	; pc=0x18C5(0x318A)
	.dw	0xFFFF	; pc=0x18C6(0x318C)
	.dw	0xFFFF	; pc=0x18C7(0x318E)
	.dw	0xFFFF	; pc=0x18C8(0x3190)
	.dw	0xFFFF	; pc=0x18C9(0x3192)
	.dw	0xFFFF	; pc=0x18CA(0x3194)
	.dw	0xFFFF	; pc=0x18CB(0x3196)
	.dw	0xFFFF	; pc=0x18CC(0x3198)
	.dw	0xFFFF	; pc=0x18CD(0x319A)
	.dw	0xFFFF	; pc=0x18CE(0x319C)
	.dw	0xFFFF	; pc=0x18CF(0x319E)
	.dw	0xFFFF	; pc=0x18D0(0x31A0)
	.dw	0xFFFF	; pc=0x18D1(0x31A2)
	.dw	0xFFFF	; pc=0x18D2(0x31A4)
	.dw	0xFFFF	; pc=0x18D3(0x31A6)
	.dw	0xFFFF	; pc=0x18D4(0x31A8)
	.dw	0xFFFF	; pc=0x18D5(0x31AA)
	.dw	0xFFFF	; pc=0x18D6(0x31AC)
	.dw	0xFFFF	; pc=0x18D7(0x31AE)
	.dw	0xFFFF	; pc=0x18D8(0x31B0)
	.dw	0xFFFF	; pc=0x18D9(0x31B2)
	.dw	0xFFFF	; pc=0x18DA(0x31B4)
	.dw	0xFFFF	; pc=0x18DB(0x31B6)
	.dw	0xFFFF	; pc=0x18DC(0x31B8)
	.dw	0xFFFF	; pc=0x18DD(0x31BA)
	.dw	0xFFFF	; pc=0x18DE(0x31BC)
	.dw	0xFFFF	; pc=0x18DF(0x31BE)
	.dw	0xFFFF	; pc=0x18E0(0x31C0)
	.dw	0xFFFF	; pc=0x18E1(0x31C2)
	.dw	0xFFFF	; pc=0x18E2(0x31C4)
	.dw	0xFFFF	; pc=0x18E3(0x31C6)
	.dw	0xFFFF	; pc=0x18E4(0x31C8)
	.dw	0xFFFF	; pc=0x18E5(0x31CA)
	.dw	0xFFFF	; pc=0x18E6(0x31CC)
	.dw	0xFFFF	; pc=0x18E7(0x31CE)
	.dw	0xFFFF	; pc=0x18E8(0x31D0)
	.dw	0xFFFF	; pc=0x18E9(0x31D2)
	.dw	0xFFFF	; pc=0x18EA(0x31D4)
	.dw	0xFFFF	; pc=0x18EB(0x31D6)
	.dw	0xFFFF	; pc=0x18EC(0x31D8)
	.dw	0xFFFF	; pc=0x18ED(0x31DA)
	.dw	0xFFFF	; pc=0x18EE(0x31DC)
	.dw	0xFFFF	; pc=0x18EF(0x31DE)
	.dw	0xFFFF	; pc=0x18F0(0x31E0)
	.dw	0xFFFF	; pc=0x18F1(0x31E2)
	.dw	0xFFFF	; pc=0x18F2(0x31E4)
	.dw	0xFFFF	; pc=0x18F3(0x31E6)
	.dw	0xFFFF	; pc=0x18F4(0x31E8)
	.dw	0xFFFF	; pc=0x18F5(0x31EA)
	.dw	0xFFFF	; pc=0x18F6(0x31EC)
	.dw	0xFFFF	; pc=0x18F7(0x31EE)
	.dw	0xFFFF	; pc=0x18F8(0x31F0)
	.dw	0xFFFF	; pc=0x18F9(0x31F2)
	.dw	0xFFFF	; pc=0x18FA(0x31F4)
	.dw	0xFFFF	; pc=0x18FB(0x31F6)
	.dw	0xFFFF	; pc=0x18FC(0x31F8)
	.dw	0xFFFF	; pc=0x18FD(0x31FA)
	.dw	0xFFFF	; pc=0x18FE(0x31FC)
	.dw	0xFFFF	; pc=0x18FF(0x31FE)
	.dw	0xFFFF	; pc=0x1900(0x3200)
	.dw	0xFFFF	; pc=0x1901(0x3202)
	.dw	0xFFFF	; pc=0x1902(0x3204)
	.dw	0xFFFF	; pc=0x1903(0x3206)
	.dw	0xFFFF	; pc=0x1904(0x3208)
	.dw	0xFFFF	; pc=0x1905(0x320A)
	.dw	0xFFFF	; pc=0x1906(0x320C)
	.dw	0xFFFF	; pc=0x1907(0x320E)
	.dw	0xFFFF	; pc=0x1908(0x3210)
	.dw	0xFFFF	; pc=0x1909(0x3212)
	.dw	0xFFFF	; pc=0x190A(0x3214)
	.dw	0xFFFF	; pc=0x190B(0x3216)
	.dw	0xFFFF	; pc=0x190C(0x3218)
	.dw	0xFFFF	; pc=0x190D(0x321A)
	.dw	0xFFFF	; pc=0x190E(0x321C)
	.dw	0xFFFF	; pc=0x190F(0x321E)
	.dw	0xFFFF	; pc=0x1910(0x3220)
	.dw	0xFFFF	; pc=0x1911(0x3222)
	.dw	0xFFFF	; pc=0x1912(0x3224)
	.dw	0xFFFF	; pc=0x1913(0x3226)
	.dw	0xFFFF	; pc=0x1914(0x3228)
	.dw	0xFFFF	; pc=0x1915(0x322A)
	.dw	0xFFFF	; pc=0x1916(0x322C)
	.dw	0xFFFF	; pc=0x1917(0x322E)
	.dw	0xFFFF	; pc=0x1918(0x3230)
	.dw	0xFFFF	; pc=0x1919(0x3232)
	.dw	0xFFFF	; pc=0x191A(0x3234)
	.dw	0xFFFF	; pc=0x191B(0x3236)
	.dw	0xFFFF	; pc=0x191C(0x3238)
	.dw	0xFFFF	; pc=0x191D(0x323A)
	.dw	0xFFFF	; pc=0x191E(0x323C)
	.dw	0xFFFF	; pc=0x191F(0x323E)
	.dw	0xFFFF	; pc=0x1920(0x3240)
	.dw	0xFFFF	; pc=0x1921(0x3242)
	.dw	0xFFFF	; pc=0x1922(0x3244)
	.dw	0xFFFF	; pc=0x1923(0x3246)
	.dw	0xFFFF	; pc=0x1924(0x3248)
	.dw	0xFFFF	; pc=0x1925(0x324A)
	.dw	0xFFFF	; pc=0x1926(0x324C)
	.dw	0xFFFF	; pc=0x1927(0x324E)
	.dw	0xFFFF	; pc=0x1928(0x3250)
	.dw	0xFFFF	; pc=0x1929(0x3252)
	.dw	0xFFFF	; pc=0x192A(0x3254)
	.dw	0xFFFF	; pc=0x192B(0x3256)
	.dw	0xFFFF	; pc=0x192C(0x3258)
	.dw	0xFFFF	; pc=0x192D(0x325A)
	.dw	0xFFFF	; pc=0x192E(0x325C)
	.dw	0xFFFF	; pc=0x192F(0x325E)
	.dw	0xFFFF	; pc=0x1930(0x3260)
	.dw	0xFFFF	; pc=0x1931(0x3262)
	.dw	0xFFFF	; pc=0x1932(0x3264)
	.dw	0xFFFF	; pc=0x1933(0x3266)
	.dw	0xFFFF	; pc=0x1934(0x3268)
	.dw	0xFFFF	; pc=0x1935(0x326A)
	.dw	0xFFFF	; pc=0x1936(0x326C)
	.dw	0xFFFF	; pc=0x1937(0x326E)
	.dw	0xFFFF	; pc=0x1938(0x3270)
	.dw	0xFFFF	; pc=0x1939(0x3272)
	.dw	0xFFFF	; pc=0x193A(0x3274)
	.dw	0xFFFF	; pc=0x193B(0x3276)
	.dw	0xFFFF	; pc=0x193C(0x3278)
	.dw	0xFFFF	; pc=0x193D(0x327A)
	.dw	0xFFFF	; pc=0x193E(0x327C)
	.dw	0xFFFF	; pc=0x193F(0x327E)
	.dw	0xFFFF	; pc=0x1940(0x3280)
	.dw	0xFFFF	; pc=0x1941(0x3282)
	.dw	0xFFFF	; pc=0x1942(0x3284)
	.dw	0xFFFF	; pc=0x1943(0x3286)
	.dw	0xFFFF	; pc=0x1944(0x3288)
	.dw	0xFFFF	; pc=0x1945(0x328A)
	.dw	0xFFFF	; pc=0x1946(0x328C)
	.dw	0xFFFF	; pc=0x1947(0x328E)
	.dw	0xFFFF	; pc=0x1948(0x3290)
	.dw	0xFFFF	; pc=0x1949(0x3292)
	.dw	0xFFFF	; pc=0x194A(0x3294)
	.dw	0xFFFF	; pc=0x194B(0x3296)
	.dw	0xFFFF	; pc=0x194C(0x3298)
	.dw	0xFFFF	; pc=0x194D(0x329A)
	.dw	0xFFFF	; pc=0x194E(0x329C)
	.dw	0xFFFF	; pc=0x194F(0x329E)
	.dw	0xFFFF	; pc=0x1950(0x32A0)
	.dw	0xFFFF	; pc=0x1951(0x32A2)
	.dw	0xFFFF	; pc=0x1952(0x32A4)
	.dw	0xFFFF	; pc=0x1953(0x32A6)
	.dw	0xFFFF	; pc=0x1954(0x32A8)
	.dw	0xFFFF	; pc=0x1955(0x32AA)
	.dw	0xFFFF	; pc=0x1956(0x32AC)
	.dw	0xFFFF	; pc=0x1957(0x32AE)
	.dw	0xFFFF	; pc=0x1958(0x32B0)
	.dw	0xFFFF	; pc=0x1959(0x32B2)
	.dw	0xFFFF	; pc=0x195A(0x32B4)
	.dw	0xFFFF	; pc=0x195B(0x32B6)
	.dw	0xFFFF	; pc=0x195C(0x32B8)
	.dw	0xFFFF	; pc=0x195D(0x32BA)
	.dw	0xFFFF	; pc=0x195E(0x32BC)
	.dw	0xFFFF	; pc=0x195F(0x32BE)
	.dw	0xFFFF	; pc=0x1960(0x32C0)
	.dw	0xFFFF	; pc=0x1961(0x32C2)
	.dw	0xFFFF	; pc=0x1962(0x32C4)
	.dw	0xFFFF	; pc=0x1963(0x32C6)
	.dw	0xFFFF	; pc=0x1964(0x32C8)
	.dw	0xFFFF	; pc=0x1965(0x32CA)
	.dw	0xFFFF	; pc=0x1966(0x32CC)
	.dw	0xFFFF	; pc=0x1967(0x32CE)
	.dw	0xFFFF	; pc=0x1968(0x32D0)
	.dw	0xFFFF	; pc=0x1969(0x32D2)
	.dw	0xFFFF	; pc=0x196A(0x32D4)
	.dw	0xFFFF	; pc=0x196B(0x32D6)
	.dw	0xFFFF	; pc=0x196C(0x32D8)
	.dw	0xFFFF	; pc=0x196D(0x32DA)
	.dw	0xFFFF	; pc=0x196E(0x32DC)
	.dw	0xFFFF	; pc=0x196F(0x32DE)
	.dw	0xFFFF	; pc=0x1970(0x32E0)
	.dw	0xFFFF	; pc=0x1971(0x32E2)
	.dw	0xFFFF	; pc=0x1972(0x32E4)
	.dw	0xFFFF	; pc=0x1973(0x32E6)
	.dw	0xFFFF	; pc=0x1974(0x32E8)
	.dw	0xFFFF	; pc=0x1975(0x32EA)
	.dw	0xFFFF	; pc=0x1976(0x32EC)
	.dw	0xFFFF	; pc=0x1977(0x32EE)
	.dw	0xFFFF	; pc=0x1978(0x32F0)
	.dw	0xFFFF	; pc=0x1979(0x32F2)
	.dw	0xFFFF	; pc=0x197A(0x32F4)
	.dw	0xFFFF	; pc=0x197B(0x32F6)
	.dw	0xFFFF	; pc=0x197C(0x32F8)
	.dw	0xFFFF	; pc=0x197D(0x32FA)
	.dw	0xFFFF	; pc=0x197E(0x32FC)
	.dw	0xFFFF	; pc=0x197F(0x32FE)
	.dw	0xFFFF	; pc=0x1980(0x3300)
	.dw	0xFFFF	; pc=0x1981(0x3302)
	.dw	0xFFFF	; pc=0x1982(0x3304)
	.dw	0xFFFF	; pc=0x1983(0x3306)
	.dw	0xFFFF	; pc=0x1984(0x3308)
	.dw	0xFFFF	; pc=0x1985(0x330A)
	.dw	0xFFFF	; pc=0x1986(0x330C)
	.dw	0xFFFF	; pc=0x1987(0x330E)
	.dw	0xFFFF	; pc=0x1988(0x3310)
	.dw	0xFFFF	; pc=0x1989(0x3312)
	.dw	0xFFFF	; pc=0x198A(0x3314)
	.dw	0xFFFF	; pc=0x198B(0x3316)
	.dw	0xFFFF	; pc=0x198C(0x3318)
	.dw	0xFFFF	; pc=0x198D(0x331A)
	.dw	0xFFFF	; pc=0x198E(0x331C)
	.dw	0xFFFF	; pc=0x198F(0x331E)
	.dw	0xFFFF	; pc=0x1990(0x3320)
	.dw	0xFFFF	; pc=0x1991(0x3322)
	.dw	0xFFFF	; pc=0x1992(0x3324)
	.dw	0xFFFF	; pc=0x1993(0x3326)
	.dw	0xFFFF	; pc=0x1994(0x3328)
	.dw	0xFFFF	; pc=0x1995(0x332A)
	.dw	0xFFFF	; pc=0x1996(0x332C)
	.dw	0xFFFF	; pc=0x1997(0x332E)
	.dw	0xFFFF	; pc=0x1998(0x3330)
	.dw	0xFFFF	; pc=0x1999(0x3332)
	.dw	0xFFFF	; pc=0x199A(0x3334)
	.dw	0xFFFF	; pc=0x199B(0x3336)
	.dw	0xFFFF	; pc=0x199C(0x3338)
	.dw	0xFFFF	; pc=0x199D(0x333A)
	.dw	0xFFFF	; pc=0x199E(0x333C)
	.dw	0xFFFF	; pc=0x199F(0x333E)
	.dw	0xFFFF	; pc=0x19A0(0x3340)
	.dw	0xFFFF	; pc=0x19A1(0x3342)
	.dw	0xFFFF	; pc=0x19A2(0x3344)
	.dw	0xFFFF	; pc=0x19A3(0x3346)
	.dw	0xFFFF	; pc=0x19A4(0x3348)
	.dw	0xFFFF	; pc=0x19A5(0x334A)
	.dw	0xFFFF	; pc=0x19A6(0x334C)
	.dw	0xFFFF	; pc=0x19A7(0x334E)
	.dw	0xFFFF	; pc=0x19A8(0x3350)
	.dw	0xFFFF	; pc=0x19A9(0x3352)
	.dw	0xFFFF	; pc=0x19AA(0x3354)
	.dw	0xFFFF	; pc=0x19AB(0x3356)
	.dw	0xFFFF	; pc=0x19AC(0x3358)
	.dw	0xFFFF	; pc=0x19AD(0x335A)
	.dw	0xFFFF	; pc=0x19AE(0x335C)
	.dw	0xFFFF	; pc=0x19AF(0x335E)
	.dw	0xFFFF	; pc=0x19B0(0x3360)
	.dw	0xFFFF	; pc=0x19B1(0x3362)
	.dw	0xFFFF	; pc=0x19B2(0x3364)
	.dw	0xFFFF	; pc=0x19B3(0x3366)
	.dw	0xFFFF	; pc=0x19B4(0x3368)
	.dw	0xFFFF	; pc=0x19B5(0x336A)
	.dw	0xFFFF	; pc=0x19B6(0x336C)
	.dw	0xFFFF	; pc=0x19B7(0x336E)
	.dw	0xFFFF	; pc=0x19B8(0x3370)
	.dw	0xFFFF	; pc=0x19B9(0x3372)
	.dw	0xFFFF	; pc=0x19BA(0x3374)
	.dw	0xFFFF	; pc=0x19BB(0x3376)
	.dw	0xFFFF	; pc=0x19BC(0x3378)
	.dw	0xFFFF	; pc=0x19BD(0x337A)
	.dw	0xFFFF	; pc=0x19BE(0x337C)
	.dw	0xFFFF	; pc=0x19BF(0x337E)
	.dw	0xFFFF	; pc=0x19C0(0x3380)
	.dw	0xFFFF	; pc=0x19C1(0x3382)
	.dw	0xFFFF	; pc=0x19C2(0x3384)
	.dw	0xFFFF	; pc=0x19C3(0x3386)
	.dw	0xFFFF	; pc=0x19C4(0x3388)
	.dw	0xFFFF	; pc=0x19C5(0x338A)
	.dw	0xFFFF	; pc=0x19C6(0x338C)
	.dw	0xFFFF	; pc=0x19C7(0x338E)
	.dw	0xFFFF	; pc=0x19C8(0x3390)
	.dw	0xFFFF	; pc=0x19C9(0x3392)
	.dw	0xFFFF	; pc=0x19CA(0x3394)
	.dw	0xFFFF	; pc=0x19CB(0x3396)
	.dw	0xFFFF	; pc=0x19CC(0x3398)
	.dw	0xFFFF	; pc=0x19CD(0x339A)
	.dw	0xFFFF	; pc=0x19CE(0x339C)
	.dw	0xFFFF	; pc=0x19CF(0x339E)
	.dw	0xFFFF	; pc=0x19D0(0x33A0)
	.dw	0xFFFF	; pc=0x19D1(0x33A2)
	.dw	0xFFFF	; pc=0x19D2(0x33A4)
	.dw	0xFFFF	; pc=0x19D3(0x33A6)
	.dw	0xFFFF	; pc=0x19D4(0x33A8)
	.dw	0xFFFF	; pc=0x19D5(0x33AA)
	.dw	0xFFFF	; pc=0x19D6(0x33AC)
	.dw	0xFFFF	; pc=0x19D7(0x33AE)
	.dw	0xFFFF	; pc=0x19D8(0x33B0)
	.dw	0xFFFF	; pc=0x19D9(0x33B2)
	.dw	0xFFFF	; pc=0x19DA(0x33B4)
	.dw	0xFFFF	; pc=0x19DB(0x33B6)
	.dw	0xFFFF	; pc=0x19DC(0x33B8)
	.dw	0xFFFF	; pc=0x19DD(0x33BA)
	.dw	0xFFFF	; pc=0x19DE(0x33BC)
	.dw	0xFFFF	; pc=0x19DF(0x33BE)
	.dw	0xFFFF	; pc=0x19E0(0x33C0)
	.dw	0xFFFF	; pc=0x19E1(0x33C2)
	.dw	0xFFFF	; pc=0x19E2(0x33C4)
	.dw	0xFFFF	; pc=0x19E3(0x33C6)
	.dw	0xFFFF	; pc=0x19E4(0x33C8)
	.dw	0xFFFF	; pc=0x19E5(0x33CA)
	.dw	0xFFFF	; pc=0x19E6(0x33CC)
	.dw	0xFFFF	; pc=0x19E7(0x33CE)
	.dw	0xFFFF	; pc=0x19E8(0x33D0)
	.dw	0xFFFF	; pc=0x19E9(0x33D2)
	.dw	0xFFFF	; pc=0x19EA(0x33D4)
	.dw	0xFFFF	; pc=0x19EB(0x33D6)
	.dw	0xFFFF	; pc=0x19EC(0x33D8)
	.dw	0xFFFF	; pc=0x19ED(0x33DA)
	.dw	0xFFFF	; pc=0x19EE(0x33DC)
	.dw	0xFFFF	; pc=0x19EF(0x33DE)
	.dw	0xFFFF	; pc=0x19F0(0x33E0)
	.dw	0xFFFF	; pc=0x19F1(0x33E2)
	.dw	0xFFFF	; pc=0x19F2(0x33E4)
	.dw	0xFFFF	; pc=0x19F3(0x33E6)
	.dw	0xFFFF	; pc=0x19F4(0x33E8)
	.dw	0xFFFF	; pc=0x19F5(0x33EA)
	.dw	0xFFFF	; pc=0x19F6(0x33EC)
	.dw	0xFFFF	; pc=0x19F7(0x33EE)
	.dw	0xFFFF	; pc=0x19F8(0x33F0)
	.dw	0xFFFF	; pc=0x19F9(0x33F2)
	.dw	0xFFFF	; pc=0x19FA(0x33F4)
	.dw	0xFFFF	; pc=0x19FB(0x33F6)
	.dw	0xFFFF	; pc=0x19FC(0x33F8)
	.dw	0xFFFF	; pc=0x19FD(0x33FA)
	.dw	0xFFFF	; pc=0x19FE(0x33FC)
	.dw	0xFFFF	; pc=0x19FF(0x33FE)
	.dw	0xFFFF	; pc=0x1A00(0x3400)
	.dw	0xFFFF	; pc=0x1A01(0x3402)
	.dw	0xFFFF	; pc=0x1A02(0x3404)
	.dw	0xFFFF	; pc=0x1A03(0x3406)
	.dw	0xFFFF	; pc=0x1A04(0x3408)
	.dw	0xFFFF	; pc=0x1A05(0x340A)
	.dw	0xFFFF	; pc=0x1A06(0x340C)
	.dw	0xFFFF	; pc=0x1A07(0x340E)
	.dw	0xFFFF	; pc=0x1A08(0x3410)
	.dw	0xFFFF	; pc=0x1A09(0x3412)
	.dw	0xFFFF	; pc=0x1A0A(0x3414)
	.dw	0xFFFF	; pc=0x1A0B(0x3416)
	.dw	0xFFFF	; pc=0x1A0C(0x3418)
	.dw	0xFFFF	; pc=0x1A0D(0x341A)
	.dw	0xFFFF	; pc=0x1A0E(0x341C)
	.dw	0xFFFF	; pc=0x1A0F(0x341E)
	.dw	0xFFFF	; pc=0x1A10(0x3420)
	.dw	0xFFFF	; pc=0x1A11(0x3422)
	.dw	0xFFFF	; pc=0x1A12(0x3424)
	.dw	0xFFFF	; pc=0x1A13(0x3426)
	.dw	0xFFFF	; pc=0x1A14(0x3428)
	.dw	0xFFFF	; pc=0x1A15(0x342A)
	.dw	0xFFFF	; pc=0x1A16(0x342C)
	.dw	0xFFFF	; pc=0x1A17(0x342E)
	.dw	0xFFFF	; pc=0x1A18(0x3430)
	.dw	0xFFFF	; pc=0x1A19(0x3432)
	.dw	0xFFFF	; pc=0x1A1A(0x3434)
	.dw	0xFFFF	; pc=0x1A1B(0x3436)
	.dw	0xFFFF	; pc=0x1A1C(0x3438)
	.dw	0xFFFF	; pc=0x1A1D(0x343A)
	.dw	0xFFFF	; pc=0x1A1E(0x343C)
	.dw	0xFFFF	; pc=0x1A1F(0x343E)
	.dw	0xFFFF	; pc=0x1A20(0x3440)
	.dw	0xFFFF	; pc=0x1A21(0x3442)
	.dw	0xFFFF	; pc=0x1A22(0x3444)
	.dw	0xFFFF	; pc=0x1A23(0x3446)
	.dw	0xFFFF	; pc=0x1A24(0x3448)
	.dw	0xFFFF	; pc=0x1A25(0x344A)
	.dw	0xFFFF	; pc=0x1A26(0x344C)
	.dw	0xFFFF	; pc=0x1A27(0x344E)
	.dw	0xFFFF	; pc=0x1A28(0x3450)
	.dw	0xFFFF	; pc=0x1A29(0x3452)
	.dw	0xFFFF	; pc=0x1A2A(0x3454)
	.dw	0xFFFF	; pc=0x1A2B(0x3456)
	.dw	0xFFFF	; pc=0x1A2C(0x3458)
	.dw	0xFFFF	; pc=0x1A2D(0x345A)
	.dw	0xFFFF	; pc=0x1A2E(0x345C)
	.dw	0xFFFF	; pc=0x1A2F(0x345E)
	.dw	0xFFFF	; pc=0x1A30(0x3460)
	.dw	0xFFFF	; pc=0x1A31(0x3462)
	.dw	0xFFFF	; pc=0x1A32(0x3464)
	.dw	0xFFFF	; pc=0x1A33(0x3466)
	.dw	0xFFFF	; pc=0x1A34(0x3468)
	.dw	0xFFFF	; pc=0x1A35(0x346A)
	.dw	0xFFFF	; pc=0x1A36(0x346C)
	.dw	0xFFFF	; pc=0x1A37(0x346E)
	.dw	0xFFFF	; pc=0x1A38(0x3470)
	.dw	0xFFFF	; pc=0x1A39(0x3472)
	.dw	0xFFFF	; pc=0x1A3A(0x3474)
	.dw	0xFFFF	; pc=0x1A3B(0x3476)
	.dw	0xFFFF	; pc=0x1A3C(0x3478)
	.dw	0xFFFF	; pc=0x1A3D(0x347A)
	.dw	0xFFFF	; pc=0x1A3E(0x347C)
	.dw	0xFFFF	; pc=0x1A3F(0x347E)
	.dw	0xFFFF	; pc=0x1A40(0x3480)
	.dw	0xFFFF	; pc=0x1A41(0x3482)
	.dw	0xFFFF	; pc=0x1A42(0x3484)
	.dw	0xFFFF	; pc=0x1A43(0x3486)
	.dw	0xFFFF	; pc=0x1A44(0x3488)
	.dw	0xFFFF	; pc=0x1A45(0x348A)
	.dw	0xFFFF	; pc=0x1A46(0x348C)
	.dw	0xFFFF	; pc=0x1A47(0x348E)
	.dw	0xFFFF	; pc=0x1A48(0x3490)
	.dw	0xFFFF	; pc=0x1A49(0x3492)
	.dw	0xFFFF	; pc=0x1A4A(0x3494)
	.dw	0xFFFF	; pc=0x1A4B(0x3496)
	.dw	0xFFFF	; pc=0x1A4C(0x3498)
	.dw	0xFFFF	; pc=0x1A4D(0x349A)
	.dw	0xFFFF	; pc=0x1A4E(0x349C)
	.dw	0xFFFF	; pc=0x1A4F(0x349E)
	.dw	0xFFFF	; pc=0x1A50(0x34A0)
	.dw	0xFFFF	; pc=0x1A51(0x34A2)
	.dw	0xFFFF	; pc=0x1A52(0x34A4)
	.dw	0xFFFF	; pc=0x1A53(0x34A6)
	.dw	0xFFFF	; pc=0x1A54(0x34A8)
	.dw	0xFFFF	; pc=0x1A55(0x34AA)
	.dw	0xFFFF	; pc=0x1A56(0x34AC)
	.dw	0xFFFF	; pc=0x1A57(0x34AE)
	.dw	0xFFFF	; pc=0x1A58(0x34B0)
	.dw	0xFFFF	; pc=0x1A59(0x34B2)
	.dw	0xFFFF	; pc=0x1A5A(0x34B4)
	.dw	0xFFFF	; pc=0x1A5B(0x34B6)
	.dw	0xFFFF	; pc=0x1A5C(0x34B8)
	.dw	0xFFFF	; pc=0x1A5D(0x34BA)
	.dw	0xFFFF	; pc=0x1A5E(0x34BC)
	.dw	0xFFFF	; pc=0x1A5F(0x34BE)
	.dw	0xFFFF	; pc=0x1A60(0x34C0)
	.dw	0xFFFF	; pc=0x1A61(0x34C2)
	.dw	0xFFFF	; pc=0x1A62(0x34C4)
	.dw	0xFFFF	; pc=0x1A63(0x34C6)
	.dw	0xFFFF	; pc=0x1A64(0x34C8)
	.dw	0xFFFF	; pc=0x1A65(0x34CA)
	.dw	0xFFFF	; pc=0x1A66(0x34CC)
	.dw	0xFFFF	; pc=0x1A67(0x34CE)
	.dw	0xFFFF	; pc=0x1A68(0x34D0)
	.dw	0xFFFF	; pc=0x1A69(0x34D2)
	.dw	0xFFFF	; pc=0x1A6A(0x34D4)
	.dw	0xFFFF	; pc=0x1A6B(0x34D6)
	.dw	0xFFFF	; pc=0x1A6C(0x34D8)
	.dw	0xFFFF	; pc=0x1A6D(0x34DA)
	.dw	0xFFFF	; pc=0x1A6E(0x34DC)
	.dw	0xFFFF	; pc=0x1A6F(0x34DE)
	.dw	0xFFFF	; pc=0x1A70(0x34E0)
	.dw	0xFFFF	; pc=0x1A71(0x34E2)
	.dw	0xFFFF	; pc=0x1A72(0x34E4)
	.dw	0xFFFF	; pc=0x1A73(0x34E6)
	.dw	0xFFFF	; pc=0x1A74(0x34E8)
	.dw	0xFFFF	; pc=0x1A75(0x34EA)
	.dw	0xFFFF	; pc=0x1A76(0x34EC)
	.dw	0xFFFF	; pc=0x1A77(0x34EE)
	.dw	0xFFFF	; pc=0x1A78(0x34F0)
	.dw	0xFFFF	; pc=0x1A79(0x34F2)
	.dw	0xFFFF	; pc=0x1A7A(0x34F4)
	.dw	0xFFFF	; pc=0x1A7B(0x34F6)
	.dw	0xFFFF	; pc=0x1A7C(0x34F8)
	.dw	0xFFFF	; pc=0x1A7D(0x34FA)
	.dw	0xFFFF	; pc=0x1A7E(0x34FC)
	.dw	0xFFFF	; pc=0x1A7F(0x34FE)
	.dw	0xFFFF	; pc=0x1A80(0x3500)
	.dw	0xFFFF	; pc=0x1A81(0x3502)
	.dw	0xFFFF	; pc=0x1A82(0x3504)
	.dw	0xFFFF	; pc=0x1A83(0x3506)
	.dw	0xFFFF	; pc=0x1A84(0x3508)
	.dw	0xFFFF	; pc=0x1A85(0x350A)
	.dw	0xFFFF	; pc=0x1A86(0x350C)
	.dw	0xFFFF	; pc=0x1A87(0x350E)
	.dw	0xFFFF	; pc=0x1A88(0x3510)
	.dw	0xFFFF	; pc=0x1A89(0x3512)
	.dw	0xFFFF	; pc=0x1A8A(0x3514)
	.dw	0xFFFF	; pc=0x1A8B(0x3516)
	.dw	0xFFFF	; pc=0x1A8C(0x3518)
	.dw	0xFFFF	; pc=0x1A8D(0x351A)
	.dw	0xFFFF	; pc=0x1A8E(0x351C)
	.dw	0xFFFF	; pc=0x1A8F(0x351E)
	.dw	0xFFFF	; pc=0x1A90(0x3520)
	.dw	0xFFFF	; pc=0x1A91(0x3522)
	.dw	0xFFFF	; pc=0x1A92(0x3524)
	.dw	0xFFFF	; pc=0x1A93(0x3526)
	.dw	0xFFFF	; pc=0x1A94(0x3528)
	.dw	0xFFFF	; pc=0x1A95(0x352A)
	.dw	0xFFFF	; pc=0x1A96(0x352C)
	.dw	0xFFFF	; pc=0x1A97(0x352E)
	.dw	0xFFFF	; pc=0x1A98(0x3530)
	.dw	0xFFFF	; pc=0x1A99(0x3532)
	.dw	0xFFFF	; pc=0x1A9A(0x3534)
	.dw	0xFFFF	; pc=0x1A9B(0x3536)
	.dw	0xFFFF	; pc=0x1A9C(0x3538)
	.dw	0xFFFF	; pc=0x1A9D(0x353A)
	.dw	0xFFFF	; pc=0x1A9E(0x353C)
	.dw	0xFFFF	; pc=0x1A9F(0x353E)
	.dw	0xFFFF	; pc=0x1AA0(0x3540)
	.dw	0xFFFF	; pc=0x1AA1(0x3542)
	.dw	0xFFFF	; pc=0x1AA2(0x3544)
	.dw	0xFFFF	; pc=0x1AA3(0x3546)
	.dw	0xFFFF	; pc=0x1AA4(0x3548)
	.dw	0xFFFF	; pc=0x1AA5(0x354A)
	.dw	0xFFFF	; pc=0x1AA6(0x354C)
	.dw	0xFFFF	; pc=0x1AA7(0x354E)
	.dw	0xFFFF	; pc=0x1AA8(0x3550)
	.dw	0xFFFF	; pc=0x1AA9(0x3552)
	.dw	0xFFFF	; pc=0x1AAA(0x3554)
	.dw	0xFFFF	; pc=0x1AAB(0x3556)
	.dw	0xFFFF	; pc=0x1AAC(0x3558)
	.dw	0xFFFF	; pc=0x1AAD(0x355A)
	.dw	0xFFFF	; pc=0x1AAE(0x355C)
	.dw	0xFFFF	; pc=0x1AAF(0x355E)
	.dw	0xFFFF	; pc=0x1AB0(0x3560)
	.dw	0xFFFF	; pc=0x1AB1(0x3562)
	.dw	0xFFFF	; pc=0x1AB2(0x3564)
	.dw	0xFFFF	; pc=0x1AB3(0x3566)
	.dw	0xFFFF	; pc=0x1AB4(0x3568)
	.dw	0xFFFF	; pc=0x1AB5(0x356A)
	.dw	0xFFFF	; pc=0x1AB6(0x356C)
	.dw	0xFFFF	; pc=0x1AB7(0x356E)
	.dw	0xFFFF	; pc=0x1AB8(0x3570)
	.dw	0xFFFF	; pc=0x1AB9(0x3572)
	.dw	0xFFFF	; pc=0x1ABA(0x3574)
	.dw	0xFFFF	; pc=0x1ABB(0x3576)
	.dw	0xFFFF	; pc=0x1ABC(0x3578)
	.dw	0xFFFF	; pc=0x1ABD(0x357A)
	.dw	0xFFFF	; pc=0x1ABE(0x357C)
	.dw	0xFFFF	; pc=0x1ABF(0x357E)
	.dw	0xFFFF	; pc=0x1AC0(0x3580)
	.dw	0xFFFF	; pc=0x1AC1(0x3582)
	.dw	0xFFFF	; pc=0x1AC2(0x3584)
	.dw	0xFFFF	; pc=0x1AC3(0x3586)
	.dw	0xFFFF	; pc=0x1AC4(0x3588)
	.dw	0xFFFF	; pc=0x1AC5(0x358A)
	.dw	0xFFFF	; pc=0x1AC6(0x358C)
	.dw	0xFFFF	; pc=0x1AC7(0x358E)
	.dw	0xFFFF	; pc=0x1AC8(0x3590)
	.dw	0xFFFF	; pc=0x1AC9(0x3592)
	.dw	0xFFFF	; pc=0x1ACA(0x3594)
	.dw	0xFFFF	; pc=0x1ACB(0x3596)
	.dw	0xFFFF	; pc=0x1ACC(0x3598)
	.dw	0xFFFF	; pc=0x1ACD(0x359A)
	.dw	0xFFFF	; pc=0x1ACE(0x359C)
	.dw	0xFFFF	; pc=0x1ACF(0x359E)
	.dw	0xFFFF	; pc=0x1AD0(0x35A0)
	.dw	0xFFFF	; pc=0x1AD1(0x35A2)
	.dw	0xFFFF	; pc=0x1AD2(0x35A4)
	.dw	0xFFFF	; pc=0x1AD3(0x35A6)
	.dw	0xFFFF	; pc=0x1AD4(0x35A8)
	.dw	0xFFFF	; pc=0x1AD5(0x35AA)
	.dw	0xFFFF	; pc=0x1AD6(0x35AC)
	.dw	0xFFFF	; pc=0x1AD7(0x35AE)
	.dw	0xFFFF	; pc=0x1AD8(0x35B0)
	.dw	0xFFFF	; pc=0x1AD9(0x35B2)
	.dw	0xFFFF	; pc=0x1ADA(0x35B4)
	.dw	0xFFFF	; pc=0x1ADB(0x35B6)
	.dw	0xFFFF	; pc=0x1ADC(0x35B8)
	.dw	0xFFFF	; pc=0x1ADD(0x35BA)
	.dw	0xFFFF	; pc=0x1ADE(0x35BC)
	.dw	0xFFFF	; pc=0x1ADF(0x35BE)
	.dw	0xFFFF	; pc=0x1AE0(0x35C0)
	.dw	0xFFFF	; pc=0x1AE1(0x35C2)
	.dw	0xFFFF	; pc=0x1AE2(0x35C4)
	.dw	0xFFFF	; pc=0x1AE3(0x35C6)
	.dw	0xFFFF	; pc=0x1AE4(0x35C8)
	.dw	0xFFFF	; pc=0x1AE5(0x35CA)
	.dw	0xFFFF	; pc=0x1AE6(0x35CC)
	.dw	0xFFFF	; pc=0x1AE7(0x35CE)
	.dw	0xFFFF	; pc=0x1AE8(0x35D0)
	.dw	0xFFFF	; pc=0x1AE9(0x35D2)
	.dw	0xFFFF	; pc=0x1AEA(0x35D4)
	.dw	0xFFFF	; pc=0x1AEB(0x35D6)
	.dw	0xFFFF	; pc=0x1AEC(0x35D8)
	.dw	0xFFFF	; pc=0x1AED(0x35DA)
	.dw	0xFFFF	; pc=0x1AEE(0x35DC)
	.dw	0xFFFF	; pc=0x1AEF(0x35DE)
	.dw	0xFFFF	; pc=0x1AF0(0x35E0)
	.dw	0xFFFF	; pc=0x1AF1(0x35E2)
	.dw	0xFFFF	; pc=0x1AF2(0x35E4)
	.dw	0xFFFF	; pc=0x1AF3(0x35E6)
	.dw	0xFFFF	; pc=0x1AF4(0x35E8)
	.dw	0xFFFF	; pc=0x1AF5(0x35EA)
	.dw	0xFFFF	; pc=0x1AF6(0x35EC)
	.dw	0xFFFF	; pc=0x1AF7(0x35EE)
	.dw	0xFFFF	; pc=0x1AF8(0x35F0)
	.dw	0xFFFF	; pc=0x1AF9(0x35F2)
	.dw	0xFFFF	; pc=0x1AFA(0x35F4)
	.dw	0xFFFF	; pc=0x1AFB(0x35F6)
	.dw	0xFFFF	; pc=0x1AFC(0x35F8)
	.dw	0xFFFF	; pc=0x1AFD(0x35FA)
	.dw	0xFFFF	; pc=0x1AFE(0x35FC)
	.dw	0xFFFF	; pc=0x1AFF(0x35FE)
	.dw	0xFFFF	; pc=0x1B00(0x3600)
	.dw	0xFFFF	; pc=0x1B01(0x3602)
	.dw	0xFFFF	; pc=0x1B02(0x3604)
	.dw	0xFFFF	; pc=0x1B03(0x3606)
	.dw	0xFFFF	; pc=0x1B04(0x3608)
	.dw	0xFFFF	; pc=0x1B05(0x360A)
	.dw	0xFFFF	; pc=0x1B06(0x360C)
	.dw	0xFFFF	; pc=0x1B07(0x360E)
	.dw	0xFFFF	; pc=0x1B08(0x3610)
	.dw	0xFFFF	; pc=0x1B09(0x3612)
	.dw	0xFFFF	; pc=0x1B0A(0x3614)
	.dw	0xFFFF	; pc=0x1B0B(0x3616)
	.dw	0xFFFF	; pc=0x1B0C(0x3618)
	.dw	0xFFFF	; pc=0x1B0D(0x361A)
	.dw	0xFFFF	; pc=0x1B0E(0x361C)
	.dw	0xFFFF	; pc=0x1B0F(0x361E)
	.dw	0xFFFF	; pc=0x1B10(0x3620)
	.dw	0xFFFF	; pc=0x1B11(0x3622)
	.dw	0xFFFF	; pc=0x1B12(0x3624)
	.dw	0xFFFF	; pc=0x1B13(0x3626)
	.dw	0xFFFF	; pc=0x1B14(0x3628)
	.dw	0xFFFF	; pc=0x1B15(0x362A)
	.dw	0xFFFF	; pc=0x1B16(0x362C)
	.dw	0xFFFF	; pc=0x1B17(0x362E)
	.dw	0xFFFF	; pc=0x1B18(0x3630)
	.dw	0xFFFF	; pc=0x1B19(0x3632)
	.dw	0xFFFF	; pc=0x1B1A(0x3634)
	.dw	0xFFFF	; pc=0x1B1B(0x3636)
	.dw	0xFFFF	; pc=0x1B1C(0x3638)
	.dw	0xFFFF	; pc=0x1B1D(0x363A)
	.dw	0xFFFF	; pc=0x1B1E(0x363C)
	.dw	0xFFFF	; pc=0x1B1F(0x363E)
	.dw	0xFFFF	; pc=0x1B20(0x3640)
	.dw	0xFFFF	; pc=0x1B21(0x3642)
	.dw	0xFFFF	; pc=0x1B22(0x3644)
	.dw	0xFFFF	; pc=0x1B23(0x3646)
	.dw	0xFFFF	; pc=0x1B24(0x3648)
	.dw	0xFFFF	; pc=0x1B25(0x364A)
	.dw	0xFFFF	; pc=0x1B26(0x364C)
	.dw	0xFFFF	; pc=0x1B27(0x364E)
	.dw	0xFFFF	; pc=0x1B28(0x3650)
	.dw	0xFFFF	; pc=0x1B29(0x3652)
	.dw	0xFFFF	; pc=0x1B2A(0x3654)
	.dw	0xFFFF	; pc=0x1B2B(0x3656)
	.dw	0xFFFF	; pc=0x1B2C(0x3658)
	.dw	0xFFFF	; pc=0x1B2D(0x365A)
	.dw	0xFFFF	; pc=0x1B2E(0x365C)
	.dw	0xFFFF	; pc=0x1B2F(0x365E)
	.dw	0xFFFF	; pc=0x1B30(0x3660)
	.dw	0xFFFF	; pc=0x1B31(0x3662)
	.dw	0xFFFF	; pc=0x1B32(0x3664)
	.dw	0xFFFF	; pc=0x1B33(0x3666)
	.dw	0xFFFF	; pc=0x1B34(0x3668)
	.dw	0xFFFF	; pc=0x1B35(0x366A)
	.dw	0xFFFF	; pc=0x1B36(0x366C)
	.dw	0xFFFF	; pc=0x1B37(0x366E)
	.dw	0xFFFF	; pc=0x1B38(0x3670)
	.dw	0xFFFF	; pc=0x1B39(0x3672)
	.dw	0xFFFF	; pc=0x1B3A(0x3674)
	.dw	0xFFFF	; pc=0x1B3B(0x3676)
	.dw	0xFFFF	; pc=0x1B3C(0x3678)
	.dw	0xFFFF	; pc=0x1B3D(0x367A)
	.dw	0xFFFF	; pc=0x1B3E(0x367C)
	.dw	0xFFFF	; pc=0x1B3F(0x367E)
	.dw	0xFFFF	; pc=0x1B40(0x3680)
	.dw	0xFFFF	; pc=0x1B41(0x3682)
	.dw	0xFFFF	; pc=0x1B42(0x3684)
	.dw	0xFFFF	; pc=0x1B43(0x3686)
	.dw	0xFFFF	; pc=0x1B44(0x3688)
	.dw	0xFFFF	; pc=0x1B45(0x368A)
	.dw	0xFFFF	; pc=0x1B46(0x368C)
	.dw	0xFFFF	; pc=0x1B47(0x368E)
	.dw	0xFFFF	; pc=0x1B48(0x3690)
	.dw	0xFFFF	; pc=0x1B49(0x3692)
	.dw	0xFFFF	; pc=0x1B4A(0x3694)
	.dw	0xFFFF	; pc=0x1B4B(0x3696)
	.dw	0xFFFF	; pc=0x1B4C(0x3698)
	.dw	0xFFFF	; pc=0x1B4D(0x369A)
	.dw	0xFFFF	; pc=0x1B4E(0x369C)
	.dw	0xFFFF	; pc=0x1B4F(0x369E)
	.dw	0xFFFF	; pc=0x1B50(0x36A0)
	.dw	0xFFFF	; pc=0x1B51(0x36A2)
	.dw	0xFFFF	; pc=0x1B52(0x36A4)
	.dw	0xFFFF	; pc=0x1B53(0x36A6)
	.dw	0xFFFF	; pc=0x1B54(0x36A8)
	.dw	0xFFFF	; pc=0x1B55(0x36AA)
	.dw	0xFFFF	; pc=0x1B56(0x36AC)
	.dw	0xFFFF	; pc=0x1B57(0x36AE)
	.dw	0xFFFF	; pc=0x1B58(0x36B0)
	.dw	0xFFFF	; pc=0x1B59(0x36B2)
	.dw	0xFFFF	; pc=0x1B5A(0x36B4)
	.dw	0xFFFF	; pc=0x1B5B(0x36B6)
	.dw	0xFFFF	; pc=0x1B5C(0x36B8)
	.dw	0xFFFF	; pc=0x1B5D(0x36BA)
	.dw	0xFFFF	; pc=0x1B5E(0x36BC)
	.dw	0xFFFF	; pc=0x1B5F(0x36BE)
	.dw	0xFFFF	; pc=0x1B60(0x36C0)
	.dw	0xFFFF	; pc=0x1B61(0x36C2)
	.dw	0xFFFF	; pc=0x1B62(0x36C4)
	.dw	0xFFFF	; pc=0x1B63(0x36C6)
	.dw	0xFFFF	; pc=0x1B64(0x36C8)
	.dw	0xFFFF	; pc=0x1B65(0x36CA)
	.dw	0xFFFF	; pc=0x1B66(0x36CC)
	.dw	0xFFFF	; pc=0x1B67(0x36CE)
	.dw	0xFFFF	; pc=0x1B68(0x36D0)
	.dw	0xFFFF	; pc=0x1B69(0x36D2)
	.dw	0xFFFF	; pc=0x1B6A(0x36D4)
	.dw	0xFFFF	; pc=0x1B6B(0x36D6)
	.dw	0xFFFF	; pc=0x1B6C(0x36D8)
	.dw	0xFFFF	; pc=0x1B6D(0x36DA)
	.dw	0xFFFF	; pc=0x1B6E(0x36DC)
	.dw	0xFFFF	; pc=0x1B6F(0x36DE)
	.dw	0xFFFF	; pc=0x1B70(0x36E0)
	.dw	0xFFFF	; pc=0x1B71(0x36E2)
	.dw	0xFFFF	; pc=0x1B72(0x36E4)
	.dw	0xFFFF	; pc=0x1B73(0x36E6)
	.dw	0xFFFF	; pc=0x1B74(0x36E8)
	.dw	0xFFFF	; pc=0x1B75(0x36EA)
	.dw	0xFFFF	; pc=0x1B76(0x36EC)
	.dw	0xFFFF	; pc=0x1B77(0x36EE)
	.dw	0xFFFF	; pc=0x1B78(0x36F0)
	.dw	0xFFFF	; pc=0x1B79(0x36F2)
	.dw	0xFFFF	; pc=0x1B7A(0x36F4)
	.dw	0xFFFF	; pc=0x1B7B(0x36F6)
	.dw	0xFFFF	; pc=0x1B7C(0x36F8)
	.dw	0xFFFF	; pc=0x1B7D(0x36FA)
	.dw	0xFFFF	; pc=0x1B7E(0x36FC)
	.dw	0xFFFF	; pc=0x1B7F(0x36FE)
	.dw	0xFFFF	; pc=0x1B80(0x3700)
	.dw	0xFFFF	; pc=0x1B81(0x3702)
	.dw	0xFFFF	; pc=0x1B82(0x3704)
	.dw	0xFFFF	; pc=0x1B83(0x3706)
	.dw	0xFFFF	; pc=0x1B84(0x3708)
	.dw	0xFFFF	; pc=0x1B85(0x370A)
	.dw	0xFFFF	; pc=0x1B86(0x370C)
	.dw	0xFFFF	; pc=0x1B87(0x370E)
	.dw	0xFFFF	; pc=0x1B88(0x3710)
	.dw	0xFFFF	; pc=0x1B89(0x3712)
	.dw	0xFFFF	; pc=0x1B8A(0x3714)
	.dw	0xFFFF	; pc=0x1B8B(0x3716)
	.dw	0xFFFF	; pc=0x1B8C(0x3718)
	.dw	0xFFFF	; pc=0x1B8D(0x371A)
	.dw	0xFFFF	; pc=0x1B8E(0x371C)
	.dw	0xFFFF	; pc=0x1B8F(0x371E)
	.dw	0xFFFF	; pc=0x1B90(0x3720)
	.dw	0xFFFF	; pc=0x1B91(0x3722)
	.dw	0xFFFF	; pc=0x1B92(0x3724)
	.dw	0xFFFF	; pc=0x1B93(0x3726)
	.dw	0xFFFF	; pc=0x1B94(0x3728)
	.dw	0xFFFF	; pc=0x1B95(0x372A)
	.dw	0xFFFF	; pc=0x1B96(0x372C)
	.dw	0xFFFF	; pc=0x1B97(0x372E)
	.dw	0xFFFF	; pc=0x1B98(0x3730)
	.dw	0xFFFF	; pc=0x1B99(0x3732)
	.dw	0xFFFF	; pc=0x1B9A(0x3734)
	.dw	0xFFFF	; pc=0x1B9B(0x3736)
	.dw	0xFFFF	; pc=0x1B9C(0x3738)
	.dw	0xFFFF	; pc=0x1B9D(0x373A)
	.dw	0xFFFF	; pc=0x1B9E(0x373C)
	.dw	0xFFFF	; pc=0x1B9F(0x373E)
	.dw	0xFFFF	; pc=0x1BA0(0x3740)
	.dw	0xFFFF	; pc=0x1BA1(0x3742)
	.dw	0xFFFF	; pc=0x1BA2(0x3744)
	.dw	0xFFFF	; pc=0x1BA3(0x3746)
	.dw	0xFFFF	; pc=0x1BA4(0x3748)
	.dw	0xFFFF	; pc=0x1BA5(0x374A)
	.dw	0xFFFF	; pc=0x1BA6(0x374C)
	.dw	0xFFFF	; pc=0x1BA7(0x374E)
	.dw	0xFFFF	; pc=0x1BA8(0x3750)
	.dw	0xFFFF	; pc=0x1BA9(0x3752)
	.dw	0xFFFF	; pc=0x1BAA(0x3754)
	.dw	0xFFFF	; pc=0x1BAB(0x3756)
	.dw	0xFFFF	; pc=0x1BAC(0x3758)
	.dw	0xFFFF	; pc=0x1BAD(0x375A)
	.dw	0xFFFF	; pc=0x1BAE(0x375C)
	.dw	0xFFFF	; pc=0x1BAF(0x375E)
	.dw	0xFFFF	; pc=0x1BB0(0x3760)
	.dw	0xFFFF	; pc=0x1BB1(0x3762)
	.dw	0xFFFF	; pc=0x1BB2(0x3764)
	.dw	0xFFFF	; pc=0x1BB3(0x3766)
	.dw	0xFFFF	; pc=0x1BB4(0x3768)
	.dw	0xFFFF	; pc=0x1BB5(0x376A)
	.dw	0xFFFF	; pc=0x1BB6(0x376C)
	.dw	0xFFFF	; pc=0x1BB7(0x376E)
	.dw	0xFFFF	; pc=0x1BB8(0x3770)
	.dw	0xFFFF	; pc=0x1BB9(0x3772)
	.dw	0xFFFF	; pc=0x1BBA(0x3774)
	.dw	0xFFFF	; pc=0x1BBB(0x3776)
	.dw	0xFFFF	; pc=0x1BBC(0x3778)
	.dw	0xFFFF	; pc=0x1BBD(0x377A)
	.dw	0xFFFF	; pc=0x1BBE(0x377C)
	.dw	0xFFFF	; pc=0x1BBF(0x377E)
	.dw	0xFFFF	; pc=0x1BC0(0x3780)
	.dw	0xFFFF	; pc=0x1BC1(0x3782)
	.dw	0xFFFF	; pc=0x1BC2(0x3784)
	.dw	0xFFFF	; pc=0x1BC3(0x3786)
	.dw	0xFFFF	; pc=0x1BC4(0x3788)
	.dw	0xFFFF	; pc=0x1BC5(0x378A)
	.dw	0xFFFF	; pc=0x1BC6(0x378C)
	.dw	0xFFFF	; pc=0x1BC7(0x378E)
	.dw	0xFFFF	; pc=0x1BC8(0x3790)
	.dw	0xFFFF	; pc=0x1BC9(0x3792)
	.dw	0xFFFF	; pc=0x1BCA(0x3794)
	.dw	0xFFFF	; pc=0x1BCB(0x3796)
	.dw	0xFFFF	; pc=0x1BCC(0x3798)
	.dw	0xFFFF	; pc=0x1BCD(0x379A)
	.dw	0xFFFF	; pc=0x1BCE(0x379C)
	.dw	0xFFFF	; pc=0x1BCF(0x379E)
	.dw	0xFFFF	; pc=0x1BD0(0x37A0)
	.dw	0xFFFF	; pc=0x1BD1(0x37A2)
	.dw	0xFFFF	; pc=0x1BD2(0x37A4)
	.dw	0xFFFF	; pc=0x1BD3(0x37A6)
	.dw	0xFFFF	; pc=0x1BD4(0x37A8)
	.dw	0xFFFF	; pc=0x1BD5(0x37AA)
	.dw	0xFFFF	; pc=0x1BD6(0x37AC)
	.dw	0xFFFF	; pc=0x1BD7(0x37AE)
	.dw	0xFFFF	; pc=0x1BD8(0x37B0)
	.dw	0xFFFF	; pc=0x1BD9(0x37B2)
	.dw	0xFFFF	; pc=0x1BDA(0x37B4)
	.dw	0xFFFF	; pc=0x1BDB(0x37B6)
	.dw	0xFFFF	; pc=0x1BDC(0x37B8)
	.dw	0xFFFF	; pc=0x1BDD(0x37BA)
	.dw	0xFFFF	; pc=0x1BDE(0x37BC)
	.dw	0xFFFF	; pc=0x1BDF(0x37BE)
	.dw	0xFFFF	; pc=0x1BE0(0x37C0)
	.dw	0xFFFF	; pc=0x1BE1(0x37C2)
	.dw	0xFFFF	; pc=0x1BE2(0x37C4)
	.dw	0xFFFF	; pc=0x1BE3(0x37C6)
	.dw	0xFFFF	; pc=0x1BE4(0x37C8)
	.dw	0xFFFF	; pc=0x1BE5(0x37CA)
	.dw	0xFFFF	; pc=0x1BE6(0x37CC)
	.dw	0xFFFF	; pc=0x1BE7(0x37CE)
	.dw	0xFFFF	; pc=0x1BE8(0x37D0)
	.dw	0xFFFF	; pc=0x1BE9(0x37D2)
	.dw	0xFFFF	; pc=0x1BEA(0x37D4)
	.dw	0xFFFF	; pc=0x1BEB(0x37D6)
	.dw	0xFFFF	; pc=0x1BEC(0x37D8)
	.dw	0xFFFF	; pc=0x1BED(0x37DA)
	.dw	0xFFFF	; pc=0x1BEE(0x37DC)
	.dw	0xFFFF	; pc=0x1BEF(0x37DE)
	.dw	0xFFFF	; pc=0x1BF0(0x37E0)
	.dw	0xFFFF	; pc=0x1BF1(0x37E2)
	.dw	0xFFFF	; pc=0x1BF2(0x37E4)
	.dw	0xFFFF	; pc=0x1BF3(0x37E6)
	.dw	0xFFFF	; pc=0x1BF4(0x37E8)
	.dw	0xFFFF	; pc=0x1BF5(0x37EA)
	.dw	0xFFFF	; pc=0x1BF6(0x37EC)
	.dw	0xFFFF	; pc=0x1BF7(0x37EE)
	.dw	0xFFFF	; pc=0x1BF8(0x37F0)
	.dw	0xFFFF	; pc=0x1BF9(0x37F2)
	.dw	0xFFFF	; pc=0x1BFA(0x37F4)
	.dw	0xFFFF	; pc=0x1BFB(0x37F6)
	.dw	0xFFFF	; pc=0x1BFC(0x37F8)
	.dw	0xFFFF	; pc=0x1BFD(0x37FA)
	.dw	0xFFFF	; pc=0x1BFE(0x37FC)
	.dw	0xFFFF	; pc=0x1BFF(0x37FE)
	ldi	r19,kFF
	out	SPL,r19
	ldi	r19,k03
	out	SPH,r19
	ldi	r19,k00
	out	UBRRHI,r19
	ldi	r19,k17
	out	UBBR,r19
	ldi	r19,k40
	out	UCSRB,r19
	ldi	r19,k18
	out	UCSRA,r19
	ldi	r19,k86
	out	UBRRHI,r19
L1C0E:
	 rcall	L1CDB
	mov	r26,r19
	cpi	r26,k70
	 brne	L1C15
;	-----		branch on last line
	ldi	r19,k53
	 rcall	L1CD7
	rjmp	L1CD0
;	-----------	jump on last line
L1C15:
	cpi	r26,k61
	 brne	L1C1A
;	-----		branch on last line
	ldi	r19,k59
	 rcall	L1CD7
	rjmp	L1CD0
;	-----------	jump on last line
L1C1A:
	cpi	r26,k53
	 brne	L1C2B
;	-----		branch on last line
	ldi	r19,k41
	 rcall	L1CD7
	ldi	r19,k56
	 rcall	L1CD7
	ldi	r19,k52
	 rcall	L1CD7
	ldi	r19,k42
	 rcall	L1CD7
	ldi	r19,k4F
	 rcall	L1CD7
	ldi	r19,k4F
	 rcall	L1CD7
	ldi	r19,k54
	 rcall	L1CD7
	rjmp	L1CD0
;	-----------	jump on last line
L1C2B:
	cpi	r26,k74
	 brne	L1C32
;	-----		branch on last line
	ldi	r19,k64
	 rcall	L1CD7
	ldi	r19,k00
	 rcall	L1CD7
	rjmp	L1CD0
;	-----------	jump on last line
L1C32:
	cpi	r26,k56
	 brne	L1C39
;	-----		branch on last line
	ldi	r19,k32
	 rcall	L1CD7
	ldi	r19,k31
	 rcall	L1CD7
	rjmp	L1CD0
;	-----------	jump on last line
L1C39:
	cpi	r26,k54
	 brne	L1C3C
;	-----		branch on last line
	rjmp	L1CC6
;	-----------	jump on last line
L1C3C:
	cpi	r26,k41
	 brne	L1C47
;	-----		branch on last line
	 rcall	L1CDB
	mov	r31,r19
	 rcall	L1CDB
	mov	r30,r19
	lsl	r30
	rol	r31
	ldi	r19,k0D
	 rcall	L1CD7
	rjmp	L1CD0
;	-----------	jump on last line
L1C47:
	cpi	r26,k50
	 brne	L1C4C
;	-----		branch on last line
	ldi	r19,k0D
	 rcall	L1CD7
	rjmp	L1CD0
;	-----------	jump on last line
L1C4C:
	cpi	r26,k4C
	 brne	L1C51
;	-----		branch on last line
	ldi	r19,k0D
	 rcall	L1CD7
	rjmp	L1CD0
;	-----------	jump on last line
L1C51:
	cpi	r26,k73
	 brne	L1C5A
;	-----		branch on last line
	ldi	r19,k1E
	 rcall	L1CD7
	ldi	r19,k94
	 rcall	L1CD7
	ldi	r19,k02
	 rcall	L1CD7
	rjmp	L1CD0
;	-----------	jump on last line
L1C5A:
	cpi	r26,k64
	 brne	L1C65
;	-----		branch on last line
	out	EEARL,r30
	out	EEARH,r31
	sbi	EECR,b0
	in	r0,EEDR
	subi	r30,kFF
	sbci	r31,kFF
	mov	r19,r0
	 rcall	L1CD7
	rjmp	L1CD0
;	-----------	jump on last line
L1C65:
	cpi	r26,k52
	 brne	L1C73
;	-----		branch on last line
	lpm
	mov	r1,r0
	subi	r30,kFF
	sbci	r31,kFF
	lpm
	subi	r30,kFF
	sbci	r31,kFF
	mov	r19,r0
	 rcall	L1CD7
	mov	r19,r1
	 rcall	L1CD7
	rjmp	L1CD0
;	-----------	jump on last line
L1C73:
	cpi	r26,k63
	 brne	L1C96
;	-----		branch on last line
	 rcall	L1CDB
	mov	r15,r19
	mov	r16,r30
	andi	r16,k7F
	tst	r16
	 brne	L1C92
;	-----		branch on last line
	ldi	r19,k03
	out	SPMCR,r19
	spm
	 rcall	L1CD1
	ldi	r19,kFF
	mov	r0,r19
	mov	r1,r19
	push	r31
	push	r30
	ldi	r17,k00
L1C85:
	ldi	r19,k01
	out	SPMCR,r19
	spm
	adiw	r30,k02
	cpi	r17,k3F
	 breq	L1C8D
;	-----		branch on last line
	inc	r17
	rjmp	L1C85
;	-----------	jump on last line
L1C8D:
	pop	r30
	pop	r31
L1C8F:
	in	r19,SPMCR
;	--------- this is skippy
	 sbrc	r19,b0
	 rjmp	L1C8F
;	--------- last may be skipped
; pc=0x1C92(0x3924)
;
L1C92:
	mov	r0,r15
	ldi	r19,k0D
	 rcall	L1CD7
	rjmp	L1CD0
;	-----------	jump on last line
L1C96:
	cpi	r26,k43
	 brne	L1CA1
;	-----		branch on last line
	 rcall	L1CDB
	mov	r1,r19
	ldi	r19,k01
	out	SPMCR,r19
	spm
	adiw	r30,k02
	ldi	r19,k0D
	 rcall	L1CD7
	rjmp	L1CD0
;	-----------	jump on last line
L1CA1:
	cpi	r26,k6D
	 brne	L1CAA
;	-----		branch on last line
	ldi	r19,k05
	out	SPMCR,r19
	spm
	 rcall	L1CD1
	ldi	r19,k0D
	 rcall	L1CD7
	rjmp	L1CD0
;	-----------	jump on last line
L1CAA:
	cpi	r26,k65
	 brne	L1CAF
;	-----		branch on last line
	ldi	r19,k0D
	 rcall	L1CD7
	rjmp	L1CD0
;	-----------	jump on last line
L1CAF:
	cpi	r26,k55
	 brne	L1CC1
;	-----		branch on last line
	ldi	r30,k00
	ldi	r31,k00
	ldi	r16,k00
L1CB4:
	ldi	r19,k03
	out	SPMCR,r19
	spm
	 rcall	L1CD1
	subi	r30,k80
	sbci	r31,kFF
	cpi	r16,k70
	 breq	L1CBE
;	-----		branch on last line
	inc	r16
	rjmp	L1CB4
;	-----------	jump on last line
L1CBE:
	ldi	r19,k0D
	 rcall	L1CD7
	rjmp	L1CD0
;	-----------	jump on last line
L1CC1:
	cpi	r26,k78
	 brne	L1CC4
;	-----		branch on last line
	rjmp	L1CC6
;	-----------	jump on last line
L1CC4:
	cpi	r26,k79
	 brne	L1CCA
;	-----		branch on last line
L1CC6:
	 rcall	L1CDB
	ldi	r19,k0D
	 rcall	L1CD7
	rjmp	L1CD0
;	-----------	jump on last line
L1CCA:
	cpi	r26,k1B
	 brne	L1CCD
;	-----		branch on last line
	rjmp	L1CD0
;	-----------	jump on last line
L1CCD:
	ldi	r19,k3F
	 rcall	L1CD7
	rjmp	L1CD0
;	-----------	jump on last line
L1CD0:
	rjmp	L1C0E
;	-----------	jump on last line
L1CD1:
	in	r19,SPMCR
;	--------- this is skippy
	 sbrc	r19,b0
	 rjmp	L1CD1
;	--------- last may be skipped
; pc=0x1CD4(0x39A8)
;
	ldi	r19,k11
	out	SPMCR,r19
	ret
;----------------------*
; pc=0x1CD7(0x39AE)
;
L1CD7:
;	--------- this is skippy
	 sbis	UCSRB,b5
	 rjmp	L1CD7
;	--------- last may be skipped
; pc=0x1CD9(0x39B2)
;
	out	UDR,r19
	ret
;----------------------*
; pc=0x1CDB(0x39B6)
;
L1CDB:
;	--------- this is skippy
	 sbis	UCSRB,b7
	 rjmp	L1CDB
;	--------- last may be skipped
; pc=0x1CDD(0x39BA)
;
	in	r19,UDR
	ret
;----------------------*
; pc=0x1CDF(0x39BE)
;
L1CDF:
	push	r31
	push	r30
	ldi	r30,k33
	ldi	r31,k07
L1CE3:
	sbiw	r30,k01
	 brne	L1CE3
;	-----		branch on last line
	pop	r30
	pop	r31
	subi	r30,k01
	sbci	r31,k00
	 brne	L1CDF
;	-----		branch on last line
	ret
;----------------------*
; pc=0x1CEB(0x39D6)
;
	.dw	0xFFFF	; pc=0x1CEB(0x39D6)
	.dw	0xFFFF	; pc=0x1CEC(0x39D8)
	.dw	0xFFFF	; pc=0x1CED(0x39DA)
	.dw	0xFFFF	; pc=0x1CEE(0x39DC)
	.dw	0xFFFF	; pc=0x1CEF(0x39DE)
	.dw	0xFFFF	; pc=0x1CF0(0x39E0)
	.dw	0xFFFF	; pc=0x1CF1(0x39E2)
	.dw	0xFFFF	; pc=0x1CF2(0x39E4)
	.dw	0xFFFF	; pc=0x1CF3(0x39E6)
	.dw	0xFFFF	; pc=0x1CF4(0x39E8)
	.dw	0xFFFF	; pc=0x1CF5(0x39EA)
	.dw	0xFFFF	; pc=0x1CF6(0x39EC)
	.dw	0xFFFF	; pc=0x1CF7(0x39EE)
	.dw	0xFFFF	; pc=0x1CF8(0x39F0)
	.dw	0xFFFF	; pc=0x1CF9(0x39F2)
	.dw	0xFFFF	; pc=0x1CFA(0x39F4)
	.dw	0xFFFF	; pc=0x1CFB(0x39F6)
	.dw	0xFFFF	; pc=0x1CFC(0x39F8)
	.dw	0xFFFF	; pc=0x1CFD(0x39FA)
	.dw	0xFFFF	; pc=0x1CFE(0x39FC)
	.dw	0xFFFF	; pc=0x1CFF(0x39FE)
	.dw	0xFFFF	; pc=0x1D00(0x3A00)
	.dw	0xFFFF	; pc=0x1D01(0x3A02)
	.dw	0xFFFF	; pc=0x1D02(0x3A04)
	.dw	0xFFFF	; pc=0x1D03(0x3A06)
	.dw	0xFFFF	; pc=0x1D04(0x3A08)
	.dw	0xFFFF	; pc=0x1D05(0x3A0A)
	.dw	0xFFFF	; pc=0x1D06(0x3A0C)
	.dw	0xFFFF	; pc=0x1D07(0x3A0E)
	.dw	0xFFFF	; pc=0x1D08(0x3A10)
	.dw	0xFFFF	; pc=0x1D09(0x3A12)
	.dw	0xFFFF	; pc=0x1D0A(0x3A14)
	.dw	0xFFFF	; pc=0x1D0B(0x3A16)
	.dw	0xFFFF	; pc=0x1D0C(0x3A18)
	.dw	0xFFFF	; pc=0x1D0D(0x3A1A)
	.dw	0xFFFF	; pc=0x1D0E(0x3A1C)
	.dw	0xFFFF	; pc=0x1D0F(0x3A1E)
	.dw	0xFFFF	; pc=0x1D10(0x3A20)
	.dw	0xFFFF	; pc=0x1D11(0x3A22)
	.dw	0xFFFF	; pc=0x1D12(0x3A24)
	.dw	0xFFFF	; pc=0x1D13(0x3A26)
	.dw	0xFFFF	; pc=0x1D14(0x3A28)
	.dw	0xFFFF	; pc=0x1D15(0x3A2A)
	.dw	0xFFFF	; pc=0x1D16(0x3A2C)
	.dw	0xFFFF	; pc=0x1D17(0x3A2E)
	.dw	0xFFFF	; pc=0x1D18(0x3A30)
	.dw	0xFFFF	; pc=0x1D19(0x3A32)
	.dw	0xFFFF	; pc=0x1D1A(0x3A34)
	.dw	0xFFFF	; pc=0x1D1B(0x3A36)
	.dw	0xFFFF	; pc=0x1D1C(0x3A38)
	.dw	0xFFFF	; pc=0x1D1D(0x3A3A)
	.dw	0xFFFF	; pc=0x1D1E(0x3A3C)
	.dw	0xFFFF	; pc=0x1D1F(0x3A3E)
	.dw	0xFFFF	; pc=0x1D20(0x3A40)
	.dw	0xFFFF	; pc=0x1D21(0x3A42)
	.dw	0xFFFF	; pc=0x1D22(0x3A44)
	.dw	0xFFFF	; pc=0x1D23(0x3A46)
	.dw	0xFFFF	; pc=0x1D24(0x3A48)
	.dw	0xFFFF	; pc=0x1D25(0x3A4A)
	.dw	0xFFFF	; pc=0x1D26(0x3A4C)
	.dw	0xFFFF	; pc=0x1D27(0x3A4E)
	.dw	0xFFFF	; pc=0x1D28(0x3A50)
	.dw	0xFFFF	; pc=0x1D29(0x3A52)
	.dw	0xFFFF	; pc=0x1D2A(0x3A54)
	.dw	0xFFFF	; pc=0x1D2B(0x3A56)
	.dw	0xFFFF	; pc=0x1D2C(0x3A58)
	.dw	0xFFFF	; pc=0x1D2D(0x3A5A)
	.dw	0xFFFF	; pc=0x1D2E(0x3A5C)
	.dw	0xFFFF	; pc=0x1D2F(0x3A5E)
	.dw	0xFFFF	; pc=0x1D30(0x3A60)
	.dw	0xFFFF	; pc=0x1D31(0x3A62)
	.dw	0xFFFF	; pc=0x1D32(0x3A64)
	.dw	0xFFFF	; pc=0x1D33(0x3A66)
	.dw	0xFFFF	; pc=0x1D34(0x3A68)
	.dw	0xFFFF	; pc=0x1D35(0x3A6A)
	.dw	0xFFFF	; pc=0x1D36(0x3A6C)
	.dw	0xFFFF	; pc=0x1D37(0x3A6E)
	.dw	0xFFFF	; pc=0x1D38(0x3A70)
	.dw	0xFFFF	; pc=0x1D39(0x3A72)
	.dw	0xFFFF	; pc=0x1D3A(0x3A74)
	.dw	0xFFFF	; pc=0x1D3B(0x3A76)
	.dw	0xFFFF	; pc=0x1D3C(0x3A78)
	.dw	0xFFFF	; pc=0x1D3D(0x3A7A)
	.dw	0xFFFF	; pc=0x1D3E(0x3A7C)
	.dw	0xFFFF	; pc=0x1D3F(0x3A7E)
	.dw	0xFFFF	; pc=0x1D40(0x3A80)
	.dw	0xFFFF	; pc=0x1D41(0x3A82)
	.dw	0xFFFF	; pc=0x1D42(0x3A84)
	.dw	0xFFFF	; pc=0x1D43(0x3A86)
	.dw	0xFFFF	; pc=0x1D44(0x3A88)
	.dw	0xFFFF	; pc=0x1D45(0x3A8A)
	.dw	0xFFFF	; pc=0x1D46(0x3A8C)
	.dw	0xFFFF	; pc=0x1D47(0x3A8E)
	.dw	0xFFFF	; pc=0x1D48(0x3A90)
	.dw	0xFFFF	; pc=0x1D49(0x3A92)
	.dw	0xFFFF	; pc=0x1D4A(0x3A94)
	.dw	0xFFFF	; pc=0x1D4B(0x3A96)
	.dw	0xFFFF	; pc=0x1D4C(0x3A98)
	.dw	0xFFFF	; pc=0x1D4D(0x3A9A)
	.dw	0xFFFF	; pc=0x1D4E(0x3A9C)
	.dw	0xFFFF	; pc=0x1D4F(0x3A9E)
	.dw	0xFFFF	; pc=0x1D50(0x3AA0)
	.dw	0xFFFF	; pc=0x1D51(0x3AA2)
	.dw	0xFFFF	; pc=0x1D52(0x3AA4)
	.dw	0xFFFF	; pc=0x1D53(0x3AA6)
	.dw	0xFFFF	; pc=0x1D54(0x3AA8)
	.dw	0xFFFF	; pc=0x1D55(0x3AAA)
	.dw	0xFFFF	; pc=0x1D56(0x3AAC)
	.dw	0xFFFF	; pc=0x1D57(0x3AAE)
	.dw	0xFFFF	; pc=0x1D58(0x3AB0)
	.dw	0xFFFF	; pc=0x1D59(0x3AB2)
	.dw	0xFFFF	; pc=0x1D5A(0x3AB4)
	.dw	0xFFFF	; pc=0x1D5B(0x3AB6)
	.dw	0xFFFF	; pc=0x1D5C(0x3AB8)
	.dw	0xFFFF	; pc=0x1D5D(0x3ABA)
	.dw	0xFFFF	; pc=0x1D5E(0x3ABC)
	.dw	0xFFFF	; pc=0x1D5F(0x3ABE)
	.dw	0xFFFF	; pc=0x1D60(0x3AC0)
	.dw	0xFFFF	; pc=0x1D61(0x3AC2)
	.dw	0xFFFF	; pc=0x1D62(0x3AC4)
	.dw	0xFFFF	; pc=0x1D63(0x3AC6)
	.dw	0xFFFF	; pc=0x1D64(0x3AC8)
	.dw	0xFFFF	; pc=0x1D65(0x3ACA)
	.dw	0xFFFF	; pc=0x1D66(0x3ACC)
	.dw	0xFFFF	; pc=0x1D67(0x3ACE)
	.dw	0xFFFF	; pc=0x1D68(0x3AD0)
	.dw	0xFFFF	; pc=0x1D69(0x3AD2)
	.dw	0xFFFF	; pc=0x1D6A(0x3AD4)
	.dw	0xFFFF	; pc=0x1D6B(0x3AD6)
	.dw	0xFFFF	; pc=0x1D6C(0x3AD8)
	.dw	0xFFFF	; pc=0x1D6D(0x3ADA)
	.dw	0xFFFF	; pc=0x1D6E(0x3ADC)
	.dw	0xFFFF	; pc=0x1D6F(0x3ADE)
	.dw	0xFFFF	; pc=0x1D70(0x3AE0)
	.dw	0xFFFF	; pc=0x1D71(0x3AE2)
	.dw	0xFFFF	; pc=0x1D72(0x3AE4)
	.dw	0xFFFF	; pc=0x1D73(0x3AE6)
	.dw	0xFFFF	; pc=0x1D74(0x3AE8)
	.dw	0xFFFF	; pc=0x1D75(0x3AEA)
	.dw	0xFFFF	; pc=0x1D76(0x3AEC)
	.dw	0xFFFF	; pc=0x1D77(0x3AEE)
	.dw	0xFFFF	; pc=0x1D78(0x3AF0)
	.dw	0xFFFF	; pc=0x1D79(0x3AF2)
	.dw	0xFFFF	; pc=0x1D7A(0x3AF4)
	.dw	0xFFFF	; pc=0x1D7B(0x3AF6)
	.dw	0xFFFF	; pc=0x1D7C(0x3AF8)
	.dw	0xFFFF	; pc=0x1D7D(0x3AFA)
	.dw	0xFFFF	; pc=0x1D7E(0x3AFC)
	.dw	0xFFFF	; pc=0x1D7F(0x3AFE)
	.dw	0xFFFF	; pc=0x1D80(0x3B00)
	.dw	0xFFFF	; pc=0x1D81(0x3B02)
	.dw	0xFFFF	; pc=0x1D82(0x3B04)
	.dw	0xFFFF	; pc=0x1D83(0x3B06)
	.dw	0xFFFF	; pc=0x1D84(0x3B08)
	.dw	0xFFFF	; pc=0x1D85(0x3B0A)
	.dw	0xFFFF	; pc=0x1D86(0x3B0C)
	.dw	0xFFFF	; pc=0x1D87(0x3B0E)
	.dw	0xFFFF	; pc=0x1D88(0x3B10)
	.dw	0xFFFF	; pc=0x1D89(0x3B12)
	.dw	0xFFFF	; pc=0x1D8A(0x3B14)
	.dw	0xFFFF	; pc=0x1D8B(0x3B16)
	.dw	0xFFFF	; pc=0x1D8C(0x3B18)
	.dw	0xFFFF	; pc=0x1D8D(0x3B1A)
	.dw	0xFFFF	; pc=0x1D8E(0x3B1C)
	.dw	0xFFFF	; pc=0x1D8F(0x3B1E)
	.dw	0xFFFF	; pc=0x1D90(0x3B20)
	.dw	0xFFFF	; pc=0x1D91(0x3B22)
	.dw	0xFFFF	; pc=0x1D92(0x3B24)
	.dw	0xFFFF	; pc=0x1D93(0x3B26)
	.dw	0xFFFF	; pc=0x1D94(0x3B28)
	.dw	0xFFFF	; pc=0x1D95(0x3B2A)
	.dw	0xFFFF	; pc=0x1D96(0x3B2C)
	.dw	0xFFFF	; pc=0x1D97(0x3B2E)
	.dw	0xFFFF	; pc=0x1D98(0x3B30)
	.dw	0xFFFF	; pc=0x1D99(0x3B32)
	.dw	0xFFFF	; pc=0x1D9A(0x3B34)
	.dw	0xFFFF	; pc=0x1D9B(0x3B36)
	.dw	0xFFFF	; pc=0x1D9C(0x3B38)
	.dw	0xFFFF	; pc=0x1D9D(0x3B3A)
	.dw	0xFFFF	; pc=0x1D9E(0x3B3C)
	.dw	0xFFFF	; pc=0x1D9F(0x3B3E)
	.dw	0xFFFF	; pc=0x1DA0(0x3B40)
	.dw	0xFFFF	; pc=0x1DA1(0x3B42)
	.dw	0xFFFF	; pc=0x1DA2(0x3B44)
	.dw	0xFFFF	; pc=0x1DA3(0x3B46)
	.dw	0xFFFF	; pc=0x1DA4(0x3B48)
	.dw	0xFFFF	; pc=0x1DA5(0x3B4A)
	.dw	0xFFFF	; pc=0x1DA6(0x3B4C)
	.dw	0xFFFF	; pc=0x1DA7(0x3B4E)
	.dw	0xFFFF	; pc=0x1DA8(0x3B50)
	.dw	0xFFFF	; pc=0x1DA9(0x3B52)
	.dw	0xFFFF	; pc=0x1DAA(0x3B54)
	.dw	0xFFFF	; pc=0x1DAB(0x3B56)
	.dw	0xFFFF	; pc=0x1DAC(0x3B58)
	.dw	0xFFFF	; pc=0x1DAD(0x3B5A)
	.dw	0xFFFF	; pc=0x1DAE(0x3B5C)
	.dw	0xFFFF	; pc=0x1DAF(0x3B5E)
	.dw	0xFFFF	; pc=0x1DB0(0x3B60)
	.dw	0xFFFF	; pc=0x1DB1(0x3B62)
	.dw	0xFFFF	; pc=0x1DB2(0x3B64)
	.dw	0xFFFF	; pc=0x1DB3(0x3B66)
	.dw	0xFFFF	; pc=0x1DB4(0x3B68)
	.dw	0xFFFF	; pc=0x1DB5(0x3B6A)
	.dw	0xFFFF	; pc=0x1DB6(0x3B6C)
	.dw	0xFFFF	; pc=0x1DB7(0x3B6E)
	.dw	0xFFFF	; pc=0x1DB8(0x3B70)
	.dw	0xFFFF	; pc=0x1DB9(0x3B72)
	.dw	0xFFFF	; pc=0x1DBA(0x3B74)
	.dw	0xFFFF	; pc=0x1DBB(0x3B76)
	.dw	0xFFFF	; pc=0x1DBC(0x3B78)
	.dw	0xFFFF	; pc=0x1DBD(0x3B7A)
	.dw	0xFFFF	; pc=0x1DBE(0x3B7C)
	.dw	0xFFFF	; pc=0x1DBF(0x3B7E)
	.dw	0xFFFF	; pc=0x1DC0(0x3B80)
	.dw	0xFFFF	; pc=0x1DC1(0x3B82)
	.dw	0xFFFF	; pc=0x1DC2(0x3B84)
	.dw	0xFFFF	; pc=0x1DC3(0x3B86)
	.dw	0xFFFF	; pc=0x1DC4(0x3B88)
	.dw	0xFFFF	; pc=0x1DC5(0x3B8A)
	.dw	0xFFFF	; pc=0x1DC6(0x3B8C)
	.dw	0xFFFF	; pc=0x1DC7(0x3B8E)
	.dw	0xFFFF	; pc=0x1DC8(0x3B90)
	.dw	0xFFFF	; pc=0x1DC9(0x3B92)
	.dw	0xFFFF	; pc=0x1DCA(0x3B94)
	.dw	0xFFFF	; pc=0x1DCB(0x3B96)
	.dw	0xFFFF	; pc=0x1DCC(0x3B98)
	.dw	0xFFFF	; pc=0x1DCD(0x3B9A)
	.dw	0xFFFF	; pc=0x1DCE(0x3B9C)
	.dw	0xFFFF	; pc=0x1DCF(0x3B9E)
	.dw	0xFFFF	; pc=0x1DD0(0x3BA0)
	.dw	0xFFFF	; pc=0x1DD1(0x3BA2)
	.dw	0xFFFF	; pc=0x1DD2(0x3BA4)
	.dw	0xFFFF	; pc=0x1DD3(0x3BA6)
	.dw	0xFFFF	; pc=0x1DD4(0x3BA8)
	.dw	0xFFFF	; pc=0x1DD5(0x3BAA)
	.dw	0xFFFF	; pc=0x1DD6(0x3BAC)
	.dw	0xFFFF	; pc=0x1DD7(0x3BAE)
	.dw	0xFFFF	; pc=0x1DD8(0x3BB0)
	.dw	0xFFFF	; pc=0x1DD9(0x3BB2)
	.dw	0xFFFF	; pc=0x1DDA(0x3BB4)
	.dw	0xFFFF	; pc=0x1DDB(0x3BB6)
	.dw	0xFFFF	; pc=0x1DDC(0x3BB8)
	.dw	0xFFFF	; pc=0x1DDD(0x3BBA)
	.dw	0xFFFF	; pc=0x1DDE(0x3BBC)
	.dw	0xFFFF	; pc=0x1DDF(0x3BBE)
	.dw	0xFFFF	; pc=0x1DE0(0x3BC0)
	.dw	0xFFFF	; pc=0x1DE1(0x3BC2)
	.dw	0xFFFF	; pc=0x1DE2(0x3BC4)
	.dw	0xFFFF	; pc=0x1DE3(0x3BC6)
	.dw	0xFFFF	; pc=0x1DE4(0x3BC8)
	.dw	0xFFFF	; pc=0x1DE5(0x3BCA)
	.dw	0xFFFF	; pc=0x1DE6(0x3BCC)
	.dw	0xFFFF	; pc=0x1DE7(0x3BCE)
	.dw	0xFFFF	; pc=0x1DE8(0x3BD0)
	.dw	0xFFFF	; pc=0x1DE9(0x3BD2)
	.dw	0xFFFF	; pc=0x1DEA(0x3BD4)
	.dw	0xFFFF	; pc=0x1DEB(0x3BD6)
	.dw	0xFFFF	; pc=0x1DEC(0x3BD8)
	.dw	0xFFFF	; pc=0x1DED(0x3BDA)
	.dw	0xFFFF	; pc=0x1DEE(0x3BDC)
	.dw	0xFFFF	; pc=0x1DEF(0x3BDE)
	.dw	0xFFFF	; pc=0x1DF0(0x3BE0)
	.dw	0xFFFF	; pc=0x1DF1(0x3BE2)
	.dw	0xFFFF	; pc=0x1DF2(0x3BE4)
	.dw	0xFFFF	; pc=0x1DF3(0x3BE6)
	.dw	0xFFFF	; pc=0x1DF4(0x3BE8)
	.dw	0xFFFF	; pc=0x1DF5(0x3BEA)
	.dw	0xFFFF	; pc=0x1DF6(0x3BEC)
	.dw	0xFFFF	; pc=0x1DF7(0x3BEE)
	.dw	0xFFFF	; pc=0x1DF8(0x3BF0)
	.dw	0xFFFF	; pc=0x1DF9(0x3BF2)
	.dw	0xFFFF	; pc=0x1DFA(0x3BF4)
	.dw	0xFFFF	; pc=0x1DFB(0x3BF6)
	.dw	0xFFFF	; pc=0x1DFC(0x3BF8)
	.dw	0xFFFF	; pc=0x1DFD(0x3BFA)
	.dw	0xFFFF	; pc=0x1DFE(0x3BFC)
	.dw	0xFFFF	; pc=0x1DFF(0x3BFE)
L1E00:
	.dw	0xFFFF	; pc=0x1E00(0x3C00)
	.dw	0xFFFF	; pc=0x1E01(0x3C02)
	.dw	0xFFFF	; pc=0x1E02(0x3C04)
	.dw	0xFFFF	; pc=0x1E03(0x3C06)
	.dw	0xFFFF	; pc=0x1E04(0x3C08)
	.dw	0xFFFF	; pc=0x1E05(0x3C0A)
	.dw	0xFFFF	; pc=0x1E06(0x3C0C)
	.dw	0xFFFF	; pc=0x1E07(0x3C0E)
	.dw	0xFFFF	; pc=0x1E08(0x3C10)
	.dw	0xFFFF	; pc=0x1E09(0x3C12)
	.dw	0xFFFF	; pc=0x1E0A(0x3C14)
	.dw	0xFFFF	; pc=0x1E0B(0x3C16)
	.dw	0xFFFF	; pc=0x1E0C(0x3C18)
	.dw	0xFFFF	; pc=0x1E0D(0x3C1A)
	.dw	0xFFFF	; pc=0x1E0E(0x3C1C)
	.dw	0xFFFF	; pc=0x1E0F(0x3C1E)
	.dw	0xFFFF	; pc=0x1E10(0x3C20)
	.dw	0xFFFF	; pc=0x1E11(0x3C22)
	.dw	0xFFFF	; pc=0x1E12(0x3C24)
	.dw	0xFFFF	; pc=0x1E13(0x3C26)
	.dw	0xFFFF	; pc=0x1E14(0x3C28)
	.dw	0xFFFF	; pc=0x1E15(0x3C2A)
	.dw	0xFFFF	; pc=0x1E16(0x3C2C)
	.dw	0xFFFF	; pc=0x1E17(0x3C2E)
	.dw	0xFFFF	; pc=0x1E18(0x3C30)
	.dw	0xFFFF	; pc=0x1E19(0x3C32)
	.dw	0xFFFF	; pc=0x1E1A(0x3C34)
	.dw	0xFFFF	; pc=0x1E1B(0x3C36)
	.dw	0xFFFF	; pc=0x1E1C(0x3C38)
	.dw	0xFFFF	; pc=0x1E1D(0x3C3A)
	.dw	0xFFFF	; pc=0x1E1E(0x3C3C)
	.dw	0xFFFF	; pc=0x1E1F(0x3C3E)
	.dw	0xFFFF	; pc=0x1E20(0x3C40)
	.dw	0xFFFF	; pc=0x1E21(0x3C42)
	.dw	0xFFFF	; pc=0x1E22(0x3C44)
	.dw	0xFFFF	; pc=0x1E23(0x3C46)
	.dw	0xFFFF	; pc=0x1E24(0x3C48)
	.dw	0xFFFF	; pc=0x1E25(0x3C4A)
	.dw	0xFFFF	; pc=0x1E26(0x3C4C)
	.dw	0xFFFF	; pc=0x1E27(0x3C4E)
	.dw	0xFFFF	; pc=0x1E28(0x3C50)
	.dw	0xFFFF	; pc=0x1E29(0x3C52)
	.dw	0xFFFF	; pc=0x1E2A(0x3C54)
	.dw	0xFFFF	; pc=0x1E2B(0x3C56)
	.dw	0xFFFF	; pc=0x1E2C(0x3C58)
	.dw	0xFFFF	; pc=0x1E2D(0x3C5A)
	.dw	0xFFFF	; pc=0x1E2E(0x3C5C)
	.dw	0xFFFF	; pc=0x1E2F(0x3C5E)
	.dw	0xFFFF	; pc=0x1E30(0x3C60)
	.dw	0xFFFF	; pc=0x1E31(0x3C62)
	.dw	0xFFFF	; pc=0x1E32(0x3C64)
	.dw	0xFFFF	; pc=0x1E33(0x3C66)
	.dw	0xFFFF	; pc=0x1E34(0x3C68)
	.dw	0xFFFF	; pc=0x1E35(0x3C6A)
	.dw	0xFFFF	; pc=0x1E36(0x3C6C)
	.dw	0xFFFF	; pc=0x1E37(0x3C6E)
	.dw	0xFFFF	; pc=0x1E38(0x3C70)
	.dw	0xFFFF	; pc=0x1E39(0x3C72)
	.dw	0xFFFF	; pc=0x1E3A(0x3C74)
	.dw	0xFFFF	; pc=0x1E3B(0x3C76)
	.dw	0xFFFF	; pc=0x1E3C(0x3C78)
	.dw	0xFFFF	; pc=0x1E3D(0x3C7A)
	.dw	0xFFFF	; pc=0x1E3E(0x3C7C)
	.dw	0xFFFF	; pc=0x1E3F(0x3C7E)
	.dw	0xFFFF	; pc=0x1E40(0x3C80)
	.dw	0xFFFF	; pc=0x1E41(0x3C82)
	.dw	0xFFFF	; pc=0x1E42(0x3C84)
	.dw	0xFFFF	; pc=0x1E43(0x3C86)
	.dw	0xFFFF	; pc=0x1E44(0x3C88)
	.dw	0xFFFF	; pc=0x1E45(0x3C8A)
	.dw	0xFFFF	; pc=0x1E46(0x3C8C)
	.dw	0xFFFF	; pc=0x1E47(0x3C8E)
	.dw	0xFFFF	; pc=0x1E48(0x3C90)
	.dw	0xFFFF	; pc=0x1E49(0x3C92)
	.dw	0xFFFF	; pc=0x1E4A(0x3C94)
	.dw	0xFFFF	; pc=0x1E4B(0x3C96)
	.dw	0xFFFF	; pc=0x1E4C(0x3C98)
	.dw	0xFFFF	; pc=0x1E4D(0x3C9A)
	.dw	0xFFFF	; pc=0x1E4E(0x3C9C)
	.dw	0xFFFF	; pc=0x1E4F(0x3C9E)
	.dw	0xFFFF	; pc=0x1E50(0x3CA0)
	.dw	0xFFFF	; pc=0x1E51(0x3CA2)
	.dw	0xFFFF	; pc=0x1E52(0x3CA4)
	.dw	0xFFFF	; pc=0x1E53(0x3CA6)
	.dw	0xFFFF	; pc=0x1E54(0x3CA8)
	.dw	0xFFFF	; pc=0x1E55(0x3CAA)
	.dw	0xFFFF	; pc=0x1E56(0x3CAC)
	.dw	0xFFFF	; pc=0x1E57(0x3CAE)
	.dw	0xFFFF	; pc=0x1E58(0x3CB0)
	.dw	0xFFFF	; pc=0x1E59(0x3CB2)
	.dw	0xFFFF	; pc=0x1E5A(0x3CB4)
	.dw	0xFFFF	; pc=0x1E5B(0x3CB6)
	.dw	0xFFFF	; pc=0x1E5C(0x3CB8)
	.dw	0xFFFF	; pc=0x1E5D(0x3CBA)
	.dw	0xFFFF	; pc=0x1E5E(0x3CBC)
	.dw	0xFFFF	; pc=0x1E5F(0x3CBE)
	.dw	0xFFFF	; pc=0x1E60(0x3CC0)
	.dw	0xFFFF	; pc=0x1E61(0x3CC2)
	.dw	0xFFFF	; pc=0x1E62(0x3CC4)
	.dw	0xFFFF	; pc=0x1E63(0x3CC6)
	.dw	0xFFFF	; pc=0x1E64(0x3CC8)
	.dw	0xFFFF	; pc=0x1E65(0x3CCA)
	.dw	0xFFFF	; pc=0x1E66(0x3CCC)
	.dw	0xFFFF	; pc=0x1E67(0x3CCE)
	.dw	0xFFFF	; pc=0x1E68(0x3CD0)
	.dw	0xFFFF	; pc=0x1E69(0x3CD2)
	.dw	0xFFFF	; pc=0x1E6A(0x3CD4)
	.dw	0xFFFF	; pc=0x1E6B(0x3CD6)
	.dw	0xFFFF	; pc=0x1E6C(0x3CD8)
	.dw	0xFFFF	; pc=0x1E6D(0x3CDA)
	.dw	0xFFFF	; pc=0x1E6E(0x3CDC)
	.dw	0xFFFF	; pc=0x1E6F(0x3CDE)
	.dw	0xFFFF	; pc=0x1E70(0x3CE0)
	.dw	0xFFFF	; pc=0x1E71(0x3CE2)
	.dw	0xFFFF	; pc=0x1E72(0x3CE4)
	.dw	0xFFFF	; pc=0x1E73(0x3CE6)
	.dw	0xFFFF	; pc=0x1E74(0x3CE8)
	.dw	0xFFFF	; pc=0x1E75(0x3CEA)
	.dw	0xFFFF	; pc=0x1E76(0x3CEC)
	.dw	0xFFFF	; pc=0x1E77(0x3CEE)
	.dw	0xFFFF	; pc=0x1E78(0x3CF0)
	.dw	0xFFFF	; pc=0x1E79(0x3CF2)
	.dw	0xFFFF	; pc=0x1E7A(0x3CF4)
	.dw	0xFFFF	; pc=0x1E7B(0x3CF6)
	.dw	0xFFFF	; pc=0x1E7C(0x3CF8)
	.dw	0xFFFF	; pc=0x1E7D(0x3CFA)
	.dw	0xFFFF	; pc=0x1E7E(0x3CFC)
	.dw	0xFFFF	; pc=0x1E7F(0x3CFE)
	.dw	0xFFFF	; pc=0x1E80(0x3D00)
	.dw	0xFFFF	; pc=0x1E81(0x3D02)
	.dw	0xFFFF	; pc=0x1E82(0x3D04)
	.dw	0xFFFF	; pc=0x1E83(0x3D06)
	.dw	0xFFFF	; pc=0x1E84(0x3D08)
	.dw	0xFFFF	; pc=0x1E85(0x3D0A)
	.dw	0xFFFF	; pc=0x1E86(0x3D0C)
	.dw	0xFFFF	; pc=0x1E87(0x3D0E)
	.dw	0xFFFF	; pc=0x1E88(0x3D10)
	.dw	0xFFFF	; pc=0x1E89(0x3D12)
	.dw	0xFFFF	; pc=0x1E8A(0x3D14)
	.dw	0xFFFF	; pc=0x1E8B(0x3D16)
	.dw	0xFFFF	; pc=0x1E8C(0x3D18)
	.dw	0xFFFF	; pc=0x1E8D(0x3D1A)
	.dw	0xFFFF	; pc=0x1E8E(0x3D1C)
	.dw	0xFFFF	; pc=0x1E8F(0x3D1E)
	.dw	0xFFFF	; pc=0x1E90(0x3D20)
	.dw	0xFFFF	; pc=0x1E91(0x3D22)
	.dw	0xFFFF	; pc=0x1E92(0x3D24)
	.dw	0xFFFF	; pc=0x1E93(0x3D26)
	.dw	0xFFFF	; pc=0x1E94(0x3D28)
	.dw	0xFFFF	; pc=0x1E95(0x3D2A)
	.dw	0xFFFF	; pc=0x1E96(0x3D2C)
	.dw	0xFFFF	; pc=0x1E97(0x3D2E)
	.dw	0xFFFF	; pc=0x1E98(0x3D30)
	.dw	0xFFFF	; pc=0x1E99(0x3D32)
	.dw	0xFFFF	; pc=0x1E9A(0x3D34)
	.dw	0xFFFF	; pc=0x1E9B(0x3D36)
	.dw	0xFFFF	; pc=0x1E9C(0x3D38)
	.dw	0xFFFF	; pc=0x1E9D(0x3D3A)
	.dw	0xFFFF	; pc=0x1E9E(0x3D3C)
	.dw	0xFFFF	; pc=0x1E9F(0x3D3E)
	.dw	0xFFFF	; pc=0x1EA0(0x3D40)
	.dw	0xFFFF	; pc=0x1EA1(0x3D42)
	.dw	0xFFFF	; pc=0x1EA2(0x3D44)
	.dw	0xFFFF	; pc=0x1EA3(0x3D46)
	.dw	0xFFFF	; pc=0x1EA4(0x3D48)
	.dw	0xFFFF	; pc=0x1EA5(0x3D4A)
	.dw	0xFFFF	; pc=0x1EA6(0x3D4C)
	.dw	0xFFFF	; pc=0x1EA7(0x3D4E)
	.dw	0xFFFF	; pc=0x1EA8(0x3D50)
	.dw	0xFFFF	; pc=0x1EA9(0x3D52)
	.dw	0xFFFF	; pc=0x1EAA(0x3D54)
	.dw	0xFFFF	; pc=0x1EAB(0x3D56)
	.dw	0xFFFF	; pc=0x1EAC(0x3D58)
	.dw	0xFFFF	; pc=0x1EAD(0x3D5A)
	.dw	0xFFFF	; pc=0x1EAE(0x3D5C)
	.dw	0xFFFF	; pc=0x1EAF(0x3D5E)
	.dw	0xFFFF	; pc=0x1EB0(0x3D60)
	.dw	0xFFFF	; pc=0x1EB1(0x3D62)
	.dw	0xFFFF	; pc=0x1EB2(0x3D64)
	.dw	0xFFFF	; pc=0x1EB3(0x3D66)
	.dw	0xFFFF	; pc=0x1EB4(0x3D68)
	.dw	0xFFFF	; pc=0x1EB5(0x3D6A)
	.dw	0xFFFF	; pc=0x1EB6(0x3D6C)
	.dw	0xFFFF	; pc=0x1EB7(0x3D6E)
	.dw	0xFFFF	; pc=0x1EB8(0x3D70)
	.dw	0xFFFF	; pc=0x1EB9(0x3D72)
	.dw	0xFFFF	; pc=0x1EBA(0x3D74)
	.dw	0xFFFF	; pc=0x1EBB(0x3D76)
	.dw	0xFFFF	; pc=0x1EBC(0x3D78)
	.dw	0xFFFF	; pc=0x1EBD(0x3D7A)
	.dw	0xFFFF	; pc=0x1EBE(0x3D7C)
	.dw	0xFFFF	; pc=0x1EBF(0x3D7E)
	.dw	0xFFFF	; pc=0x1EC0(0x3D80)
	.dw	0xFFFF	; pc=0x1EC1(0x3D82)
	.dw	0xFFFF	; pc=0x1EC2(0x3D84)
	.dw	0xFFFF	; pc=0x1EC3(0x3D86)
	.dw	0xFFFF	; pc=0x1EC4(0x3D88)
	.dw	0xFFFF	; pc=0x1EC5(0x3D8A)
	.dw	0xFFFF	; pc=0x1EC6(0x3D8C)
	.dw	0xFFFF	; pc=0x1EC7(0x3D8E)
	.dw	0xFFFF	; pc=0x1EC8(0x3D90)
	.dw	0xFFFF	; pc=0x1EC9(0x3D92)
	.dw	0xFFFF	; pc=0x1ECA(0x3D94)
	.dw	0xFFFF	; pc=0x1ECB(0x3D96)
	.dw	0xFFFF	; pc=0x1ECC(0x3D98)
	.dw	0xFFFF	; pc=0x1ECD(0x3D9A)
	.dw	0xFFFF	; pc=0x1ECE(0x3D9C)
	.dw	0xFFFF	; pc=0x1ECF(0x3D9E)
	.dw	0xFFFF	; pc=0x1ED0(0x3DA0)
	.dw	0xFFFF	; pc=0x1ED1(0x3DA2)
	.dw	0xFFFF	; pc=0x1ED2(0x3DA4)
	.dw	0xFFFF	; pc=0x1ED3(0x3DA6)
	.dw	0xFFFF	; pc=0x1ED4(0x3DA8)
	.dw	0xFFFF	; pc=0x1ED5(0x3DAA)
	.dw	0xFFFF	; pc=0x1ED6(0x3DAC)
	.dw	0xFFFF	; pc=0x1ED7(0x3DAE)
	.dw	0xFFFF	; pc=0x1ED8(0x3DB0)
	.dw	0xFFFF	; pc=0x1ED9(0x3DB2)
	.dw	0xFFFF	; pc=0x1EDA(0x3DB4)
	.dw	0xFFFF	; pc=0x1EDB(0x3DB6)
	.dw	0xFFFF	; pc=0x1EDC(0x3DB8)
	.dw	0xFFFF	; pc=0x1EDD(0x3DBA)
	.dw	0xFFFF	; pc=0x1EDE(0x3DBC)
	.dw	0xFFFF	; pc=0x1EDF(0x3DBE)
	.dw	0xFFFF	; pc=0x1EE0(0x3DC0)
	.dw	0xFFFF	; pc=0x1EE1(0x3DC2)
	.dw	0xFFFF	; pc=0x1EE2(0x3DC4)
	.dw	0xFFFF	; pc=0x1EE3(0x3DC6)
	.dw	0xFFFF	; pc=0x1EE4(0x3DC8)
	.dw	0xFFFF	; pc=0x1EE5(0x3DCA)
	.dw	0xFFFF	; pc=0x1EE6(0x3DCC)
	.dw	0xFFFF	; pc=0x1EE7(0x3DCE)
	.dw	0xFFFF	; pc=0x1EE8(0x3DD0)
	.dw	0xFFFF	; pc=0x1EE9(0x3DD2)
	.dw	0xFFFF	; pc=0x1EEA(0x3DD4)
	.dw	0xFFFF	; pc=0x1EEB(0x3DD6)
	.dw	0xFFFF	; pc=0x1EEC(0x3DD8)
	.dw	0xFFFF	; pc=0x1EED(0x3DDA)
	.dw	0xFFFF	; pc=0x1EEE(0x3DDC)
	.dw	0xFFFF	; pc=0x1EEF(0x3DDE)
	.dw	0xFFFF	; pc=0x1EF0(0x3DE0)
	.dw	0xFFFF	; pc=0x1EF1(0x3DE2)
	.dw	0xFFFF	; pc=0x1EF2(0x3DE4)
	.dw	0xFFFF	; pc=0x1EF3(0x3DE6)
	.dw	0xFFFF	; pc=0x1EF4(0x3DE8)
	.dw	0xFFFF	; pc=0x1EF5(0x3DEA)
	.dw	0xFFFF	; pc=0x1EF6(0x3DEC)
	.dw	0xFFFF	; pc=0x1EF7(0x3DEE)
	.dw	0xFFFF	; pc=0x1EF8(0x3DF0)
	.dw	0xFFFF	; pc=0x1EF9(0x3DF2)
	.dw	0xFFFF	; pc=0x1EFA(0x3DF4)
	.dw	0xFFFF	; pc=0x1EFB(0x3DF6)
	.dw	0xFFFF	; pc=0x1EFC(0x3DF8)
	.dw	0xFFFF	; pc=0x1EFD(0x3DFA)
	.dw	0xFFFF	; pc=0x1EFE(0x3DFC)
	.dw	0xFFFF	; pc=0x1EFF(0x3DFE)
	.dw	0xFFFF	; pc=0x1F00(0x3E00)
	.dw	0xFFFF	; pc=0x1F01(0x3E02)
	.dw	0xFFFF	; pc=0x1F02(0x3E04)
	.dw	0xFFFF	; pc=0x1F03(0x3E06)
	.dw	0xFFFF	; pc=0x1F04(0x3E08)
	.dw	0xFFFF	; pc=0x1F05(0x3E0A)
	.dw	0xFFFF	; pc=0x1F06(0x3E0C)
	.dw	0xFFFF	; pc=0x1F07(0x3E0E)
	.dw	0xFFFF	; pc=0x1F08(0x3E10)
	.dw	0xFFFF	; pc=0x1F09(0x3E12)
	.dw	0xFFFF	; pc=0x1F0A(0x3E14)
	.dw	0xFFFF	; pc=0x1F0B(0x3E16)
	.dw	0xFFFF	; pc=0x1F0C(0x3E18)
	.dw	0xFFFF	; pc=0x1F0D(0x3E1A)
	.dw	0xFFFF	; pc=0x1F0E(0x3E1C)
	.dw	0xFFFF	; pc=0x1F0F(0x3E1E)
	.dw	0xFFFF	; pc=0x1F10(0x3E20)
	.dw	0xFFFF	; pc=0x1F11(0x3E22)
	.dw	0xFFFF	; pc=0x1F12(0x3E24)
	.dw	0xFFFF	; pc=0x1F13(0x3E26)
	.dw	0xFFFF	; pc=0x1F14(0x3E28)
	.dw	0xFFFF	; pc=0x1F15(0x3E2A)
	.dw	0xFFFF	; pc=0x1F16(0x3E2C)
	.dw	0xFFFF	; pc=0x1F17(0x3E2E)
	.dw	0xFFFF	; pc=0x1F18(0x3E30)
	.dw	0xFFFF	; pc=0x1F19(0x3E32)
	.dw	0xFFFF	; pc=0x1F1A(0x3E34)
	.dw	0xFFFF	; pc=0x1F1B(0x3E36)
	.dw	0xFFFF	; pc=0x1F1C(0x3E38)
	.dw	0xFFFF	; pc=0x1F1D(0x3E3A)
	.dw	0xFFFF	; pc=0x1F1E(0x3E3C)
	.dw	0xFFFF	; pc=0x1F1F(0x3E3E)
	.dw	0xFFFF	; pc=0x1F20(0x3E40)
	.dw	0xFFFF	; pc=0x1F21(0x3E42)
	.dw	0xFFFF	; pc=0x1F22(0x3E44)
	.dw	0xFFFF	; pc=0x1F23(0x3E46)
	.dw	0xFFFF	; pc=0x1F24(0x3E48)
	.dw	0xFFFF	; pc=0x1F25(0x3E4A)
	.dw	0xFFFF	; pc=0x1F26(0x3E4C)
	.dw	0xFFFF	; pc=0x1F27(0x3E4E)
	.dw	0xFFFF	; pc=0x1F28(0x3E50)
	.dw	0xFFFF	; pc=0x1F29(0x3E52)
	.dw	0xFFFF	; pc=0x1F2A(0x3E54)
	.dw	0xFFFF	; pc=0x1F2B(0x3E56)
	.dw	0xFFFF	; pc=0x1F2C(0x3E58)
	.dw	0xFFFF	; pc=0x1F2D(0x3E5A)
	.dw	0xFFFF	; pc=0x1F2E(0x3E5C)
	.dw	0xFFFF	; pc=0x1F2F(0x3E5E)
	.dw	0xFFFF	; pc=0x1F30(0x3E60)
	.dw	0xFFFF	; pc=0x1F31(0x3E62)
	.dw	0xFFFF	; pc=0x1F32(0x3E64)
	.dw	0xFFFF	; pc=0x1F33(0x3E66)
	.dw	0xFFFF	; pc=0x1F34(0x3E68)
	.dw	0xFFFF	; pc=0x1F35(0x3E6A)
	.dw	0xFFFF	; pc=0x1F36(0x3E6C)
	.dw	0xFFFF	; pc=0x1F37(0x3E6E)
	.dw	0xFFFF	; pc=0x1F38(0x3E70)
	.dw	0xFFFF	; pc=0x1F39(0x3E72)
	.dw	0xFFFF	; pc=0x1F3A(0x3E74)
	.dw	0xFFFF	; pc=0x1F3B(0x3E76)
	.dw	0xFFFF	; pc=0x1F3C(0x3E78)
	.dw	0xFFFF	; pc=0x1F3D(0x3E7A)
	.dw	0xFFFF	; pc=0x1F3E(0x3E7C)
	.dw	0xFFFF	; pc=0x1F3F(0x3E7E)
	.dw	0xFFFF	; pc=0x1F40(0x3E80)
	.dw	0xFFFF	; pc=0x1F41(0x3E82)
	.dw	0xFFFF	; pc=0x1F42(0x3E84)
	.dw	0xFFFF	; pc=0x1F43(0x3E86)
	.dw	0xFFFF	; pc=0x1F44(0x3E88)
	.dw	0xFFFF	; pc=0x1F45(0x3E8A)
	.dw	0xFFFF	; pc=0x1F46(0x3E8C)
	.dw	0xFFFF	; pc=0x1F47(0x3E8E)
	.dw	0xFFFF	; pc=0x1F48(0x3E90)
	.dw	0xFFFF	; pc=0x1F49(0x3E92)
	.dw	0xFFFF	; pc=0x1F4A(0x3E94)
	.dw	0xFFFF	; pc=0x1F4B(0x3E96)
	.dw	0xFFFF	; pc=0x1F4C(0x3E98)
	.dw	0xFFFF	; pc=0x1F4D(0x3E9A)
	.dw	0xFFFF	; pc=0x1F4E(0x3E9C)
	.dw	0xFFFF	; pc=0x1F4F(0x3E9E)
	.dw	0xFFFF	; pc=0x1F50(0x3EA0)
	.dw	0xFFFF	; pc=0x1F51(0x3EA2)
	.dw	0xFFFF	; pc=0x1F52(0x3EA4)
	.dw	0xFFFF	; pc=0x1F53(0x3EA6)
	.dw	0xFFFF	; pc=0x1F54(0x3EA8)
	.dw	0xFFFF	; pc=0x1F55(0x3EAA)
	.dw	0xFFFF	; pc=0x1F56(0x3EAC)
	.dw	0xFFFF	; pc=0x1F57(0x3EAE)
	.dw	0xFFFF	; pc=0x1F58(0x3EB0)
	.dw	0xFFFF	; pc=0x1F59(0x3EB2)
	.dw	0xFFFF	; pc=0x1F5A(0x3EB4)
	.dw	0xFFFF	; pc=0x1F5B(0x3EB6)
	.dw	0xFFFF	; pc=0x1F5C(0x3EB8)
	.dw	0xFFFF	; pc=0x1F5D(0x3EBA)
	.dw	0xFFFF	; pc=0x1F5E(0x3EBC)
	.dw	0xFFFF	; pc=0x1F5F(0x3EBE)
	.dw	0xFFFF	; pc=0x1F60(0x3EC0)
	.dw	0xFFFF	; pc=0x1F61(0x3EC2)
	.dw	0xFFFF	; pc=0x1F62(0x3EC4)
	.dw	0xFFFF	; pc=0x1F63(0x3EC6)
	.dw	0xFFFF	; pc=0x1F64(0x3EC8)
	.dw	0xFFFF	; pc=0x1F65(0x3ECA)
	.dw	0xFFFF	; pc=0x1F66(0x3ECC)
	.dw	0xFFFF	; pc=0x1F67(0x3ECE)
	.dw	0xFFFF	; pc=0x1F68(0x3ED0)
	.dw	0xFFFF	; pc=0x1F69(0x3ED2)
	.dw	0xFFFF	; pc=0x1F6A(0x3ED4)
	.dw	0xFFFF	; pc=0x1F6B(0x3ED6)
	.dw	0xFFFF	; pc=0x1F6C(0x3ED8)
	.dw	0xFFFF	; pc=0x1F6D(0x3EDA)
	.dw	0xFFFF	; pc=0x1F6E(0x3EDC)
	.dw	0xFFFF	; pc=0x1F6F(0x3EDE)
	.dw	0xFFFF	; pc=0x1F70(0x3EE0)
	.dw	0xFFFF	; pc=0x1F71(0x3EE2)
	.dw	0xFFFF	; pc=0x1F72(0x3EE4)
	.dw	0xFFFF	; pc=0x1F73(0x3EE6)
	.dw	0xFFFF	; pc=0x1F74(0x3EE8)
	.dw	0xFFFF	; pc=0x1F75(0x3EEA)
	.dw	0xFFFF	; pc=0x1F76(0x3EEC)
	.dw	0xFFFF	; pc=0x1F77(0x3EEE)
	.dw	0xFFFF	; pc=0x1F78(0x3EF0)
	.dw	0xFFFF	; pc=0x1F79(0x3EF2)
	.dw	0xFFFF	; pc=0x1F7A(0x3EF4)
	.dw	0xFFFF	; pc=0x1F7B(0x3EF6)
	.dw	0xFFFF	; pc=0x1F7C(0x3EF8)
	.dw	0xFFFF	; pc=0x1F7D(0x3EFA)
	.dw	0xFFFF	; pc=0x1F7E(0x3EFC)
	.dw	0xFFFF	; pc=0x1F7F(0x3EFE)
	.dw	0xFFFF	; pc=0x1F80(0x3F00)
	.dw	0xFFFF	; pc=0x1F81(0x3F02)
	.dw	0xFFFF	; pc=0x1F82(0x3F04)
	.dw	0xFFFF	; pc=0x1F83(0x3F06)
	.dw	0xFFFF	; pc=0x1F84(0x3F08)
	.dw	0xFFFF	; pc=0x1F85(0x3F0A)
	.dw	0xFFFF	; pc=0x1F86(0x3F0C)
	.dw	0xFFFF	; pc=0x1F87(0x3F0E)
	.dw	0xFFFF	; pc=0x1F88(0x3F10)
	.dw	0xFFFF	; pc=0x1F89(0x3F12)
	.dw	0xFFFF	; pc=0x1F8A(0x3F14)
	.dw	0xFFFF	; pc=0x1F8B(0x3F16)
	.dw	0xFFFF	; pc=0x1F8C(0x3F18)
	.dw	0xFFFF	; pc=0x1F8D(0x3F1A)
	.dw	0xFFFF	; pc=0x1F8E(0x3F1C)
	.dw	0xFFFF	; pc=0x1F8F(0x3F1E)
	.dw	0xFFFF	; pc=0x1F90(0x3F20)
	.dw	0xFFFF	; pc=0x1F91(0x3F22)
	.dw	0xFFFF	; pc=0x1F92(0x3F24)
	.dw	0xFFFF	; pc=0x1F93(0x3F26)
	.dw	0xFFFF	; pc=0x1F94(0x3F28)
	.dw	0xFFFF	; pc=0x1F95(0x3F2A)
	.dw	0xFFFF	; pc=0x1F96(0x3F2C)
	.dw	0xFFFF	; pc=0x1F97(0x3F2E)
	.dw	0xFFFF	; pc=0x1F98(0x3F30)
	.dw	0xFFFF	; pc=0x1F99(0x3F32)
	.dw	0xFFFF	; pc=0x1F9A(0x3F34)
	.dw	0xFFFF	; pc=0x1F9B(0x3F36)
	.dw	0xFFFF	; pc=0x1F9C(0x3F38)
	.dw	0xFFFF	; pc=0x1F9D(0x3F3A)
	.dw	0xFFFF	; pc=0x1F9E(0x3F3C)
	.dw	0xFFFF	; pc=0x1F9F(0x3F3E)
	.dw	0xFFFF	; pc=0x1FA0(0x3F40)
	.dw	0xFFFF	; pc=0x1FA1(0x3F42)
	.dw	0xFFFF	; pc=0x1FA2(0x3F44)
	.dw	0xFFFF	; pc=0x1FA3(0x3F46)
	.dw	0xFFFF	; pc=0x1FA4(0x3F48)
	.dw	0xFFFF	; pc=0x1FA5(0x3F4A)
	.dw	0xFFFF	; pc=0x1FA6(0x3F4C)
	.dw	0xFFFF	; pc=0x1FA7(0x3F4E)
	.dw	0xFFFF	; pc=0x1FA8(0x3F50)
	.dw	0xFFFF	; pc=0x1FA9(0x3F52)
	.dw	0xFFFF	; pc=0x1FAA(0x3F54)
	.dw	0xFFFF	; pc=0x1FAB(0x3F56)
	.dw	0xFFFF	; pc=0x1FAC(0x3F58)
	.dw	0xFFFF	; pc=0x1FAD(0x3F5A)
	.dw	0xFFFF	; pc=0x1FAE(0x3F5C)
	.dw	0xFFFF	; pc=0x1FAF(0x3F5E)
	.dw	0xFFFF	; pc=0x1FB0(0x3F60)
	.dw	0xFFFF	; pc=0x1FB1(0x3F62)
	.dw	0xFFFF	; pc=0x1FB2(0x3F64)
	.dw	0xFFFF	; pc=0x1FB3(0x3F66)
	.dw	0xFFFF	; pc=0x1FB4(0x3F68)
	.dw	0xFFFF	; pc=0x1FB5(0x3F6A)
	.dw	0xFFFF	; pc=0x1FB6(0x3F6C)
	.dw	0xFFFF	; pc=0x1FB7(0x3F6E)
	.dw	0xFFFF	; pc=0x1FB8(0x3F70)
	.dw	0xFFFF	; pc=0x1FB9(0x3F72)
	.dw	0xFFFF	; pc=0x1FBA(0x3F74)
	.dw	0xFFFF	; pc=0x1FBB(0x3F76)
	.dw	0xFFFF	; pc=0x1FBC(0x3F78)
	.dw	0xFFFF	; pc=0x1FBD(0x3F7A)
	.dw	0xFFFF	; pc=0x1FBE(0x3F7C)
	.dw	0xFFFF	; pc=0x1FBF(0x3F7E)
	.dw	0xFFFF	; pc=0x1FC0(0x3F80)
	.dw	0xFFFF	; pc=0x1FC1(0x3F82)
	.dw	0xFFFF	; pc=0x1FC2(0x3F84)
	.dw	0xFFFF	; pc=0x1FC3(0x3F86)
	.dw	0xFFFF	; pc=0x1FC4(0x3F88)
	.dw	0xFFFF	; pc=0x1FC5(0x3F8A)
	.dw	0xFFFF	; pc=0x1FC6(0x3F8C)
	.dw	0xFFFF	; pc=0x1FC7(0x3F8E)
	.dw	0xFFFF	; pc=0x1FC8(0x3F90)
	.dw	0xFFFF	; pc=0x1FC9(0x3F92)
	.dw	0xFFFF	; pc=0x1FCA(0x3F94)
	.dw	0xFFFF	; pc=0x1FCB(0x3F96)
	.dw	0xFFFF	; pc=0x1FCC(0x3F98)
	.dw	0xFFFF	; pc=0x1FCD(0x3F9A)
	.dw	0xFFFF	; pc=0x1FCE(0x3F9C)
	.dw	0xFFFF	; pc=0x1FCF(0x3F9E)
	.dw	0xFFFF	; pc=0x1FD0(0x3FA0)
	.dw	0xFFFF	; pc=0x1FD1(0x3FA2)
	.dw	0xFFFF	; pc=0x1FD2(0x3FA4)
	.dw	0xFFFF	; pc=0x1FD3(0x3FA6)
	.dw	0xFFFF	; pc=0x1FD4(0x3FA8)
	.dw	0xFFFF	; pc=0x1FD5(0x3FAA)
	.dw	0xFFFF	; pc=0x1FD6(0x3FAC)
	.dw	0xFFFF	; pc=0x1FD7(0x3FAE)
	.dw	0xFFFF	; pc=0x1FD8(0x3FB0)
	.dw	0xFFFF	; pc=0x1FD9(0x3FB2)
	.dw	0xFFFF	; pc=0x1FDA(0x3FB4)
	.dw	0xFFFF	; pc=0x1FDB(0x3FB6)
	.dw	0xFFFF	; pc=0x1FDC(0x3FB8)
	.dw	0xFFFF	; pc=0x1FDD(0x3FBA)
	.dw	0xFFFF	; pc=0x1FDE(0x3FBC)
	.dw	0xFFFF	; pc=0x1FDF(0x3FBE)
	.dw	0xFFFF	; pc=0x1FE0(0x3FC0)
	.dw	0xFFFF	; pc=0x1FE1(0x3FC2)
	.dw	0xFFFF	; pc=0x1FE2(0x3FC4)
	.dw	0xFFFF	; pc=0x1FE3(0x3FC6)
	.dw	0xFFFF	; pc=0x1FE4(0x3FC8)
	.dw	0xFFFF	; pc=0x1FE5(0x3FCA)
	.dw	0xFFFF	; pc=0x1FE6(0x3FCC)
	.dw	0xFFFF	; pc=0x1FE7(0x3FCE)
	.dw	0xFFFF	; pc=0x1FE8(0x3FD0)
	.dw	0xFFFF	; pc=0x1FE9(0x3FD2)
	.dw	0xFFFF	; pc=0x1FEA(0x3FD4)
	.dw	0xFFFF	; pc=0x1FEB(0x3FD6)
	.dw	0xFFFF	; pc=0x1FEC(0x3FD8)
	.dw	0xFFFF	; pc=0x1FED(0x3FDA)
	.dw	0xFFFF	; pc=0x1FEE(0x3FDC)
	.dw	0xFFFF	; pc=0x1FEF(0x3FDE)
	.dw	0xFFFF	; pc=0x1FF0(0x3FE0)
	.dw	0xFFFF	; pc=0x1FF1(0x3FE2)
	.dw	0xFFFF	; pc=0x1FF2(0x3FE4)
	.dw	0xFFFF	; pc=0x1FF3(0x3FE6)
	.dw	0xFFFF	; pc=0x1FF4(0x3FE8)
	.dw	0xFFFF	; pc=0x1FF5(0x3FEA)
	.dw	0xFFFF	; pc=0x1FF6(0x3FEC)
	.dw	0xFFFF	; pc=0x1FF7(0x3FEE)
	.dw	0xFFFF	; pc=0x1FF8(0x3FF0)
	.dw	0xFFFF	; pc=0x1FF9(0x3FF2)
	.dw	0xFFFF	; pc=0x1FFA(0x3FF4)
	.dw	0xFFFF	; pc=0x1FFB(0x3FF6)
	.dw	0xFFFF	; pc=0x1FFC(0x3FF8)
	.dw	0xFFFF	; pc=0x1FFD(0x3FFA)
	.dw	0xFFFF	; pc=0x1FFE(0x3FFC)
;
; last flash byte address = 0x3FFD
; last flash word address = 0x1FFE
;---------------------------------------
	.dseg
	.org	0x018A
;
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
