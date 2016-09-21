#include "test.h"

//including libraries
#include <avr/io.h>
#include <util/delay.h>

void BlinkPortD(void)
{
  LED_DDR = 0xFF;

  _delay_ms(1000);
  LED = 0xFF;
  _delay_ms(1000);
  LED = 0x00;
  
  return;
}