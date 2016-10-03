#define F_CPU 16000000UL

#include <avr/io.h>
#include <util/delay.h>

#define LED_DDR DDRB

#define LED PORTB

int main()
{
  LED_DDR = 0xFF;

  while(1)
  {
    _delay_ms(1000);
    LED = 0x00;
    _delay_ms(1000);
    LED = 0xFF;
  }

  return 0;
}