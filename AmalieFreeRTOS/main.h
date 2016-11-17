#define LED_DDR DDRC
#define LED PORTC

#define FOSC 16000000// Clock Speed
#define BAUD 19200
#define MYUBRR FOSC/16/BAUD-1

void vApplicationIdleHook( void );

void Controllers(void *pvParameters);
void Comunication(void *pvParameters);

//void LEDnotBlink(void *pvNotParameters);

//SemaphoreHandle_t xSemaphore;

//initialise Matrices (allocate space (Use Calloc))