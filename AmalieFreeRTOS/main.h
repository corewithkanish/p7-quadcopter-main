#define LED_DDR DDRC
#define LED PORTC
#define LED2_DDR DDRK
#define LED2 PORTK

#define FOSC 16000000// Clock Speed
#define BAUD 38400
#define MYUBRR FOSC/16/BAUD-1
#define DUTY_INIT 175

void vApplicationIdleHook( void );

void Controllers(void *pvParameters);
void Comunication(void *pvParameters);

//void LEDnotBlink(void *pvNotParameters);

//SemaphoreHandle_t xSemaphore;