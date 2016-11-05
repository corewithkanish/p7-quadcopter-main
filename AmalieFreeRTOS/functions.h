#define EQU_SPEED 214.34

void AngularController(void);
void ApplyVelocities(void);
void PWM_init(int initial_duty);
void Set_PWM_duty(int duty0, int duty4A, int duty4B, int duty4C);
int CheckPackageArrival(void);
void GetPackage(void);
void USART_Init(unsigned int ubrr);
unsigned char USART_Receive(void);
void USART_Transmit(unsigned char data);