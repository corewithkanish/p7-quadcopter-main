#include "main.h"
#include "functions.h"

#include <avr/io.h>
#include <util/delay.h>

// Free-RTOS includes
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "semphr.h"
#include "portmacro.h"
#include "FreeRTOSConfig.h"



int main()
{
  static int init = 0;
  LED_DDR = 0x11;

  //if( init == 0 )
  //{
  //  PWM_init(0);
  //  init = 10;
  //}

	xTaskCreate(Controllers, "Controllers", 1000, NULL, configMAX_PRIORITIES - 1, NULL);
	xTaskCreate(Dummy, "Dummy", 1000, NULL, configMAX_PRIORITIES - 2, NULL);
	LED = 0x00;
	_delay_ms(500);
	vTaskStartScheduler();
	
	return 0;
}


void Controllers(void *pvParameters)
{
  //AngularController();
	//ApplyVelocities();

	//portTickType xLastWakeTime;
	//xLastWakeTime = xTaskGetTickCount();

	while (1)
	{
		LED |= 0x01;
		_delay_ms(500);
		//vTaskDelay(500);
		LED &= (~0x01);
		//_delay_ms(portTICK_PERIOD_MS * 100);
		//_delay_ms(100);
		vTaskDelay(500);
		//vTaskDelayUntil(&xLastWakeTime, 200);
	}
	vTaskDelete(NULL);

}

void Dummy(void *pvParameters)
{
	while (1)
	{
		LED |= 0x10;
		_delay_ms(100);
		//vTaskDelay(100);
		LED &= (~0x10);
		vTaskDelay(100);
	}
	vTaskDelete(NULL);
}

// void LEDnotBlink(void *pvNotParameters)
// {
	// while(1)
	// {
		// if (xSemaphoreTake(xSemaphore, 100 ))
			// {
				// _delay_ms(1000);
				// LED = 0xFF;
				// _delay_ms(1000);
				// LED = 0xFF;
				// xSemaphoreGive(xSemaphore);
			// }
				// vTaskDelay(1000);
	// }
// }

void vApplicationIdleHook( void ) //Når FreeRTOS ikke har en task den skal lave
{
	//vCoRoutineSchedule();
	//while (1)
	 /*LED = 0x00;*/
}