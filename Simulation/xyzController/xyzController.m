%% Transfer function and controller for x_I direction
clear
close all
clc
run Parameters.m

s=tf('s');
Kx=-kth*(w1_bar^2+w2_bar^2+w3_bar^2+w4_bar^2);
Gx=Kx/(m*s);
%FigHandle = figure('Position', [100, 100, 800, 400]);
%bode(Gx);

%xlim([0.01 100]);
%grid minor;
%sisotool(Gx)
C_xdot=-0.19912;

%P-controller
K_p=-0.907;
OPP_x=(-1.906*Gx)/(1-1.906*Gx);
%step(OPP_x)
Ts=0.5;

C = pidstd(K_p,Ts)


step((C*Gx)/(1+C*Gx))
%% Transfer function and controller for y_I direction
clear
close all
clc
run Parameters.m

s=tf('s');
Ky=kth*(w1_bar^2+w2_bar^2+w3_bar^2+w4_bar^2);
Gy=Ky/(m*s);
FigHandle = figure('Position', [100, 100, 800, 400]);
%step(Gy);
bode(Gy);
%xlim([0.01 100]);
%grid minor;
%sisotool(Gy)
C_ydot=0.19912;

%% Transfer function and controller for z_I direction
clear
close all
clc
run Parameters.m

s=tf('s');
Kz=-2*kth*w1_bar^2;
Gz=Kz/(m*s);
FigHandle = figure('Position', [100, 100, 800, 400]);
%step(Gz)
%bode(Gz)
%xlim([0.01 100]);
%grid minor;
%sisotool(Gz)
C_zdot=-0.1;

