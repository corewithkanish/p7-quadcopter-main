%% Transfer function and controller for x_I direction
clear
close all
clc

run Parameters.m
run attitudeController.m
roll_ref=0;
pitch_ref=1;
sim('attitudeControllerSim')

% Find dynamics for pitch controller
close all
ts=0.57;
Mp=0;
chi=0.87;
wn=4.6/ts/chi;

s=tf('s');
Gpitch=wn^2/(s^2+2*chi*wn*s+wn^2);
disp(Gpitch);

Kx=-kth*(w1_bar^2+w2_bar^2+w3_bar^2+w4_bar^2);
Gxdot=Kx/(m*s);

FigHandle = figure('Position', [100, 100, 600, 400]);
step(Gpitch);
set(findall(gcf,'Type','line'),'LineWidth',1.2);
hold on;
plot(pitch.Time, pitch.Data,'k','LineWidth',1.2);
grid on;
grid minor;
ylabel('Angle (rad)');
legend('Simulated Response','Second Order Approximation','Location','SouthEast');

% Design the velocity controller
%sisotool(Gpitch*Gxdot);
FigHandle = figure('Position', [100, 100, 600, 400]);
rlocus(-Gpitch*Gxdot);
hold on;
set(findall(gcf,'Type','line'),'LineWidth',1.2);

Cxdot=-0.19;
Gxdot_cl=Cxdot*Gxdot*Gpitch/(1+Cxdot*Gxdot*Gpitch);

% Step response (output, control action) of the final velocity control loop
FigHandle = figure('Position', [100, 100, 600, 400]);
step(Gxdot_cl);
hold on;
set(findall(gcf,'Type','line'),'LineWidth',1.2);
grid on;
grid minor;
ylabel('Translational Velocity (m/s)');

FigHandle = figure('Position', [100, 100, 600, 400]);
step(Cxdot/(1+Cxdot*Gxdot*Gpitch))
hold on;
set(findall(gcf,'Type','line'),'LineWidth',1.2);
grid on;
grid minor;
ylabel('Angle (rad)');

% Design the position controller
Gx=1/s;
%sisotool(Gx*Gxdot_cl);
FigHandle = figure('Position', [100, 100, 600, 400]);
rlocus(Gx*Gxdot_cl);
hold on;
set(findall(gcf,'Type','line'),'LineWidth',1.2);

Cx=0.8;
Gx_cl=Cx*Gx*Gxdot_cl/(1+Cx*Gx*Gxdot_cl);

% Step response (output, control action) of the final poition control loop
FigHandle = figure('Position', [100, 100, 600, 400]);
step(Gx_cl);
hold on;
set(findall(gcf,'Type','line'),'LineWidth',1.2);
grid on;
grid minor;
ylabel('Translational Position (m)');

FigHandle = figure('Position', [100, 100, 600, 400]);
step(Cx/(1+Cx*Gx*Gxdot_cl))
hold on;
set(findall(gcf,'Type','line'),'LineWidth',1.2);
grid on;
grid minor;
ylabel('Translational Velocity (m/s)');

%% Transfer function and controller for y_I direction
clear
close all
clc

run Parameters.m
run attitudeController.m
roll_ref=1;
pitch_ref=0;
sim('attitudeControllerSim')

% Find dynamics for pitch controller
close all
ts=0.57;
Mp=0;
chi=0.87;
wn=4.6/ts/chi;

s=tf('s');
Groll=wn^2/(s^2+2*chi*wn*s+wn^2);
disp(Groll);

Ky=kth*(w1_bar^2+w2_bar^2+w3_bar^2+w4_bar^2);
Gydot=Ky/(m*s);

FigHandle = figure('Position', [100, 100, 600, 400]);
step(Groll);
set(findall(gcf,'Type','line'),'LineWidth',1.2);
hold on;
plot(roll.Time, roll.Data,'k','LineWidth',1.2);
grid on;
grid minor;
ylabel('Angle (rad)');
legend('Simulated Response','Second Order Approximation','Location','SouthEast');

% Design the velocity controller
%sisotool(Groll*Gydot);
FigHandle = figure('Position', [100, 100, 600, 400]);
rlocus(Groll*Gydot);
hold on;
set(findall(gcf,'Type','line'),'LineWidth',1.2);

Cydot=0.19;
Gydot_cl=Cydot*Gydot*Groll/(1+Cydot*Gydot*Groll);

% Step response (output, control action) of the final velocity control loop
FigHandle = figure('Position', [100, 100, 600, 400]);
step(Gydot_cl);
hold on;
set(findall(gcf,'Type','line'),'LineWidth',1.2);
grid on;
grid minor;
ylabel('Translational Velocity (m/s)');

FigHandle = figure('Position', [100, 100, 600, 400]);
step(Cydot/(1+Cydot*Gydot*Groll))
hold on;
set(findall(gcf,'Type','line'),'LineWidth',1.2);
grid on;
grid minor;
ylabel('Angle (rad)');

% Design the position controller
Gy=1/s;
%sisotool(Gy*Gydot_cl);
FigHandle = figure('Position', [100, 100, 600, 400]);
rlocus(Gy*Gydot_cl);
hold on;
set(findall(gcf,'Type','line'),'LineWidth',1.2);

Cy=0.8;
Gy_cl=Cy*Gy*Gydot_cl/(1+Cy*Gy*Gydot_cl);

% Step response (output, control action) of the final poition control loop
FigHandle = figure('Position', [100, 100, 600, 400]);
step(Gy_cl);
hold on;
set(findall(gcf,'Type','line'),'LineWidth',1.2);
grid on;
grid minor;
ylabel('Translational Position (m)');

FigHandle = figure('Position', [100, 100, 600, 400]);
step(Cy/(1+Cy*Gy*Gydot_cl))
hold on;
set(findall(gcf,'Type','line'),'LineWidth',1.2);
grid on;
grid minor;
ylabel('Translational Velocity (m/s)');


%% Transfer function and controller for z_I direction
clear
close all
clc
run Parameters.m

s=tf('s');
Kz=-2*kth*w1_bar^2;
Gz=Kz/(m*s);
FigHandle = figure('Position', [100, 100, 800, 400]);
%step(Gz)
%bode(Gz)
%xlim([0.01 100]);
%grid minor;
%sisotool(Gz)
C_zdot=-0.1;

