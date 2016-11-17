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

int count = 0;
float u_k1[4];
xTaskHandle xHandle;
SemaphoreHandle_t xSemaphore = NULL;

int main()
{
	// Initialization
	PWM_init(0);
	USART_Init(MYUBRR);
	LED_DDR = 0xFF;
	LED = 0x00;

	// Task Creation
	xSemaphore = xSemaphoreCreateMutex();
	xTaskCreate(Controllers, "Control", 1000, NULL, configMAX_PRIORITIES - 2, NULL );
	xTaskCreate(Comunication, "Com", 1000, NULL, configMAX_PRIORITIES - 3, NULL);
	//while (1)
	//{
	//	LED = 0xFF;
	//	_delay_ms(1000);
	//	LED = 0x00;
	//	_delay_ms(1000);
	//}

	//LED |= (~0x00);
	//_delay_ms(1000);
	//int duty = 128;
	//Set_PWM_duty(duty, duty, duty, duty);
	//_delay_ms(10000);
	//int i = 0;
	//while (i<10)
	//{
	//	Set_PWM_duty(duty, duty, duty, duty);
	//	duty += 5;
	//	i++;
	//	_delay_ms(1000);
	//}

	// Scheduler Start
	vTaskStartScheduler();
	return 0;
}


void Controllers(void *pvParameters)
{
	portTickType xLastWakeTime;
	xLastWakeTime = xTaskGetTickCount();

	while (1)
	{
		if (xSemaphore != NULL)
		{
			/* See if we can obtain the semaphore.  If the semaphore is not
			available wait 10 ticks to see if it becomes free. */
			if (xSemaphoreTake(xSemaphore, (TickType_t)10) == pdTRUE)
			{
				/* We were able to obtain the semaphore and can now access the
				shared resource. */

				//if (count<500)
				//{
				//LED = 0xFF;
				AngularController();
				count++;
				ApplyVelocities();
				//LED = 0x00;
				//}
				//else
				//{
				//	Set_PWM_duty(128, 128, 128, 128);
				//	count = 600;
				//}
				xSemaphoreGive(xSemaphore);
				vTaskDelayUntil(&xLastWakeTime, 20);
				/* We have finished accessing the shared resource.  Release the
				semaphore. */
			}
			else
			{
				/* We could not obtain the semaphore and can therefore not access
				the shared resource safely. */
			}
		}
		
	}
	vTaskDelete(NULL);
}


void Comunication(void *pvParameters)
{
	while (1)
	{
		int pack = 0;
		pack = CheckPackageArrival();
		if (pack)
		{
			if (xSemaphore != NULL)
			{
				/* See if we can obtain the semaphore.  If the semaphore is not
				available wait 10 ticks to see if it becomes free. */
				if (xSemaphoreTake(xSemaphore, (TickType_t)10) == pdTRUE)
				{
					/* We were able to obtain the semaphore and can now access the
					shared resource. */
					GetPackage();
					/* We have finished accessing the shared resource.  Release the
					semaphore. */
					xSemaphoreGive(xSemaphore);
				}
				else
				{
					/* We could not obtain the semaphore and can therefore not access
					the shared resource safely. */
				}
			}
			//vTaskPrioritySet(NULL, configMAX_PRIORITIES - 1);
			//vTaskPrioritySet(NULL, configMAX_PRIORITIES - 3);
		}
	}
	vTaskDelete(NULL);
}


void vApplicationIdleHook( void ) //Når FreeRTOS ikke har en task den skal lave
{
}