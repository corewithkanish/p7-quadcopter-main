clear all;
close all;

run Parameters.m

step_x=1;
step_y=0;
step_z=0;

run StateSpace.m

%----------------- Translational Velocity controller ----------------------
s=tf('s');
C_xdot=-0.17;
C_ydot=0.17;
C_zdot=-201*(s+0.8)/s;

C_x=0.55;
C_y=0.55;
C_z=0.9;

T=0.035;
C_zdot_d=c2d(C_zdot,T,'tustin');