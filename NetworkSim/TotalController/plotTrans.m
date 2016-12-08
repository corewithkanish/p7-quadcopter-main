%% ------- Bode for attitude Controller ---------------------------------
close all
clear
clc
run Parameters.m
run StateSpace.m
FigHandle = figure('Position', [100, 100, 700, 400]);
H=zpk(system_cl);
bodeplot(H(1,1),{0.1,5})
set(findall(gcf,'Type','line'),'LineWidth',1.2);
hold on
grid on
grid minor

%% -------- Velocity Controller ------------------------------------------
close all
clear
clc
run TotalController.m
t=20;
xdot_ref_time=0;
xdot_ref_step=1;
ydot_ref_time=0;
ydot_ref_step=1;
zdot_ref_time=0;
zdot_ref_step=1;
roll_init=0;
pitch_init=0;
yaw_init=0;
x_ref_time=0;
x_ref_step=0;
y_ref_time=0;
y_ref_step=0;
z_ref_time=0;
z_ref_step=0;

sim('TotalControllerSimOld.slx')

figure
plot(xdot.Time, xdot.Data, 'Color', '[1 0 0]','lineWidth', 1.2);
hold on;
plot(xdot_ref.Time, xdot_ref.Data, 'Color','[0.5 0 0]', 'lineStyle', '--','lineWidth', 1.2);
plot(ydot.Time, ydot.Data, 'Color', '[0 1 0]','lineWidth', 1.2);
plot(ydot_ref.Time, ydot_ref.Data,'Color','[0 0.5 0]', 'lineStyle', '--','lineWidth', 1.2);
plot(zdot.Time, zdot.Data, 'Color', '[0 0 1]','lineWidth', 1.2);
plot(zdot_ref.Time, zdot_ref.Data, 'Color','[0 0 0.5]', 'lineStyle', '--','lineWidth', 1.2);
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
plot(wsum.Time, wsum.Data,'lineWidth', 1.2);
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
x_ref_time=0.1;
x_ref_step=5;
y_ref_time=0.1;
y_ref_step=0;
z_ref_time=0.1;
z_ref_step=5;
xdot_ref_time=0;
xdot_ref_step=0;
ydot_ref_time=0;
ydot_ref_step=0;
zdot_ref_time=0;
zdot_ref_step=0;
roll_init=0;
pitch_init=0;
yaw_init=0;
sim('TotalControllerSimOld.slx')

figure
plot(x.Time, x.Data, 'Color', '[1 0 0]','lineWidth', 1.2);
hold on;
plot(x_ref.Time, x_ref.Data, 'Color','[0.5 0 0]', 'lineStyle', '--','lineWidth', 1.2);
plot(y.Time, y.Data, 'Color', '[0 1 0]','lineWidth', 1.2);
plot(y_ref.Time, y_ref.Data,'Color','[0 0.5 0]', 'lineStyle', '--','lineWidth', 1.2);
plot(z.Time, z.Data, 'Color', '[0 0 1]','lineWidth', 1.2);
plot(z_ref.Time, z_ref.Data, 'Color','[0 0 0.5]', 'lineStyle', '--','lineWidth', 1.2);
grid on;
grid minor;
title('Translational Control in the Linear System');
xlabel('Time [s]');
ylabel('Translational Position [m]');
legend('x','x Reference', 'y','y Reference', 'z', 'z Reference','Location','southeast');
ylim([-0.2 1.2])

figure
plot(roll.Time, roll.Data, 'Color', '[1 0 0]','lineWidth', 1.2);
hold on;
plot(roll_ref.Time, roll_ref.Data, 'Color','[0.5 0 0]', 'lineStyle', '--','lineWidth', 1.2);
plot(pitch.Time, pitch.Data, 'Color', '[0 1 0]','lineWidth', 1.2);
plot(pitch_ref.Time, pitch_ref.Data,'Color','[0 0.5 0]', 'lineStyle', '--','lineWidth', 1.2);
grid on;
grid minor;
title('Control Action in the Linear System');
xlabel('Time [s]');
ylabel('Angle [rad]');
legend('Roll','Roll Reference', 'Pitch','Pitch Reference','Location','southeast');

figure
plot(wsum.Time, wsum.Data,'lineWidth', 1.2);
hold on;
grid on;
grid minor;
title('Control Action in the Non-Linear System');
xlabel('Time [s]');
ylabel('Sum of rotational speeds in the motors [rad/s]');

