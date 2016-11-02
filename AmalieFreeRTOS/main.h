#define LED_DDR DDRE

#define LED PORTE

void vApplicationIdleHook( void );

void Controllers(void *pvParameters);

//void LEDnotBlink(void *pvNotParameters);

//SemaphoreHandle_t xSemaphore;

//initialise Matrices (allocate space (Use Calloc))

// const int L[3] = {0, 0, 0};
// const float B1[4] = {0.0, 0.0, 0.0, 0.0};
// const float B2[4] = {0.0, 0.0, 0.0, 0.0};
// const float B3[4] = {0.0, 0.0, 0.0, 0.0};
// const float F1[6] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
// const float F2[6] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
// const float F3[6] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
// const float F4[6] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
// const float Fint1[6] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
// const float Fint2[6] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
// const float Fint3[6] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
// const float Fint4[6] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0};

// float u_k1[4] 	= {0.0, 0.0, 0.0, 0.0};
// float y_k[3] 	= {0.0, 0.0, 0.0};	
// float y_k1[3] 	= {0.0, 0.0, 0.0};
// float r_k1[3] 	= {0.0, 0.0, 0.0};
// float r_k[3] 	= {0.0, 0.0, 0.0};
// float x2_k1[3] 	= {0.0, 0.0, 0.0};