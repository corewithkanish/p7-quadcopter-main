close all
clc
clear
run Parameters
load('velocityControllers.mat')

figure
plot(xdot.Time, xdot.Data, 'Color', '[0 0 1]','lineWidth', 1.2);
hold on;
plot(xdot_ref.Time, xdot_ref.Data, 'Color','[0 0 0.5]', 'lineStyle', '--','lineWidth', 1.2);
% plot(ydot.Time, ydot.Data, 'Color', '[0 1 0]','lineWidth', 1.2);
% plot(ydot_ref.Time, ydot_ref.Data,'Color','[0 0.5 0]', 'lineStyle', '--','lineWidth', 1.2);
grid on;
grid minor;
title('Translational Velocity Controller in x_I Direction');
xlabel('Time [s]');
ylabel('Translational Velocity [m/s]');
legend('xdot','xdot Reference','Location','southeast');
xlim([0 15])

figure
plot(zdot.Time, zdot.Data, 'Color', '[0 0 1]','lineWidth', 1.2);
hold on
plot(zdot_ref.Time, zdot_ref.Data, 'Color','[0 0 0.5]', 'lineStyle', '--','lineWidth', 1.2);
grid on;
grid minor;
title('Translational Velocity Controller in z_I  Direction');
xlabel('Time [s]');
ylabel('Translational Velocity [m/s]');
legend( 'zdot', 'zdot Reference','Location','southeast');
axis([ 0 6 0 1.2 ])

figure
% plot(roll.Time, roll.Data, 'Color', '[0 1 0]','lineWidth', 1.2);
% hold on;
% plot(roll_ref.Time, roll_ref.Data, 'Color','[0 0.5 0]', 'lineStyle', '--','lineWidth', 1.2);
plot(pitch.Time, pitch.Data, 'Color', '[0 1 0]','lineWidth', 1.2);
hold on
plot(pitch_ref.Time, pitch_ref.Data,'Color','[0 0.5 0]', 'lineStyle', '--','lineWidth', 1.2);
grid on;
grid minor;
title('Control Action for x_I Velocity Controller');
xlabel('Time [s]');
ylabel('Angle [rad]');
legend('Pitch','Pitch Reference','Location','southeast');
xlim([0 15])

figure
plot(wsum.Time, wsum.Data-4*w1_bar, 'Color', '[0 1 0]','lineWidth', 1.2);
hold on
plot(wsum_ref.Time, wsum_ref.Data,'Color','[0 0.5 0]', 'lineStyle', '--','lineWidth', 1.2);
grid on;
grid minor;
title('Control Action for the z_I Velocity Controller');
xlabel('Time [s]');
ylabel('Sum of rotational speeds in the motors [rad/s]');
legend('\omega_{sum}','\omega_{sum} Reference','Location','southeast');
xlim([0 6])