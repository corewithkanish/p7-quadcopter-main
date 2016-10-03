clear all
close all
clc

% Parameters

m  = 0.5;           % Mass [kg]
Fg = 9.82 * m;      % Gravity force[N]

Jx = 0.1;           % Inertia around body x-axis [km·m2]
Jy = 0.1;           % Inertia around body y-axis [km·m2]
Jz = 0.2;           % Inertia around body z-axis [km·m2]

L = 0.16;           % Distance between center of the quadcopter and center of each motor [m]

kth =  1.5e-5;        % Speed of the motor -> thrust force [N·s/rad]
kd =  6e-7;       % Speed of the motor -> drag torque by proppeller [N·m·s/rad]

w1_bar=167;
w2_bar=167;
w3_bar=167;
w4_bar=167;