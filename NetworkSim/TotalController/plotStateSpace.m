close all
clear
clc

run TotalController.m
t=10;
xdot_ref_time=0;
xdot_ref_step=0;
ydot_ref_time=0;
ydot_ref_step=0;
zdot_ref_time=0;
zdot_ref_step=0;
x_ref_time=0;
x_ref_step=0;
y_ref_time=0;
y_ref_step=0;
z_ref_time=0;
z_ref_step=0;
roll_init=-0.2;
pitch_init=0.1;
yaw_init=-0.15;

sim('TotalControllerSimOld.slx')

FigHandle = figure('Position', [100, 100, 600, 375]);
plot(roll.Time, roll.Data, 'Color', '[1 0 0]','lineWidth', 1.2);
hold on;
plot(pitch.Time, pitch.Data, 'Color', '[0 1 0]','lineWidth', 1.2);
plot(yaw.Time, yaw.Data, 'Color', '[0 0 1]','lineWidth', 1.2);
grid on;
grid minor;
title('Response of the Attitude Controller','Fontsize',12);
xlabel('Time [s]','Fontsize',12);
ylabel('Angle [rad]','Fontsize',12);
legend('Roll', 'Pitch', 'Yaw','Location','southeast');

FigHandle = figure('Position', [100, 100, 600, 375]);
plot(roll.Time, roll.Data, 'Color', '[1 0 0]','lineWidth', 1.2);
hold on;
plot(pitch.Time, pitch.Data, 'Color', '[0 1 0]','lineWidth', 1.2);
grid on;
grid minor;
xlim([0 8])
title('Step Response of the Attitude Controller','Fontsize',12);
xlabel('Time [s]','Fontsize',12);
ylabel('Angle [rad]','Fontsize',12);
legend('Roll', 'Pitch','Location','southeast');

FigHandle = figure('Position', [100, 100, 800, 500]);
subplot(2,2,1)
plot(w1.Time(50:end),w1.Data(50:end), 'Color', '[1 0 0]','lineWidth', 1.2)
xlabel('Time [s]')
ylabel('\omega_1 [rad/s]')
xlim([0 t])
ylim([250 650])
grid on
grid minor
subplot(2,2,2)
plot(w2.Time(50:end), w2.Data(50:end), 'Color','[0 1 0]','lineWidth', 1.2)
xlabel('Time [s]')
ylabel('\omega_2 [rad/s]')
xlim([0 t])
ylim([250 650])
grid on;
grid minor;
subplot(2,2,3)
plot(w3.Time(50:end), w3.Data(50:end), 'Color', '[0 0 1]','lineWidth', 1.2)
xlabel('Time [s]')
ylabel('\omega_3 [rad/s]')
xlim([0 t])
ylim([250 650])
grid on
grid minor
subplot(2,2,4)
plot(w4.Time(50:end), w4.Data(50:end),'Color','[0 0 0]','lineWidth', 1.2)
xlabel('Time [s]')
ylabel('\omega_4 [rad/s]')
xlim([0 t])
ylim([250 650])
grid on;
grid minor;
set(gcf,'NextPlot','add');
axes;
h = title('Control Action of the Attitude Controller');
set(gca,'Visible','off');
set(h,'Visible','on');

