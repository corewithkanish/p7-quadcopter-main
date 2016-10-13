#include "main.h"
#include "functions.h"
#include <util/delay.h>


int main(void)
{
	USART_init(MYUBRR);
	
	unsigned char data='o';
	while (1)
	{
		data = USART_receive();
		_delay_ms(1000);
		USART_transmit(data - 32);
	}

	return 0;
}