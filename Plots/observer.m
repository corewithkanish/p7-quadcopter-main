close all
clc
clear

run Parameters
load observer

FigHandle = figure('Position', [100, 100, 600, 375]);
plot(roll.Time, roll.Data, 'Color', '[0 0 1]','lineWidth', 1.2);
hold on;
plot(pitch.Time, pitch.Data, 'Color', '[0 1 0]','lineWidth', 1.2);
plot(yaw.Time, yaw.Data, 'Color', '[1 0 0]','lineWidth', 1.2);
grid on;
grid minor;
title('Response of an Attitude Controller','Fontsize',12);
xlabel('Time [s]','Fontsize',12);
ylabel('Angular Velocity [rad/s]','Fontsize',12);
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
ylabel('Angular Velocity [rad/s]','Fontsize',12);
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
ylabel('Angular Velocity [rad/s]','Fontsize',12);
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
ylabel('Angular Velocity [rad/s]','Fontsize',12);
xlim([0 1.5])
legend('Yaw Angular Velocity Estimation','Yaw Angular Velocity','Location','southeast');

