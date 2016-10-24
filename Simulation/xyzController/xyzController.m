clear all;
close all;

run Parameters.m

s=tf('s');

Kx=-kth*(w1_bar^2+w2_bar^2+w3_bar^2+w4_bar^2);
Gx=Kx/(m*s);
%sisotool(Gx)
C_xdot=-0.19912;

Ky=kth*(w1_bar^2+w2_bar^2+w3_bar^2+w4_bar^2);
Gy=Kx/(m*s);
%sisotool(Gy)
C_ydot=0.19912;

Kz=-2*kth*w1_bar^2;
Gz=Kz/(m*s);
%sisotool(Gz)
C_zdot=-0.1;

