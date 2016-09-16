clear all
close all


%% Parameters



m  = 0.5;           % Mass

Fg = 9.82 * m;

Jx = 0.2; 
Jy = 0.2;
Jz = 0.4;

L = 0.16;

kth =  0.04;         % Speed of the motor -> thrust force.
                    
kd =  0.0001;       % The speed of the motor -> drag torque by proppeller.