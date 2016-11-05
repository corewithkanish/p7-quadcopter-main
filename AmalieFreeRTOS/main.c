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
	// Initialization
	LED_DDR |= 0x18;
	//PWM_init(0);
	USART_Init(MYUBRR);

	// Task Creation
	//xTaskCreate(Controllers, "Control", 1000, NULL, configMAX_PRIORITIES - 1, NULL);
	xTaskCreate(Comunication, "Com", 1000, NULL, configMAX_PRIORITIES - 2, NULL);

	//LED |= (~0x00);
	//_delay_ms(500);

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
		_delay_ms(10);
		AngularController();
		ApplyVelocities();
		vTaskDelayUntil(&xLastWakeTime, 50);
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
			//LED = 0xFF;
			GetPackage();
			//USART_Transmit(128);
			//LED = 0x00;

		}
			//PORTE &= (~0x08);
		//else
			//LED = 0x00;
		//unsigned char a = 0xFF;
		//a = (a << 1) >> 1;
		//USART_Transmit(a);
	}
	vTaskDelete(NULL);
}


void vApplicationIdleHook( void ) //Når FreeRTOS ikke har en task den skal lave
{
}