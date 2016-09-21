clear all
close all
clc

% Parameters

m  = 0.5;           % Mass [kg]
Fg = 9.82 * m;      % Gravity force[N]

Jx = 0.2;           % Inertia around body x-axis [km·m2]
Jy = 0.2;           % Inertia around body y-axis [km·m2]
Jz = 0.4;           % Inertia around body z-axis [km·m2]

L = 0.16;           % Distance between center of the quadcopter and center of each motor [m]

kth =  0.04;        % Speed of the motor -> thrust force [N·s/rad]
kd =  0.0001;       % Speed of the motor -> drag torque by proppeller [N·m·s/rad]