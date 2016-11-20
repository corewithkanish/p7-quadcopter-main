clear ;
close all;

run Parameters.m

step_x=-1;
step_y=1;
step_z=0.5;

run StateSpace.m

%----------------- Translational Velocity controller ----------------------
s=tf('s');
C_xdot=-0.17;
C_ydot=0.17;
C_zdot=-0.5*(0.2*s+1)/(0.13*s+1);

C_x=0.55;
C_y=0.55;
C_z=0.9;