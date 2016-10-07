#include <avr/io.h>
#include <util/delay.h>

// Free-RTOS includes
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "semphr.h"
#include "portmacro.h"
#include "FreeRTOSConfig.h"

#define LED_DDR DDRB

#define LED PORTB

void vApplicationIdleHook( void );

void LEDBlink(void *pvParameters)
{
	while(1)
	{
	    	_delay_ms(1000);
    		LED = 0x00;
    		_delay_ms(1000);
    		LED = 0xFF;
	}
}

int main()
{
	LED_DDR = 0xFF;

	xTaskCreate(LEDBlink, "Blink", 500, NULL, 1, NULL);

	vTaskStartScheduler();

		
  return 0;
}

void vApplicationIdleHook( void ) //Når FreeRTOS ikke har en task den skal lave
{
		vCoRoutineSchedule();
	while(1)
	{
		_delay_ms(1000);
		LED = 0x00;
		_delay_ms(1000);
		LED = 0xFF;
	}

}
