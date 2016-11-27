close all
clear
clc

run StateSpace.m
t=9;
roll_time=0.5;
roll_ref=0.5;
pitch_time=2;
pitch_ref=0.5;
yaw_time=4;
yaw_ref=0.5;

sim('state_feedback.slx')

figure
plot(roll.Time, roll.Data, 'Color', '[1 0 0]','lineWidth', 1.2);
hold on;
plot(roll_ref.Time, roll_ref.Data, 'Color','[0.5 0 0]', 'lineStyle', '--','lineWidth', 1.2);
plot(pitch.Time, pitch.Data, 'Color', '[0 1 0]','lineWidth', 1.2);
plot(pitch_ref.Time, pitch_ref.Data,'Color','[0 0.5 0]', 'lineStyle', '--','lineWidth', 1.2);
plot(yaw.Time, yaw.Data, 'Color', '[0 0 1]','lineWidth', 1.2);
plot(yaw_ref.Time, yaw_ref.Data, 'Color','[0 0 0.5]', 'lineStyle', '--','lineWidth', 1.2);
grid on;
grid minor;
title('Attitude Controller Response');
xlabel('Time [s]');
ylabel('Angle [rad]');

legend('Roll','Roll Reference', 'Pitch','Pitch Reference', 'Yaw', 'Yaw Reference','Location','southeast');

figure
plot(w1.Time,w1.Data, 'Color', '[1 0 0]','lineWidth', 1.2);
hold on;
plot(w2.Time, w2.Data, 'Color','[0.5 0 0]','lineWidth', 1.2);
plot(w3.Time, w3.Data, 'Color', '[0 1 0]','lineWidth', 1.2);
plot(w4.Time, w4.Data,'Color','[0 0 0.5]','lineWidth', 1.2);
grid on;
grid minor;
title('Control Action for the Attitude Controller');
xlabel('Time [s]');
ylabel('Motor Rotational Speed [rad/s]');

legend('\omega_1','\omega_2', '\omega_3','\omega_4','Location','southeast');

figure
plot(roll_lin.Time, roll_lin.Data, 'Color', '[1 0 0]','lineWidth', 1.2);
hold on;
plot(roll_ref.Time, roll_ref.Data, 'Color','[0.5 0 0]', 'lineStyle', '--','lineWidth', 1.2);
plot(pitch_lin.Time, pitch_lin.Data, 'Color', '[0 1 0]','lineWidth', 1.2);
plot(pitch_ref.Time, pitch_ref.Data,'Color','[0 0.5 0]', 'lineStyle', '--','lineWidth', 1.2);
plot(yaw_lin.Time, yaw_lin.Data, 'Color', '[0 0 1]','lineWidth', 1.2);
plot(yaw_ref.Time, yaw_ref.Data, 'Color','[0 0 0.5]', 'lineStyle', '--','lineWidth', 1.2);
grid on;
grid minor;
title('Attitude Control in the Linear System');
xlabel('Time [s]');
ylabel('Angle [rad]');

legend('Roll','Roll Reference', 'Pitch','Pitch Reference', 'Yaw', 'Yaw Reference','Location','southeast');

figure
plot(w1_lin.Time,w1_lin.Data, 'Color', '[1 0 0]','lineWidth', 1.2);
hold on;
plot(w2_lin.Time, w2_lin.Data, 'Color','[0.5 0 0]','lineWidth', 1.2);
plot(w3_lin.Time, w3_lin.Data, 'Color', '[0 1 0]','lineWidth', 1.2);
plot(w4_lin.Time, w4_lin.Data,'Color','[0 0 0.5]','lineWidth', 1.2);
grid on;
grid minor;
title('Control Action in the Linear System');
xlabel('Time [s]');
ylabel('Motor Rotational Speed [rad/s]');

legend('\omega_1','\omega_2', '\omega_3','\omega_4','Location','southeast');