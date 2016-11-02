

#include <avr/io.h>
#include <util/delay.h>
#include <string.h>

// Free-RTOS includes
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "semphr.h"
#include "portmacro.h"
#include "FreeRTOSConfig.h"

#define LED_DDR DDRE
#define LED PORTE

#define FOSC 1843200// Clock Speed
#define BAUD 9600
#define (MYUBRR FOSC/16/BAUD-1)

void vApplicationIdleHook( void );

void AngularController(void *pvParameters);
void USART_Init(unsigned int ubrr);

//void LEDnotBlink(void *pvNotParameters);

//SemaphoreHandle_t xSemaphore;

//initialise Matrices (allocate space (Use Calloc))

	const int L[3] = {0, 0, 0};
	const float B1[4] = {0.0, 0.0, 0.0, 0.0};
	const float B2[4] = {0.0, 0.0, 0.0, 0.0};
	const float B3[4] = {0.0, 0.0, 0.0, 0.0};
	const float F1[6] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
	const float F2[6] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
	const float F3[6] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
	const float F4[6] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
	const float Fint1[6] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
	const float Fint2[6] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
	const float Fint3[6] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
	const float Fint4[6] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
	
	float u_k1[4] 	= {0.0, 0.0, 0.0, 0.0};
	float y_k[3] 	= {0.0, 0.0, 0.0};	
	float y_k1[3] 	= {0.0, 0.0, 0.0};
	float r_k1[3] 	= {0.0, 0.0, 0.0};
	float r_k[3] 	= {0.0, 0.0, 0.0};
	float x2_k1[3] 	= {0.0, 0.0, 0.0};
	


int main()
{
	// Initialization
	LED_DDR = 0xFF;
	USART_Init(MYUBRR);

	xTaskCreate(AngularController, "AngularController", 500, NULL, configMAX_PRIORITIES-1, NULL);

	vTaskStartScheduler();
	
	return 0;
}


void vApplicationIdleHook(void) //Når FreeRTOS ikke har en task den skal lave
{
	//vCoRoutineSchedule();
}


void AngularController(void *pvParameters)
{
	
	float x_intk[3] = {0.0, 0.0, 0.0};
	float x2_k[3] = {0.0, 0.0, 0.0};
	float u_k[4] = {0.0, 0.0, 0.0, 0.0};
	
	int i = 0;
	int j = 0;
	
	for(i; i < 4; i++)
	{
		if (i < 3)
		{
			x_intk[i] = y_k1[i] - r_k1[i];
			
			switch (i) 
			{
				case 0:
					x2_k[i] = L[i] * x2_k1[i] + B1[0]*u_k1[0] + B1[1]*u_k1[1] + B1[2]*u_k1[2] + B1[3]*u_k1[3] - L[i]*y_k[i];
				 break;
				case 1:
					x2_k[i] = L[i] * x2_k1[i] + B2[0]*u_k1[0] + B2[1]*u_k1[1] + B2[2]*u_k1[2] + B2[3]*u_k1[3] - L[i]*y_k[i];
				 break;
				case 2:
					x2_k[i] = L[i] * x2_k1[i] + B3[0]*u_k1[0] + B3[1]*u_k1[1] + B3[2]*u_k1[2] + B3[3]*u_k1[3] - L[i]*y_k[i];
				 break;
			}
		}
		
		switch (i)
		{
			
			case 0:
				u_k[i] = F1[0]*y_k[0] + F1[1]*y_k[1] + F1[2]*y_k[2] + F1[3]*x2_k[0] + F1[4]*x2_k[1] + F1[5]*x2_k[2] + Fint1[0]*x_intk[0] + Fint1[1]*x_intk[1] + Fint1[2]*x_intk[2];
			 break;
			case 1:
				u_k[i] = F2[0]*y_k[0] + F2[1]*y_k[1] + F2[2]*y_k[2] + F2[3]*x2_k[0] + F2[4]*x2_k[1] + F2[5]*x2_k[2] + Fint2[0]*x_intk[0] + Fint2[1]*x_intk[1] + Fint2[2]*x_intk[2];
			 break;
			case 2:
				u_k[i] = F3[0]*y_k[0] + F3[1]*y_k[1] + F3[2]*y_k[2] + F3[3]*x2_k[0] + F3[4]*x2_k[1] + F3[5]*x2_k[2] + Fint3[0]*x_intk[0] + Fint3[1]*x_intk[1] + Fint3[2]*x_intk[2];
			 break;
			case 3:
				u_k[i] = F4[0]*y_k[0] + F4[1]*y_k[1] + F4[2]*y_k[2] + F4[3]*x2_k[0] + F4[4]*x2_k[1] + F4[5]*x2_k[2] + Fint4[0]*x_intk[0] + Fint4[1]*x_intk[1] + Fint4[2]*x_intk[2];
			 break;
		}
			
	}	
		
	memcpy(u_k1, u_k, 4*sizeof(float));
	memcpy(x2_k1, x2_k, 3*sizeof(float));
	memcpy(y_k1, y_k, 3*sizeof(float));
	memcpy(r_k1, r_k, 3*sizeof(float));
	
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


void USART_Init(unsigned int ubrr){
	/* Set baud rate */
	UBRRH = (unsigned char)(ubrr >> 8);
	UBRRL = (unsigned char)ubrr;
	/* Enable receiver and transmitter */
	UCSRB = (1 << RXEN) | (1 << TXEN);
	/* Set frame format: 8data, 2stop bit */
	UCSRC = (1 << USBS) | (3 << UCSZ0);
} // USART_Init


