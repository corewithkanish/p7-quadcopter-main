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

int main()
{
	// Initialization

	//PWM_init(0);
	USART_Init(MYUBRR);
	LED_DDR = 0xFF;
	LED = 0x00;
	// Task Creation
	//xTaskCreate(Controllers, "Control", 1000, NULL, configMAX_PRIORITIES - 1, NULL);
	xTaskCreate(Comunication, "Com", 1000, NULL, configMAX_PRIORITIES - 2, NULL);
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
		//_delay_ms(10);
		//if (count<500)
		//{
			AngularController();
			count++;
			ApplyVelocities();
			//if (u_k1[3] < 0)
			//{
				//USART_Transmit('n');
				//USART_Transmit('n');

			//}
			//else
			//{
				//USART_Transmit('p');
				//USART_Transmit('p');
			//	USART_Transmit(u_k1[3]);
			//}
			//Set_PWM_duty(185, 185, 185, 185);
		//}
		//else
		//{

		//	Set_PWM_duty(128, 128, 128, 128);
		//	count = 600;
		//}

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
			//_delay_ms(10);
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