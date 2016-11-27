#include <string.h>
#include <avr/io.h>
#include <util/delay.h>

#include "functions.h"

// Constant matrices
const int L[3] = {-11.0, -12.0, -13.0};
const float B1[4] = { 0.0, -0.2396, 0.0, 0.2396 };
const float B2[4] = { 0.2396, 0.0, -0.2396, 0.0 };
const float B3[4] = { 0.0377, -0.0377, 0.0377, -0.0377 };
//const float F1[6] = {4.99, -21.41, -81.9, 1.38, -12.46, -42.1};
//const float F2[6] = {17.53, 2.42, 78.76, 11.05, 0.8, 41.2};
//const float F3[6] = {11.38, 23.7, -81.01, 2.8, 12.45, -41.69};
//const float F4[6] = {-33.9, -4.72, 84.15, -15.24, -0.79, 42.59};
//const float Fint1[6] = { 4.45, -10.79, -49.44};
//const float Fint2[6] = { 8.21, 1.67, 46.82};
//const float Fint3[6] = { 10.82, 14.53, -49.15};
//const float Fint4[6] = { -23.48, -5.42, 51.77};
//const float F1[6] = { -23.06, -247.76, -652.3, -2.024, -39.57, -114.17};
//const float F2[6] = {246.26, 12.79, 656.46, 39.45, 1.13, 114.52};
//const float F3[6] = {-34.97, 215.24, -648.57, -3, 36.74, -113.82};
//const float F4[6] = {-188.24, 19.72, 644.4, -34.43, 1.7, 113.47};
//const float Fint1[6] = {-65.1, -512.1, -1234.4};
//const float Fint2[6] = {507.6, 35.7, 1247.8};
//const float Fint3[6] = {-101.3, 419.6, -1225.6};
//const float Fint4[6] = {-341.2, 56.8, 1213.3};
///////// Poles at [-2 -2.2 -2.3 -2.4 -2.5 -2.6] [-4.7 -4.8 -4.9]
//const float F1[6] = { 0.5093, -53.0121, -184.2485, 0.1639, -19.0614, -62.4148 };
//const float F2[6] = { 55.7409, -0.5521, 183.7521, 19.3977, -0.0762, 62.3137 };
//const float F3[6] = { 6.0556, 59.8087, -185.9189, 0.8748, 19.9562, -62.6295 };
//const float F4[6] = { -62.3058, -6.2445, 186.4153, -20.4365, -0.8187, 62.7305 };
//const float Fint1[6] = { 0.3230, -46.1654, -173.7414 };
//const float Fint2[6] = { 50.7657, -0.9423, 173.1422 };
//const float Fint3[6] = { 9.4407, 57.3360, -176.5251 };
//const float Fint4[6] = { -60.5294, -10.2283, 177.1243 };
///////// Poles at [-2 -2.2 -2.3 -2.4 -2.5 -2.6] [-3.7 -3.8 -3.9]
const float F1[6] = { 0.2963, -51.6389, -140.5473, 0.0399, -18.1631, -53.7370 };
const float F2[6] = { 47.7007, 2.3964, 139.6324, 17.5417, 0.3388, 53.5995 };
const float F3[6] = { 3.8514, 49.9573, -139.7270, 0.6378, 18.0062, -53.6276 };
const float F4[6] = { -51.8484, -0.7148, 140.6418, -18.2194, -0.1819, 53.7652 };
const float Fint1[6] = { 0.4447, -47.9948, -119.1227 };
const float Fint2[6] = { 42.2050, 3.7624, 117.7448 };
const float Fint3[6] = { 5.5250, 44.9300, -117.8119 };
const float Fint4[6] = { -48.1748, -0.6977, 119.1898 };
///////// Poles at [-2 - 2.2 - 2.3 - 2.4 - 2.5 - 2.6] [-2.7 - 2.8 - 2.9]
//const float F1[6] = { -6.1645, -35.6289, -120.4010, -1.2502, -14.9643, -48.9768 };
//const float F2[6] = { 41.1283, -0.1739, 122.6740, 16.0823, -0.0301, 49.4355 };
//const float F3[6] = { 0.0108, 42.6072, -123.5280, -0.0159, 16.3477, -49.5940 };
//const float F4[6] = { -34.9746, -6.8045, 121.2550, -14.8162, -1.3534, 49.1354 };
//const float Fint1[6] = { -7.5638, -28.0805, -98.1820 };
//const float Fint2[6] = { 34.8172, -0.2528, 100.9873 };
//const float Fint3[6] = { 0.1268, 36.8555, -102.1294 };
//const float Fint4[6] = { -27.3803, -8.5222, 99.3241 };
///////// Poles at [-2 - 2.2 - 2.3 - 2.4 - 2.5 - 2.6] [-2.7 - 2.8 - 2.9]
//const float F1[6] = { -2.2475, -85.7408, -232.3660, -0.3116, -23.2065, -67.9660 };
//const float F2[6] = { 78.4911, 11.6901, 229.2062, 22.1557, 1.6728, 67.5108 };
//const float F3[6] = { 3.0134, 67.1615, -226.4657, 0.4324, 20.5402, -67.1192 };
//const float F4[6] = { -79.2570, 6.8892, 229.6256, -22.2765, 0.9935, 67.5744 };
//const float Fint1[6] = { -4.0402, -105.0277, -264.1042 };
//const float Fint2[6] = { 92.5511, 20.3814, 258.6324 };
//const float Fint3[6] = { 5.2390, 72.7292, -253.8486 };
//const float Fint4[6] = { -93.7499, 11.9172, 259.3204 };

// Initialization and definitions of variables
float u_k1[4] = { 0.0, 0.0, 0.0, 0.0 };
float y_k[3] = { 0.0, 0.0, 0.0 };
float r_k[3] = { 0.0, 0.0, 0.0 };
float x2_k1[3] = { 0.0, 0.0, 0.0 };
float xint_k1[3] = { 0.0, 0.0, 0.0 };
float e_k1[3] = { 0.0, 0.0, 0.0 };
float o_k1[3] = { 0.0, 0.0, 0.0 };
float oint_k1[3] = { 0.0, 0.0, 0.0 };
float u_z = 0;
float pos[3] = { 0.0, 0.0, 0.0};
float pos_ref[3] = { 0.0, 0.0, 0.0};
float vel[3] = { 0.0, 0.0, 0.0};
float pos_e_k1[3] = { 0.0, 0.0, 0.0 };
float vel_ref_k1[3] = { 0.0, 0.0, 0.0 };
short sat = 0;
short reading = 0;
short low_level = 0;
float battery = 11.1;
unsigned int duty_old[4] = { DUTY_INIT, DUTY_INIT, DUTY_INIT, DUTY_INIT };


//------------------------------- Controller Functions ----------------------//

void AngularController(void)
{
	float pos_e_k[3] = { 0.0, 0.0, 0.0 };
	float vel_ref_k[3] = { 0.0, 0.0, 0.0 };
	float xint_k[3] = { 0.0, 0.0, 0.0 };
	float x2_k[3] = { 0.0, 0.0, 0.0 };
	float o_k[3] = { 0.0, 0.0, 0.0 };
	float oint_k[3] = { 0.0, 0.0, 0.0 };
	float e_k[3] = { 0.0, 0.0, 0.0 };
	int i;

	//------------Translational Controller-----------------//
	//if low_level
	//	pos_ref[3] = 0;
	//for (i = 0; i > 3; i++)
	//{
	//	switch i:
	//	{
	//		case 1
	//		{
	//			pos_e_k[i] = pos_ref[i] - pos[i];
	//			vel_ref_k[i] = Pxdot*pos_e_k[i];
	//			vel_e_k[i] = vel_ref_k[i] - vel[i];
	//			r_k[i] = Px*vel_e_k[i];
	//			break
	//		}
	//		case 2
	//		{
	//			pos_e_k[i] = pos_ref[i] - pos[i];
	//			vel_ref_k[i] = Pydot*pos_e_k[i];
	//			vel_e_k[i] = vel_ref_k[i] - vel[i];
	//			r_k[i] = Py*vel_e_k[i];
	//			break
	//		}
	//		case 3
	//		{
	//			pos_e_k[i] = pos_ref[i] - pos[i];
	//			vel_ref_k[i] = -208.8*pos_e_k[i] + 198.2*pos_e_k1[i] + vel_ref_k1[i];
	//			vel_e_k[i] = vel_ref_k[i] - vel[i];
	//			r_k[i] = Pz*vel_e_k[i];
	//			break
	//		}
	//	}
	//}


	//------------Angular Controller-----------------//


	for (i=0; i < 3; i++)
	{
		{
			// Calculation of xint
			e_k[i] = y_k[i] - r_k[i];
			if (sat)
				e_k[i] = 0;
			xint_k[i] = T / 2 * (e_k[i] + e_k1[i]) + xint_k1[i];

			// Estimation of the angular velocities
			switch (i)
			{
			case 0:
				o_k[i] = L[i] * x2_k1[i] + B1[0] * u_k1[0] + B1[1] * u_k1[1] + B1[2] * u_k1[2] + B1[3] * u_k1[3];
				break;
			case 1:
				o_k[i] = L[i] * x2_k1[i] + B2[0] * u_k1[0] + B2[1] * u_k1[1] + B2[2] * u_k1[2] + B2[3] * u_k1[3];
				break;
			case 2:
				o_k[i] = L[i] * x2_k1[i] + B3[0] * u_k1[0] + B3[1] * u_k1[1] + B3[2] * u_k1[2] + B3[3] * u_k1[3];
				break;
			}
			oint_k[i] = T / 2 * (o_k[i] + o_k1[i]) + oint_k1[i];
			x2_k[i] = oint_k[i] - L[i] * y_k[i];
		}
	}

	for (i = 0; i < 4; i++)
	{
		switch (i)
		{
		case 0:
			u_k1[i] = F1[0] * y_k[0] + F1[1] * y_k[1] + F1[2] * y_k[2] + F1[3] * x2_k[0] + F1[4] * x2_k[1] + F1[5] * x2_k[2] + Fint1[0] * xint_k[0] + Fint1[1] * xint_k[1] + Fint1[2] * xint_k[2];
			break;
		case 1:
			u_k1[i] = F2[0] * y_k[0] + F2[1] * y_k[1] + F2[2] * y_k[2] + F2[3] * x2_k[0] + F2[4] * x2_k[1] + F2[5] * x2_k[2] + Fint2[0] * xint_k[0] + Fint2[1] * xint_k[1] + Fint2[2] * xint_k[2];
			break;
		case 2:
			u_k1[i] = F3[0] * y_k[0] + F3[1] * y_k[1] + F3[2] * y_k[2] + F3[3] * x2_k[0] + F3[4] * x2_k[1] + F3[5] * x2_k[2] + Fint3[0] * xint_k[0] + Fint3[1] * xint_k[1] + Fint3[2] * xint_k[2];
			break;
		case 3:
			u_k1[i] = F4[0] * y_k[0] + F4[1] * y_k[1] + F4[2] * y_k[2] + F4[3] * x2_k[0] + F4[4] * x2_k[1] + F4[5] * x2_k[2] + Fint4[0] * xint_k[0] + Fint4[1] * xint_k[1] + Fint4[2] * xint_k[2];
			break;
		}
	}

	//pos_e_k1[2] = pos_e_k[2];
	//vel_ref_k1[2] = vel_ref_k[2];

	e_k1[0] = e_k[0];
	e_k1[1] = e_k[1];
	e_k1[2] = e_k[2];
	xint_k1[0] = xint_k[0];
	xint_k1[1] = xint_k[1];
	xint_k1[2] = xint_k[2];
	o_k1[0] = o_k[0];
	o_k1[1] = o_k[1];
	o_k1[2] = o_k[2];
	oint_k1[0] = oint_k[0];
	oint_k1[1] = oint_k[1];
	oint_k1[2] = oint_k[2];
	x2_k1[0] = x2_k[0];
	x2_k1[1] = x2_k[1];
	x2_k1[2] = x2_k[2];
	return;
}


//--------------------- PWM Functions ----------------------------------------//

void ApplyVelocities(void)
{
	//---test code-----------------
	//int i = 0;
	//for( i=0; i<4; i++ )
	//{
	//	u_k1[i] = 0;
	//}
	//u_z = 0;
	//-----------------------------

	float add_z = 0;
	float sum_u_k1 = 0;
	float uk[4] = { 0, 0, 0, 0 };
	unsigned int duty[4] = { 0, 0, 0, 0 };
	unsigned int diff = 0;
	int i;

	sum_u_k1 = u_k1[0] + u_k1[1] + u_k1[2] + u_k1[3];

	add_z = 0;// (u_z - sum_u_k1) / 4;

	sat = 0;

	for (i = 0; i<4; i = i + 1)
	{
		uk[i] = u_k1[i] + add_z + EQU_SPEED;
		//uk[i] = EQU_SPEED;

		duty[i] = (unsigned int)(uk[i] * 0.1563 + 118.21);

		if (duty[i]> DUTY_MAX)
		{
			duty[i] = DUTY_MAX;
			sat = 1;
		}
		else 
		{
			if (duty[i] < DUTY_MIN)
			{
				duty[i] = DUTY_MIN;
				sat = 1;
			}
		}

		//diff = duty[i] - duty_old[i];

		//if (diff>DUTY_MAX_DIFF) || diff < -DUTY_MAX_DIFF)
		//{
		//	if (diff<0)
		//		duty[i] = duty_old[i] - DUTY_MAX_DIFF;
		//	else
		//		duty[i] = duty_old[i] + DUTY_MAX_DIFF;
		//}
			
	}


	//battery = (float)ADC_read()*15/255;
	//if battery<10
	//{
	//	low_level = 1;
	//}

	//Set_PWM_duty(165, 165, 165, 165);
	Set_PWM_duty( duty[0], duty[1], duty[2], duty[3] );
	//Set_PWM_duty(duty0, 128, duty2, 128);
}


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
}


void Set_PWM_duty(int duty0, int duty4A, int duty4B, int duty4C)
{
	OCR0A  = duty0;
	OCR4AL = duty4A; 
	OCR4BL = duty4B;
	OCR4CL = duty4C;
	return;
}

//--------------------- Comunication Functions ----------------------------------------//

int CheckPackageArrival(void)
{
	int pack = 1;
	int i = 0;
	while (i < 3)
	{
		if (USART_Receive() == 255)
		{
			i++;
		}
		else
		{
			pack = 0;
			i = 3;
		}
	}
	return pack;
}


void GetPackage(void)
{
	
	//LED = 0xFF;
	unsigned char dummy[18] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
	unsigned long parts[5] = { 0, 0, 0, 0, 0 };
	unsigned long sum = 0;
	long checksum = 0;
	int sign = -1;

	int i;
	reading = 1;
	for (i=0; i < 18; i++)
	{
		//vTaskSuspendAll();
		dummy[i] = USART_Receive();
		//xTaskResumeAll();
	}
	reading = 0;

	parts[0] |= ((((long)dummy[0]) << 16) | (((long)dummy[1]) << 8) | (((long)dummy[2])));
	parts[1] |= ((((long)dummy[3]) << 16) | (((long)dummy[4]) << 8) | (((long)dummy[5])));
	parts[2] |= ((((long)dummy[6]) << 16) | (((long)dummy[7]) << 8) | (((long)dummy[8])));
	parts[3] |= ((((long)dummy[9]) << 16) | (((long)dummy[10]) << 8) | (((long)dummy[11])));
	parts[4] |= ((((long)dummy[12]) << 16) | (((long)dummy[13]) << 8) | (((long)dummy[14])));

	sum = parts[0] + parts[1] + parts[2] + parts[3] + parts[4];
	sum = (sum & 0x00FFFFFF) + ((sum & 0x07000000) >> 24);

	checksum |= ((((long)dummy[15]) << 16) | (((long)dummy[16]) << 8) | (((long)dummy[17])));

	//Test code
	//if (sum == 0x00FFFFFF)
	//{
	//	USART_Transmit(dummy[3]);
	//}

	if ((sum + checksum) == 0x00FFFFFF)
	{
		LED2 = 0xFF;
		//----------- Roll --------------
		if (dummy[0] & 0x80)
			sign = -1;
		else
			sign = 1;
		y_k[0] = sign*(float)((((dummy[0] << 1) & 0xFE) | ((dummy[1] >> 7) & 0x01))) / 100;
		//----------- Pitch --------------
		if (dummy[1] & 0x40)
			sign = -1;
		else
			sign = 1;
		y_k[1] = sign*(float)((((dummy[1] << 2) & 0xFC) | ((dummy[2] >> 6) & 0x03))) / 100;
		//----------- Yaw --------------
		if (dummy[2] & 0x20)
			sign = -1;
		else
			sign = 1;
		y_k[2] = sign*(float)((((dummy[2] << 3) & 0xF8) | ((dummy[3] >> 5) & 0x07))) / 100;
		//----------- x --------------
		if (dummy[3] & 0x10)
			sign = -1;
		else
			sign = 1;
		pos[0] = sign*(float)((((((int)dummy[3]) << 5) & 0x01E0) | ((dummy[4] >> 3) & 0x1F))) / 100;
		//----------- y --------------
		if (dummy[4] & 0x04)
			sign = -1;
		else
			sign = 1;
		pos[1] = sign*(float)((((((int)dummy[4]) << 7) & 0x0180) | ((dummy[5] >> 1) & 0x7F))) / 100;
		//----------- z --------------
		if (dummy[5] & 0x01)
			sign = -1;
		else
			sign = 1;
		pos[2] = sign*(float)((((((int)dummy[6]) << 1) & 0x01FF) | ((dummy[7] >> 7) & 0x01))) / 100;
		//----------- xref --------------
		if (dummy[7] & 0x40)
			sign = -1;
		else
			sign = 1;
		pos_ref[0] = sign*(float)((((((int)dummy[7]) << 3) & 0x01F8) | ((dummy[8] >> 5) & 0x07))) / 100;
		//----------- yref --------------
		if (dummy[8] & 0x10)
			sign = -1;
		else
			sign = 1;
		pos_ref[1] = sign*(float)((((((int)dummy[8]) << 5) & 0x01E0) | ((dummy[9] >> 3) & 0x1F))) / 100;
		//----------- zref --------------
		if (dummy[9] & 0x04)
			sign = -1;
		else
			sign = 1;
		pos_ref[2] = sign*(float)((((((int)dummy[9]) << 7) & 0x0180) | ((dummy[10] >> 1) & 0x7F))) / 100;
		//----------- xdot --------------
		if (dummy[10] & 0x01)
			sign = -1;
		else
			sign = 1;
		vel[0] = sign*(float)((((((int)dummy[11]) << 2) & 0x03FE) | ((dummy[12] >> 6) & 0x03))) / 100;
		//----------- ydot --------------
		if (dummy[12] & 0x20)
			sign = -1;
		else
			sign = 1;
		vel[1] = sign*(float)((((((int)dummy[12]) << 5) & 0x03E0) | ((dummy[13] >> 3) & 0x1F))) / 100;
		//----------- zdot --------------
		if (dummy[13] & 0x04)
			sign = -1;
		else
			sign = 1;
		vel[2] = sign*(float)(((((int)dummy[13]) << 8) & 0x0300) | dummy[14]) / 100;

		//// Test code
		//if (vel[2] == 1.02)
		//	USART_Transmit(dummy[1]);
		LED2 = 0x00;
	}
	//LED = 0x00;
	return;
}


void USART_Init(unsigned int ubrr){
	/* Set baud rate */
	UBRR0H = (unsigned char)(ubrr >> 8);
	UBRR0L = (unsigned char) ubrr;
	/* Enable receiver and transmitter */
	UCSR0B = (1 << RXEN0) | (1 << TXEN0);
	/* Set frame format: 8data, 2stop bit */
	UCSR0C = (1 << USBS0) | (3 << UCSZ00);
} // USART_Init


unsigned char USART_Receive(void)
{
	/* Wait for data to be received */
	while (!(UCSR0A & (1 << RXC0)))
		;
	/* Get and return received data from buffer */
	return UDR0;
} //USART_Receive


void USART_Transmit(unsigned char data)
{
	/* Wait for empty transmit buffer */
	while (!(UCSR0A & (1 << UDRE0)))
		;
	/* Put data into buffer, sends the data */
	UDR0 = data;
}


//--------------------- ADC Functions ----------------------------------------//

void ADC_Init(void)
{
	//DIDR0 |= 0b00000010; //Disable digital input in the used pin
	//ADMUX = 0b01100001; //AVCC as reference (+5V), left adjusted, ADC1 used
	//ADCSRA = 0b10000111; //Enable ADC and prescaler to 128
}


int ADC_Read(void)
{
	//ADCSRA |= 0b01000000; //Start conversion
	//while (ADCS);
	return ADCH;
}