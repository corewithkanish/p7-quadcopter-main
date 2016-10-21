#include "functions.h"

//----------------Libraries inclusion---------------//
#include <avr/io.h>

//----------------Functions definition---------------//

void PWM_init(int initial_duty)
{
	// Timer 0
	TCCR0A = 0b10000001; // Control A: non-inverting signal on pin A (then the duty goes from 0 to 256), pin B disconnected, phase correct mode (7)
	TCCR0B = 0b00000011; // Control B: prescaler by 64

	OCR0A = initial_duty; // Compare register (from 0 to 256)

	DDRB = 0b10000000; //Set pin B7(13) as output pin
	TCNT0 = 0; // Clear counter register just in case

	// Timer 4
	TCCR4A = 0b10101001; // Control A: non-inverting signal on pins A,B and C (then the duty goes from 0 to 256), phase correct mode with 8 bits (7)
	TCCR4B = 0b00000011; // Control B: prescaler by 64

	OCR4AL = initial_duty; // Low compare registers to initial duty (from 0 to 256)
	OCR4BL = initial_duty;
	OCR4CL = initial_duty;

	OCR4AH = 0; // High compare registers to 0
	OCR4BH = 0;
	OCR4CH = 0;

	DDRH = 0b00111000; //Set pins H3, H4 and H5 (6, 7 and 8) as output pins
	TCNT4L = 0; // Clear counter registers just in case
	TCNT4H = 0;

	return;
} // PWM_init

void set_PWM_duty(int duty0, int duty4A, int duty4B, int duty4C)
{
	OCR0A = duty0;
	OCR4AL = duty4A; 
	OCR4BL = duty4B;
	OCR4CL = duty4C;
	return;
} // set_PWM_duty

void USART_init(unsigned int ubrr){
	/* Set baud rate */
	UBRR0H = (unsigned char)(ubrr >> 8);
	UBRR0L = (unsigned char)ubrr;

	/* Enable receiver and transmitter */
	UCSR0B = (1 << RXEN0) | (1 << TXEN0);

	/* Set frame format: 8data, 2stop bit */
	UCSR0C = (1 << USBS0) | (3 << UCSZ00);
} // USART_init

void USART_transmit(unsigned char data)
{
	/* Wait for empty transmit buffer */
	while (!(UCSR0A & (1 << UDRE0)))
		;
	/* Put data into buffer, sends the data */
	UDR0 = data;
}

unsigned char USART_receive(void)
{
	/* Wait for data to be received */
	while (!(UCSR0A & (1 << RXC0)))
		;
	/* Get and return received data from buffer */
	return UDR0;
}