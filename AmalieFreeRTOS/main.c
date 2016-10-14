

#include <avr/io.h>
#include <util/delay.h>

// Free-RTOS includes
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "semphr.h"
#include "portmacro.h"
#include "FreeRTOSConfig.h"

#define LED_DDR DDRE

#define LED PORTE


void vApplicationIdleHook( void );

void LEDBlink(void *pvParameters);

void LEDnotBlink(void *pvNotParameters);

SemaphoreHandle_t xSemaphore;

int main()
{
	
	LED_DDR = 0xFF;
	
	vSemaphoreCreateBinary(xSemaphore);
  
	xTaskCreate(LEDBlink, "Blink", 500, NULL, configMAX_PRIORITIES-1, NULL);
	xTaskCreate(LEDnotBlink, "notBlink", 500, NULL, configMAX_PRIORITIES-2, NULL);

	vTaskStartScheduler();
	
  return 0;
}

void LEDnotBlink(void *pvNotParameters)
{

	while(1)
	{
		if (xSemaphoreTake(xSemaphore, 100 ))
			{
				_delay_ms(1000);
				LED = 0xFF;
				_delay_ms(1000);
				LED = 0xFF;
				xSemaphoreGive(xSemaphore);
			}

				vTaskDelay(1000);
		
	}
}


void LEDBlink(void *pvParameters)
{

		while(1)
		{
			if (xSemaphoreTake(xSemaphore, 100 ))
			{
				_delay_ms(1000);
				LED = 0x00;
				_delay_ms(1000);
				LED = 0x00;
				xSemaphoreGive(xSemaphore);
			}

		vTaskDelay(100);
		}
}


void vApplicationIdleHook( void ) //Når FreeRTOS ikke har en task den skal lave
{
		//vCoRoutineSchedule();

}
