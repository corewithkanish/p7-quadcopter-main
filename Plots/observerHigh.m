close all
clear
clc

load observerHigh

FigHandle = figure('Position', [100, 100, 600, 375]);
plot(roll.Time, roll.Data, 'Color', '[0 0 1]','lineWidth', 1.2);
hold on;
plot(pitch.Time, pitch.Data, 'Color', '[0 1 0]','lineWidth', 1.2);
plot(yaw.Time, yaw.Data, 'Color', '[1 0 0]','lineWidth', 1.2);
grid on;
grid minor;
title('Response of an Attitude Controller with Higher Observer Gains','Fontsize',12);
xlabel('Time [s]','Fontsize',12);
ylabel('Angle [rad]','Fontsize',12);
xlim([0 4])
legend('Roll', 'Pitch','Yaw','Location','southeast');