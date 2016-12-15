close all
clc 
clear

run Parameters
load positionControllers

figure
plot(x.Time, x.Data, 'Color', '[0 0 1]','lineWidth', 1.2);
hold on;
plot(x_ref.Time, x_ref.Data, 'Color','[0 0 0.5]', 'lineStyle', '--','lineWidth', 1.2);
% plot(y.Time, y.Data, 'Color', '[0 1 0]','lineWidth', 1.2);
% plot(y_ref.Time, y_ref.Data,'Color','[0 0.5 0]', 'lineStyle', '--','lineWidth', 1.2);
grid on;
grid minor;
title('Translational Position Controller in x_I Direction');
xlabel('Time [s]');
ylabel('Translational Position [m]');
legend('x','x Reference','Location','southeast');
xlim([0 20])

figure
plot(xdot.Time, xdot.Data, 'Color', '[0 0 1]','lineWidth', 1.2);
hold on;
plot(xdot_ref.Time, xdot_ref.Data, 'Color','[0 0 0.5]', 'lineStyle', '--','lineWidth', 1.2);
% plot(ydot.Time, ydot.Data, 'Color', '[0 1 0]','lineWidth', 1.2);
% plot(ydot_ref.Time, ydot_ref.Data,'Color','[0 0.5 0]', 'lineStyle', '--','lineWidth', 1.2);
grid on;
grid minor;
title('Control Action for x_I Position Controller');
xlabel('Time [s]');
ylabel('Translational Velocity [m/s]');
legend('xdot','xdot Reference','Location','northeast');
xlim([0 20])

figure
plot(z.Time, z.Data, 'Color', '[0 0 1]','lineWidth', 1.2);
hold on
plot(z_ref.Time, z_ref.Data, 'Color','[0 0 0.5]', 'lineStyle', '--','lineWidth', 1.2);
grid on;
grid minor;
title('Translational Position Controllers in z_I Direction');
xlabel('Time [s]');
ylabel('Translational Position [m]');
legend('z', 'z Reference','Location','southeast');
xlim([0 8])

figure
plot(zdot.Time, zdot.Data, 'Color', '[0 0 1]','lineWidth', 1.2);
hold on
plot(zdot_ref.Time, zdot_ref.Data, 'Color','[0 0 0.5]', 'lineStyle', '--','lineWidth', 1.2);
grid on;
grid minor;
title('Control Action for z_I Position Controller');
xlabel('Time [s]');
ylabel('Translational Velocity [m/s]');
legend( 'zdot', 'zdot Reference','Location','northeast');
xlim([0 8])