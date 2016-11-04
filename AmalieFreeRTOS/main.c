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
  LED_DDR = 0x01;
  
  if( init == 0 )
  {
    PWM_init(0);
    init = 10;
  }

	xTaskCreate(Controllers, "Controllers", 500, NULL, configMAX_PRIORITIES-1, NULL);
	vTaskStartScheduler();
	
	return 0;
}


void vApplicationIdleHook(void) //Når FreeRTOS ikke har en task den skal lave
{
	//vCoRoutineSchedule();
}


void Controllers(void *pvParameters)
{
  AngularController();
	ApplyVelocities();
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
		// vCoRoutineSchedule();

    while(1)
    {
      LED = 0x01;
    }
    
}