#define EQU_SPEED 410
#define T 0.035

#define DUTY_MAX 225
#define DUTY_MIN 160
#define DUTY_INIT 175
#define DUTY_MAX_DIFF 30

#define U_MAX 104.55
#define U_MIN -62.2
#define UZ_MIN -480
#define UZ_MAX 480
#define MAX_ANGLE 0.12
#define MIN_ANGLE -0.12


#define LENGTH 0.225
#define H 0.422
#define K 0.05
#define H0 K/5

#define LED PORTC
#define LED2 PORTK

void Controller(void);
void ApplyVelocities(void);
void PWM_init(int initial_duty);
void Set_PWM_duty(char duty0, char duty4A, char duty4B, char duty4C);
int CheckPackageArrival(void);
void GetPackage(void);
void USART_Init(unsigned int ubrr);
unsigned char USART_Receive(void);
void USART_Transmit(unsigned char data);
void ADC_Init(void);
int ADC_Read(void);