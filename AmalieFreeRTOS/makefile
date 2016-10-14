DEVICE     = atmega2560
CLOCK      = 16000000
PROGRAMMER = avrispmkII
#BAUD       = 19200
FILENAME   = main
OUTPUTNAME = output
COMPILER = avr-gcc
COMPILE    = $(COMPILER) -Wall -Os -DF_CPU=$(CLOCK) -mmcu=$(DEVICE)
UNAME := $(shell uname)

ifeq ($(UNAME), Linux)
PORT	   = /dev/tty0
else
PORT	   = usb
endif


SOURCES = $(FILENAME).c
#SOURCES += uart_kanda/uart_kanda.c
#SOURCES += drivers.c
#SOURCES += lcd.c
#SOURCES += SPI/SPI.c
#SOURCES += menu.c
#SOURCES += sensorDAC.c #VIRKER
#SOURCES += midi.c #VIRKER
#SOURCES += beam.c #VIRKER

 SOURCES += freertos/croutine.c
 SOURCES += freertos/portable/port.c
 SOURCES += freertos/event_groups.c
 SOURCES += freertos/list.c
 SOURCES += freertos/queue.c
 SOURCES += freertos/tasks.c
 SOURCES += freertos/serial/serial.c
 SOURCES += freertos/portable/MemMang/heap_3.c
SOURCES += freertos/timers.c

 FOLDERS = -Ifreertos
 FOLDERS += -Ifreertos/include
 FOLDERS += -Ifreertos/portable
 FOLDERS += -Ifreertos/portable/MemMang
#FOLDERS += -Iuart

OBJECTS=$(SOURCES:.c=.o)
	#$(SOURCES) 

all:	build upload clean
	#$(OBJECTS)
	#$(COMPILE) $(OBJECTS) -o $(OUTPUTNAME).elf
	#$(COMPILE) -c $(FILENAME).c -o $(FILENAME).o
	#$(COMPILE) -o $(FILENAME).elf $(FILENAME).o

.c.o:
	$(COMPILE) -c $< -o $@

build:	
	$(COMPILE) $(FOLDERS) $(SOURCES) -o $(FILENAME).elf
	#$(COMPILE) -o $(OUTPUTNAME).elf $(OBJECTS)
	avr-objcopy -j .text -j .data -O ihex $(FILENAME).elf $(FILENAME).hex
	avr-size --format=avr --mcu=$(DEVICE) $(FILENAME).elf
 
upload:
	avrdude -v -p $(DEVICE) -c $(PROGRAMMER) -P $(PORT) -U flash:w:$(FILENAME).hex:i 
 
clean:
	rm -f $(FILENAME).o
	rm -f $(FILENAME).elf
	rm -f $(FILENAME).hex
	
fuses:
	avrdude -v -p $(DEVICE) -c $(PROGRAMMER) -P $(PORT) -U lfuse:w:0xff:m -U hfuse:w:0xD9:m 
	#-U efuse:w:0xfc:m
	
