//Set data direction registers

//Set port names

//Set pin names


// Functions prototypes
void PWM_init(int initial_duty);
void set_PWM_duty(int duty0, int duty4A, int duty4B, int duty4C);

void USART_init(unsigned int ubrr);
void USART_transmit(unsigned char data);
unsigned char USART_receive(void);