clear 
close all
clc

% Parameters

m  = 1.004;           % Mass [kg]
Fg = 9.81 * m;      % Gravity force[N]

Jx = 0.0107;           % Inertia around body x-axis [km·m2]
Jy = 0.0107;           % Inertia around body y-axis [km·m2]
Jz = 0.0214;           % Inertia around body z-axis [km·m2]

L = 0.19;           % Distance between center of the quadcopter and center of each motor [m]

kth =  1.5e-5;        % Speed of the motor -> thrust force [N·s/rad]
kd =  6e-7;       % Speed of the motor -> drag torque by proppeller [N·m·s/rad]

w1_bar=sqrt(Fg/kth/4);
w2_bar=sqrt(Fg/kth/4);
w3_bar=sqrt(Fg/kth/4);
w4_bar=sqrt(Fg/kth/4);

