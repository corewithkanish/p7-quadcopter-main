clear all;
close all;

run Parameters.m

step_x=1;
step_y=0;
step_z=0;

run StateSpace.m

%----------------- Translational Velocity controller ----------------------
s=tf('s');
C_xdot=-0.05;
C_ydot=0.05;
C_zdot=-201*(s+0.8)/s;
K_zdot=-201;
Z_zdot=-0.8;

C_x=0.3;
C_y=0.3;
C_z=0.9;