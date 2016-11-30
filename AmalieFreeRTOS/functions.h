#define EQU_SPEED 429
#define T 0.035

#define DUTY_MAX 255
#define DUTY_MIN 128
#define DUTY_INIT 160
#define DUTY_MAX_DIFF 30

#define LED PORTC
#define LED2 PORTK

void AngularController(void);
void ApplyVelocities(void);
void PWM_init(int initial_duty);
void Set_PWM_duty(int duty0, int duty4A, int duty4B, int duty4C);
int CheckPackageArrival(void);
void GetPackage(void);
void USART_Init(unsigned int ubrr);
unsigned char USART_Receive(void);
void USART_Transmit(unsigned char data);
void ADC_Init(void);
int ADC_Read(void);