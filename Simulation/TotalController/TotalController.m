clear all;
close all;

run Parameters.m

step_x=1;
step_y=0;
step_z=0;

run StateSpace.m

%----------------- Translational Velocity controller ----------------------
s=tf('s');
C_xdot=-0.1;
C_ydot=0.1;
C_zdot=-0.5*(0.2*s+1)/(0.13*s+1);

C_x=0.8;
C_y=0.8;
C_z=0.9;