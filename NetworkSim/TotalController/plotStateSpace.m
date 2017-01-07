
%% Back to equilibrium
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
roll_init=-0.3;
roll_ref_time=0;
roll_step=0;
pitch_init=0.2;
pitch_step=0;
pitch_ref_time=0;
yaw_init=-0.2;
yaw_step=0;

sim('TotalControllerSimOld.slx')

FigHandle = figure('Position', [100, 100, 600, 375]);
plot(roll.Time, roll.Data, 'Color', '[0 0 1]','lineWidth', 1.2);
hold on;
plot(pitch.Time, pitch.Data, 'Color', '[0 1 0]','lineWidth', 1.2);
plot(yaw.Time, yaw.Data, 'Color', '[1 0 0]','lineWidth', 1.2);
grid on;
grid minor;
title('Response of an Attitude Controller','Fontsize',12);
xlabel('Time [s]','Fontsize',12);
ylabel('Angle [rad]','Fontsize',12);
xlim([0 4])
legend('Roll', 'Pitch','Yaw','Location','southeast');


FigHandle = figure('Position', [100, 100, 800, 500]);
subplot(2,2,1)
plot(w1.Time(50:end),w1.Data(50:end), 'Color', '[1 0 0]','lineWidth', 1.2)
xlabel('Time [s]','Fontsize',12)
ylabel('\omega_1 [rad/s]','Fontsize',12)
xlim([0 4])
ylim([250 650])
grid on
grid minor
subplot(2,2,2)
plot(w2.Time(50:end), w2.Data(50:end), 'Color','[0 1 0]','lineWidth', 1.2)
xlabel('Time [s]','Fontsize',12)
ylabel('\omega_2 [rad/s]','Fontsize',12)
xlim([0 4])
ylim([250 650])
grid on;
grid minor;
subplot(2,2,3)
plot(w3.Time(50:end), w3.Data(50:end), 'Color', '[0 0 1]','lineWidth', 1.2)
xlabel('Time [s]','Fontsize',12)
ylabel('\omega_3 [rad/s]','Fontsize',12)
xlim([0 4])
ylim([250 650])
grid on
grid minor
subplot(2,2,4)
plot(w4.Time(50:end), w4.Data(50:end),'Color','[0 0 0]','lineWidth', 1.2)
xlabel('Time [s]','Fontsize',12)
ylabel('\omega_4 [rad/s]','Fontsize',12)
xlim([0 4])
ylim([250 650])
grid on;
grid minor;
set(gcf,'NextPlot','add');
axes;
h = title('Control Action of the Attitude Controller','Fontsize',12);
set(gca,'Visible','off');
set(h,'Visible','on');

%% Step Response
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
roll_init=0;
roll_step=1;
roll_ref_time=0;
pitch_init=0;
pitch_step=0;
pitch_ref_time=0;
yaw_init=0;
yaw_step=0;

sim('TotalControllerSimOld.slx')

FigHandle = figure('Position', [100, 100, 600, 375]);
plot(roll.Time, roll.Data, 'Color', '[0 0 1]','lineWidth', 1.2);
hold on;
%plot(pitch.Time, pitch.Data, 'Color', '[0 1 0]','lineWidth', 1.2);
%plot(yaw.Time, yaw.Data, 'Color', '[1 0 0]','lineWidth', 1.2);
grid on;
grid minor;
xlim([0 5])
title('Step Response of the Attitude Controller in Roll','Fontsize',12);
xlabel('Time [s]','Fontsize',12);
ylabel('Angle [rad]','Fontsize',12);
%legend('Roll', 'Location','southeast');

FigHandle = figure('Position', [100, 100, 800, 500]);
subplot(2,2,1)
plot(w1.Time(50:end),w1.Data(50:end), 'Color', '[1 0 0]','lineWidth', 1.2)
xlabel('Time [s]','Fontsize',12)
ylabel('\omega_1 [rad/s]','Fontsize',12)
xlim([0 5])
%ylim([250 650])
grid on
grid minor
subplot(2,2,2)
plot(w2.Time(50:end), w2.Data(50:end), 'Color','[0 1 0]','lineWidth', 1.2)
xlabel('Time [s]','Fontsize',12)
ylabel('\omega_2 [rad/s]','Fontsize',12)
xlim([0 5])
%ylim([250 650])
grid on;
grid minor;
subplot(2,2,3)
plot(w3.Time(50:end), w3.Data(50:end), 'Color', '[0 0 1]','lineWidth', 1.2)
xlabel('Time [s]','Fontsize',12)
ylabel('\omega_3 [rad/s]','Fontsize',12)
xlim([0 5])
%ylim([250 650])
grid on
grid minor
subplot(2,2,4)
plot(w4.Time(50:end), w4.Data(50:end),'Color','[0 0 0]','lineWidth', 1.2)
xlabel('Time [s]','Fontsize',12)
ylabel('\omega_4 [rad/s]','Fontsize',12)
xlim([0 5])
%ylim([250 650])
grid on;
grid minor;
set(gcf,'NextPlot','add');
axes;
h = title('Control Action of the Step Response of the Attitude Controller','Fontsize',12);
set(gca,'Visible','off');
set(h,'Visible','on');

%% Observer
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
roll_init=-0.3;
roll_step=0;
roll_ref_time=0;
pitch_ref_time=0;
pitch_init=0.2;
pitch_step=0;
yaw_init=-0.2;
yaw_step=0;

sim('TotalControllerSimOld.slx')

FigHandle = figure('Position', [100, 100, 600, 375]);
plot(roll.Time, roll.Data, 'Color', '[0 0 1]','lineWidth', 1.2);
hold on;
plot(pitch.Time, pitch.Data, 'Color', '[0 1 0]','lineWidth', 1.2);
plot(yaw.Time, yaw.Data, 'Color', '[1 0 0]','lineWidth', 1.2);
grid on;
grid minor;
title('Response of an Attitude Controller','Fontsize',12);
xlabel('Time [s]','Fontsize',12);
ylabel('Angle [rad]','Fontsize',12);
xlim([0 4])
legend('Roll', 'Pitch','Yaw','Location','southeast');

FigHandle = figure('Position', [100, 100, 800, 600]);
subplot(3,1,1)
plot(x4_est.Time, x4_est.Data, 'Color', '[1 0 0]','lineWidth', 1.2);
hold on;
plot(x4.Time, x4.Data, 'Color', '[0 0 1]','lineWidth', 1.2, 'lineStyle', '--');
grid on;
grid minor;
title('Estimation of the Roll Angular Velocity','Fontsize',12);
xlabel('Time [s]','Fontsize',12);
ylabel('Angle [rad]','Fontsize',12);
legend('Roll Angular Velocity Estimation','Roll Angular Velocity','Location','southeast')
xlim([0 1.5])
subplot(3,1,2)
plot(x5_est.Time, x5_est.Data, 'Color', '[1 0 0]','lineWidth', 1.2);
hold on;
plot(x5.Time, x5.Data, 'Color', '[0 0 1]','lineWidth', 1.2, 'lineStyle', '--');
grid on;
grid minor;
title('Estimation of the Pitch Angular Velocity','Fontsize',12);
xlabel('Time [s]','Fontsize',12);
ylabel('Angle [rad]','Fontsize',12);
legend('Pitch Angular Velocity Estimation','Pitch Angular Velocity','Location','southeast')
xlim([0 1.5])
subplot(3,1,3)
plot(x6_est.Time, x6_est.Data, 'Color', '[1 0 0]','lineWidth', 1.2);
hold on;
plot(x6.Time, x6.Data, 'Color', '[0 0 1]','lineWidth', 1.2, 'lineStyle', '--');
grid on;
grid minor;
title('Estimation of the Yaw Angular Velocity','Fontsize',12);
xlabel('Time [s]','Fontsize',12);
ylabel('Angle [rad]','Fontsize',12);
xlim([0 1.5])
legend('Yaw Angular Velocity Estimation','Yaw Angular Velocity','Location','southeast');


