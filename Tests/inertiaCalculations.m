clear all
close all
clc

m_s = 0.4;   %mass of sphere [kg]
m_p = 0.074;   %point mass [kg]
m_r = 0.075;   %mass of rod [kg]

r_s = 0.065;   %sphere radius [m]
d_p = 0.120;   %the distance from CM of the point mass to the CM of the quadcopter [m]
L_r = 0.165;   %length of rod [m]
d_r = 0.225;   %is the distance from CM of the rod to the CM of the quadcopter [m]

% syms m_s m_r d_r

I_s = (2/5)*m_s*(r_s^2)
I_p = m_p*(d_p^2)
I_r = (1/12)*m_r*(L_r^2) + m_r*(d_r^2)

I_x = I_s + 2*I_p + 2*I_r
I_y = I_s + 2*I_p + 2*I_r
I_z = I_s + 4*I_p + 4*I_r

% sol = solve( 0.0107  == I_s + 2*I_p + 2*I_r,...
%              0.0107  == I_s + 2*I_p + 2*I_r,...
%              0.02135 == I_s + 4*I_p + 4*I_r,...
%              0.996 == m_r + m_p + m_s,...
%              m_r, m_s, d_r )
% 
% double(sol.m_r)
% double(sol.m_s)
% double(sol.d_r)