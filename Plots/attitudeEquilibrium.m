close all
clear 
clc

run Parameters
load attitudeEquilibrium

figure%FigHandle = figure('Position', [100, 100, 600, 375]);
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
ylim([-0.4 0.3])
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