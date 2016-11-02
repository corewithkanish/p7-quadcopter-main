#include <string.h>

const int L[3] = {0, 0, 0};
const float B1[4] = {0.0, 0.0, 0.0, 0.0};
const float B2[4] = {0.0, 0.0, 0.0, 0.0};
const float B3[4] = {0.0, 0.0, 0.0, 0.0};
const float F1[6] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
const float F2[6] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
const float F3[6] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
const float F4[6] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
const float Fint1[6] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
const float Fint2[6] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
const float Fint3[6] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
const float Fint4[6] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0};

float u_k1[4] 	= {0.0, 0.0, 0.0, 0.0};
float y_k[3] 	= {0.0, 0.0, 0.0};	
float y_k1[3] 	= {0.0, 0.0, 0.0};
float r_k1[3] 	= {0.0, 0.0, 0.0};
float r_k[3] 	= {0.0, 0.0, 0.0};
float x2_k1[3] 	= {0.0, 0.0, 0.0};

void AngularController(void)
{
  float x_intk[3] = {0.0, 0.0, 0.0};
	float x2_k[3] = {0.0, 0.0, 0.0};
	float u_k[4] = {0.0, 0.0, 0.0, 0.0};
	
	int i = 0;
	
	for(i; i < 4; i++)
	{
		if (i < 3)
		{
			x_intk[i] = y_k1[i] - r_k1[i];
			
			switch (i) 
			{
				case 0:
					x2_k[i] = L[i] * x2_k1[i] + B1[0]*u_k1[0] + B1[1]*u_k1[1] + B1[2]*u_k1[2] + B1[3]*u_k1[3] - L[i]*y_k[i];
				 break;
				case 1:
					x2_k[i] = L[i] * x2_k1[i] + B2[0]*u_k1[0] + B2[1]*u_k1[1] + B2[2]*u_k1[2] + B2[3]*u_k1[3] - L[i]*y_k[i];
				 break;
				case 2:
					x2_k[i] = L[i] * x2_k1[i] + B3[0]*u_k1[0] + B3[1]*u_k1[1] + B3[2]*u_k1[2] + B3[3]*u_k1[3] - L[i]*y_k[i];
				 break;
			}
		}
		
		switch (i)
		{
			
			case 0:
				u_k[i] = F1[0]*y_k[0] + F1[1]*y_k[1] + F1[2]*y_k[2] + F1[3]*x2_k[0] + F1[4]*x2_k[1] + F1[5]*x2_k[2] + Fint1[0]*x_intk[0] + Fint1[1]*x_intk[1] + Fint1[2]*x_intk[2];
			 break;
			case 1:
				u_k[i] = F2[0]*y_k[0] + F2[1]*y_k[1] + F2[2]*y_k[2] + F2[3]*x2_k[0] + F2[4]*x2_k[1] + F2[5]*x2_k[2] + Fint2[0]*x_intk[0] + Fint2[1]*x_intk[1] + Fint2[2]*x_intk[2];
			 break;
			case 2:
				u_k[i] = F3[0]*y_k[0] + F3[1]*y_k[1] + F3[2]*y_k[2] + F3[3]*x2_k[0] + F3[4]*x2_k[1] + F3[5]*x2_k[2] + Fint3[0]*x_intk[0] + Fint3[1]*x_intk[1] + Fint3[2]*x_intk[2];
			 break;
			case 3:
				u_k[i] = F4[0]*y_k[0] + F4[1]*y_k[1] + F4[2]*y_k[2] + F4[3]*x2_k[0] + F4[4]*x2_k[1] + F4[5]*x2_k[2] + Fint4[0]*x_intk[0] + Fint4[1]*x_intk[1] + Fint4[2]*x_intk[2];
			 break;
		}
			
	}	
		
	memcpy(u_k1, u_k, 4*sizeof(float));
	memcpy(x2_k1, x2_k, 3*sizeof(float));
	memcpy(y_k1, y_k, 3*sizeof(float));
	memcpy(r_k1, r_k, 3*sizeof(float));
  
  return;
}