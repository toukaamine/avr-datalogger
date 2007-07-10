#Makefile template for..!
#

CC = avr-gcc
FLAGS = -Wall -g 
MMCU = atmega8

OBJ = avr-objcopy
OBJ_FLAGS = -O ihex -R .eeprom

PRG = sp12
PRG_FLAGS = -wpf 
PRG_FUSES = -wF10100100 -T1
all: main
	@echo "Make complete!"
	
main:
	$(CC) $(FLAGS) -mmcu=$(MMCU) uart.c tx.c pause.c Rx.c -o uart.elf
	$(OBJ) $(OBJ_FLAGS) uart.elf temp.hex	
	$(PRG) $(PRG_FLAGS) temp.hex $(PRG_FUSES)
 

size:
	avr-size temp.hex