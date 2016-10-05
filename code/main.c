#include "main.h"
#include "test.h"
#include <util/delay.h>

int main(void)
{
	PWM_init(0);
	_delay_ms(2000);

	int duty0 = 128;
	int duty4A = 128;
	int duty4B = 128;
	int duty4C = 128;

	int duty_final = 167;

	Set_PWM_duty(duty0, duty4A, duty4B, duty4C);
	_delay_ms(6000);

	while (1)
	{
		Set_PWM_duty(duty0, duty4A, duty4B, duty4C);
		if (duty0 < duty_final)
		{
			duty0 = duty0 + 1;
		}
		else duty0 = duty_final;
		_delay_ms(50);
	}

	return 0;
}