close all
clear
clc

run StateSpace.m
t=10;
roll_time=0.5;
roll_ref=0.5;
pitch_time=2;
pitch_ref=0.5;
yaw_time=4;
yaw_ref=0.5;
T=0.035;

sim('state_feedback_discrete.slx')

figure
plot(roll.Time, roll.Data, 'Color', '[1 0 0]', 'lineStyle', '--','lineWidth', 1.2);
hold on;
plot(roll_lin.Time, roll_lin.Data, 'Color','[0.5 0 0]','lineWidth', 1.2);
plot(pitch.Time, pitch.Data, 'Color', '[0 1 0]', 'lineStyle', '--','lineWidth', 1.2);
plot(pitch_lin.Time, pitch_lin.Data,'Color','[0 0.5 0]','lineWidth', 1.2);
plot(yaw.Time, yaw.Data, 'Color', '[0 0 1]', 'lineStyle', '--','lineWidth', 1.2);
plot(yaw_lin.Time, yaw_lin.Data, 'Color','[0 0 0.5]','lineWidth', 1.2);
grid on;
grid minor;
title('Continuous and Discrete Controllers Responses');
xlabel('Time [s]');
ylabel('Angle [rad]');
legend('Roll','Roll Discrete', 'Pitch','Pitch Discrete', 'Yaw', 'Yaw Discrete','Location','southeast')

figure
plot(w1.Time,w1.Data, 'Color', '[1 0 0]', 'lineStyle', '--','lineWidth', 1.2);
hold on;
plot(w1_lin.Time,w1_lin.Data, 'Color', '[1 0 0]','lineWidth', 1.2);
plot(w2.Time, w2.Data, 'Color','[0.5 0 0]', 'lineStyle', '--','lineWidth', 1.2);
plot(w2_lin.Time, w2_lin.Data, 'Color','[0.5 0 0]','lineWidth', 1.2);
plot(w3.Time, w3.Data, 'Color', '[0 1 0]', 'lineStyle', '--','lineWidth', 1.2);
plot(w3_lin.Time, w3_lin.Data, 'Color', '[0 1 0]','lineWidth', 1.2);
plot(w4.Time, w4.Data,'Color','[0 0 0.5]', 'lineStyle', '--','lineWidth', 1.2);
plot(w4_lin.Time, w4_lin.Data,'Color','[0 0 0.5]','lineWidth', 1.2);
grid on;
grid minor;
title('Control Action from the Continuous and Discrete Controllers');
xlabel('Time [s]');
ylabel('Motor Rotational Speed [rad/s]');

legend('\omega_1','\omega_1 Discrete','\omega_2','\omega_2 Discrete', '\omega_3','\omega_3 Discrete','\omega_4','\omega_4 Discrete','Location','southeast');
