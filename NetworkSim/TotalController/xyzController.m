s=tf('s');

Kx=-kth*(w1_bar^2+w2_bar^2+w3_bar^2+w4_bar^2);
Gxdot=Kx/(m*s);
%sisotool(Gxdot);
Cxdot=-0.0086904*(1+6.8*s)/s;%
Cxdot=-0.05;

Gx=1/s;
%sisotool(Gx);
Cx=0.17;

Ky=kth*(w1_bar^2+w2_bar^2+w3_bar^2+w4_bar^2);
Gydot=Ky/(m*s);
%sisotool(Gydot);
Cydot=0.0086904*(1+6.8*s)/s;%
Cydot=0.05;

Gy=1/s;
%sisotool(Gy);
Cy=0.17;

Kz=-2*kth*w1_bar^2;
Gzdot=Kz/(m*s);
%sisotool(Gzdot);
Czdot=-201.8*(s+0.8)/s;

Gz=1/s;
%sisotool(Gz);
Cz=0.5;