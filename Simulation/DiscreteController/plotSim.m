close all
clear
clc

run DiscreteController.m
t=30;
x_ref_time=0.1;
x_ref=1;
y_ref_time=5;
y_ref=1;
z_ref_time=10;
z_ref=1;
sim('DiscreteControllerSim.slx')

figure
plot(x.Time, x.Data, 'Color', '[1 0 0]', 'lineStyle', '--','lineWidth', 1.2);
hold on;
plot(x_lin.Time, x_lin.Data, 'Color','[0.5 0 0]','lineWidth', 1.2);
plot(y.Time, y.Data, 'Color', '[0 1 0]', 'lineStyle', '--','lineWidth', 1.2);
plot(y_lin.Time, y_lin.Data,'Color','[0 0.5 0]','lineWidth', 1.2);
plot(z.Time, z.Data, 'Color', '[0 0 1]', 'lineStyle', '--','lineWidth', 1.2);
plot(z_lin.Time, z_lin.Data, 'Color','[0 0 0.5]','lineWidth', 1.2);
grid on;
grid minor;
title('Continuous and Discrete Translational Controllers');
xlabel('Time [s]');
ylabel('Translational Position [m]');
legend('x','x Discrete', 'y','y Discrete', 'z', 'z Discrete','Location','southeast');


figure
plot(roll.Time, roll.Data, 'Color', '[1 0 0]', 'lineStyle', '--','lineWidth', 1.2);
hold on;
plot(roll_lin.Time, roll_lin.Data, 'Color','[0.5 0 0]','lineWidth', 1.2);
plot(pitch.Time, pitch.Data, 'Color', '[0 1 0]', 'lineStyle', '--','lineWidth', 1.2);
plot(pitch_lin.Time, pitch_lin.Data,'Color','[0 0.5 0]','lineWidth', 1.2);
grid on;
grid minor;
title('Continuous and Discrete Control Action');
xlabel('Time [s]');
ylabel('Angle [rad]');
legend('Roll','Roll Discrete', 'Pitch','Pitch Discrete','Location','southeast');

figure
plot(w_sum.Time, w_sum.Data,'lineStyle', '--','lineWidth', 1.2);
hold on;
plot(w_sum_lin.Time, w_sum_lin.Data,'lineWidth', 1.2);
grid on;
grid minor;
title('Continuous and Discrete Control Action');
xlabel('Time [s]');
ylabel('Sum of rotational speeds in the motors [rad/s]');
legend('Continuous','Discrete')
