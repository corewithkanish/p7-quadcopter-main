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

#define configCHECK_FOR_STACK_OVERFLOW 1

#define portUSE_TIMER0

//////////DEBUGGING BLINK///////////////
// #define LED PORTB
// while(1)
// {
//   LED = 0xFF;
// }
////////////////////////////////////////

void vApplicationIdleHook( void );

void LEDBlink(void *pvParameters);

int main()
{
	LED_DDR = 0xFF;
  
  // #ifdef configUSE_TIMERS
    // #define configUSE_TIMERS 1
  // #endif
  
	xTaskCreate(LEDBlink, "Blink", 500, NULL, tskIDLE_PRIORITY + 1, NULL);

    // #define LED PORTB
    // while(1)
    // {
      // LED = 0xFF;
    // }
    
	vTaskStartScheduler();

		
  return 0;
}

void LEDBlink(void *pvParameters)
{
  /* The parameters are not used. */
	( void ) pvParameters;
  
	// for( ;; )
	// {
	    	// _delay_ms(1000);
    		// LED = 0x00;
    		// _delay_ms(1000);
       while(1)
       {
         LED = 0xFF;
       }
	// }
  vTaskDelete( NULL );
}


void vApplicationStackOverflowHook( void ) //Når FreeRTOS ikke har en task den skal lave
{
	while(1)
	{
		_delay_ms(1000);
		LED = 0x00;
		_delay_ms(1000);
		LED = 0xFF;
	}

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
