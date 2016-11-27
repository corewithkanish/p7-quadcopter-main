%% -------- Velocity Controller ------------------------------------------
close all
clear
clc
run TotalController.m
t=20;
xdot_ref_time=0.1;
xdot_ref=1;
ydot_ref_time=5;
ydot_ref=1;
zdot_ref_time=10;
zdot_ref=1;
sim('VelocityControllerSim.slx')

figure
plot(xdot.Time, xdot.Data, 'Color', '[1 0 0]','lineWidth', 1.2);
hold on;
plot(xdotref.Time, xdotref.Data, 'Color','[0.5 0 0]', 'lineStyle', '--','lineWidth', 1.2);
plot(ydot.Time, ydot.Data, 'Color', '[0 1 0]','lineWidth', 1.2);
plot(ydotref.Time, ydotref.Data,'Color','[0 0.5 0]', 'lineStyle', '--','lineWidth', 1.2);
plot(zdot.Time, zdot.Data, 'Color', '[0 0 1]','lineWidth', 1.2);
plot(zdotref.Time, zdotref.Data, 'Color','[0 0 0.5]', 'lineStyle', '--','lineWidth', 1.2);
grid on;
grid minor;
title('Velocity Translational Controllers');
xlabel('Time [s]');
ylabel('Translational Velocity [m/s]');
legend('xdot','xdot Reference', 'ydot','ydot Reference', 'zdot', 'zdot Reference','Location','southeast');
%ylim([-0.2 1.2])

figure
plot(roll.Time, roll.Data, 'Color', '[1 0 0]','lineWidth', 1.2);
hold on;
plot(roll_ref.Time, roll_ref.Data, 'Color','[0.5 0 0]', 'lineStyle', '--','lineWidth', 1.2);
plot(pitch.Time, pitch.Data, 'Color', '[0 1 0]','lineWidth', 1.2);
plot(pitch_ref.Time, pitch_ref.Data,'Color','[0 0.5 0]', 'lineStyle', '--','lineWidth', 1.2);
grid on;
grid minor;
title('Control Action for x and y Velocity Controllers');
xlabel('Time [s]');
ylabel('Angle [rad]');
legend('Roll','Roll Reference', 'Pitch','Pitch Reference','Location','southeast');

figure
plot(w_sum.Time, w_sum.Data,'lineWidth', 1.2);
hold on;
grid on;
grid minor;
title('Control Action for the z Velocity Controller');
xlabel('Time [s]');
ylabel('Sum of rotational speeds in the motors [rad/s]');


%% ------------ Position Controller --------------------------------------
close all
clear
clc
run TotalController.m
t=30;
xdot_ref_time=0.1;
xdot_ref=1;
ydot_ref_time=5;
ydot_ref=1;
zdot_ref_time=10;
zdot_ref=1;
sim('TotalControllerSim.slx')

figure
plot(x_lin.Time, x_lin.Data, 'Color', '[1 0 0]','lineWidth', 1.2);
hold on;
plot(xref.Time, xref.Data, 'Color','[0.5 0 0]', 'lineStyle', '--','lineWidth', 1.2);
plot(y_lin.Time, y_lin.Data, 'Color', '[0 1 0]','lineWidth', 1.2);
plot(yref.Time, yref.Data,'Color','[0 0.5 0]', 'lineStyle', '--','lineWidth', 1.2);
plot(z_lin.Time, z_lin.Data, 'Color', '[0 0 1]','lineWidth', 1.2);
plot(zref.Time, zref.Data, 'Color','[0 0 0.5]', 'lineStyle', '--','lineWidth', 1.2);
grid on;
grid minor;
title('Translational Control in the Linear System');
xlabel('Time [s]');
ylabel('Translational Position [m]');
legend('x','x Reference', 'y','y Reference', 'z', 'z Reference','Location','southeast');
ylim([-0.2 1.2])

figure
plot(roll_lin.Time, roll_lin.Data, 'Color', '[1 0 0]','lineWidth', 1.2);
hold on;
plot(roll_ref_lin.Time, roll_ref_lin.Data, 'Color','[0.5 0 0]', 'lineStyle', '--','lineWidth', 1.2);
plot(pitch_lin.Time, pitch_lin.Data, 'Color', '[0 1 0]','lineWidth', 1.2);
plot(pitch_ref_lin.Time, pitch_ref_lin.Data,'Color','[0 0.5 0]', 'lineStyle', '--','lineWidth', 1.2);
grid on;
grid minor;
title('Control Action in the Linear System');
xlabel('Time [s]');
ylabel('Angle [rad]');
legend('Roll','Roll Reference', 'Pitch','Pitch Reference','Location','southeast');

figure
plot(w_sum_lin.Time, w_sum_lin.Data,'lineWidth', 1.2);
hold on;
grid on;
grid minor;
title('Control Action in the Non-Linear System');
xlabel('Time [s]');
ylabel('Sum of rotational speeds in the motors [rad/s]');

