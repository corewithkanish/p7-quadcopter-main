%% ------- Bode for attitude Controller ---------------------------------
close all
clear
clc
run Parameters.m
run StateSpace.m
FigHandle = figure('Position', [100, 100, 700, 400]);
H=zpk(system_cl);
bodeplot(H(2,2),{0.1,5})
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
xdot_ref_time=0.5;
xdot_ref_step=1;
ydot_ref_time=2.5;
ydot_ref_step=1;
zdot_ref_time=0;
zdot_ref_step=-1;
x_ref_time=0;
x_ref_step=0;
y_ref_time=0;
y_ref_step=0;
z_ref_time=0;
z_ref_step=0;
roll_init=0;
roll_step=0;
pitch_init=0;
pitch_step=0;
yaw_init=0;
yaw_step=0;

sim('TotalControllerSimOld.slx')

figure
plot(xdot.Time, xdot.Data, 'Color', '[1 0 0]','lineWidth', 1.2);
hold on;
plot(xdot_ref.Time, xdot_ref.Data, 'Color','[0.5 0 0]', 'lineStyle', '--','lineWidth', 1.2);
plot(ydot.Time, ydot.Data, 'Color', '[0 1 0]','lineWidth', 1.2);
plot(ydot_ref.Time, ydot_ref.Data,'Color','[0 0.5 0]', 'lineStyle', '--','lineWidth', 1.2);
grid on;
grid minor;
title('Velocity Translational Controllers in x_I and y_I Directions');
xlabel('Time [s]');
ylabel('Translational Velocity [m/s]');
legend('xdot','xdot Reference', 'ydot','ydot Reference','Location','southeast');

figure
plot(zdot.Time, zdot.Data, 'Color', '[0 0 1]','lineWidth', 1.2);
hold on
plot(zdot_ref.Time, zdot_ref.Data, 'Color','[0 0 0.5]', 'lineStyle', '--','lineWidth', 1.2);
set(gca,'YDir','reverse');
grid on;
grid minor;
title('Velocity Translational Controller in z_I  Direction');
xlabel('Time [s]');
ylabel('Translational Velocity [m/s]');
legend( 'zdot', 'zdot Reference','Location','southeast');
axis([ -.5 6 -1.2 0.2 ])

figure
plot(roll.Time, roll.Data, 'Color', '[0 1 0]','lineWidth', 1.2);
hold on;
plot(roll_ref.Time, roll_ref.Data, 'Color','[0 0.5 0]', 'lineStyle', '--','lineWidth', 1.2);
plot(pitch.Time, pitch.Data, 'Color', '[1 0 0]','lineWidth', 1.2);
plot(pitch_ref.Time, pitch_ref.Data,'Color','[0.5 0 0]', 'lineStyle', '--','lineWidth', 1.2);
grid on;
grid minor;
title('Control Action for x_I and y_I Velocity Controllers');
xlabel('Time [s]');
ylabel('Angle [rad]');
legend('Roll','Roll Reference', 'Pitch','Pitch Reference','Location','southeast');

figure
plot(wsum.Time, wsum.Data,'lineWidth', 1.2);
hold on;
grid on;
grid minor;
title('Control Action for the z_I Velocity Controller');
xlabel('Time [s]');
ylabel('Sum of rotational speeds in the motors [rad/s]');
axis([ -.5 6 -50 300 ])


%% ------- Closed loop bode for velocity Controller ---------------------------------
close all
clear
clc
run Parameters.m
run xyzController.m
FigHandle = figure('Position', [100, 100, 700, 400]);
bodeplot(Cxdot*Gxdot/(1+Cxdot*Gxdot))
set(findall(gcf,'Type','line'),'LineWidth',1.2);
hold on
grid on
grid minor

%% ------- Root Locus for velocity Controller ---------------------------------
close all
clear
clc
run Parameters.m
run xyzController.m
FigHandle = figure('Position', [100, 100, 700, 400]);
rlocus(Cxdot*Gxdot)
set(findall(gcf,'Type','line'),'LineWidth',1.2);

%% ------- Closed loop bode for velocity z Controller ---------------------------------
close all
clear
clc
run Parameters.m
run xyzController.m
FigHandle = figure('Position', [100, 100, 700, 400]);
bodeplot(Czdot*Gzdot/(1+Czdot*Gzdot))
set(findall(gcf,'Type','line'),'LineWidth',1.2);
hold on
grid on
grid minor

%% ------------ Position Controller --------------------------------------
close all
clear
clc
run TotalController.m
t=30;
x_ref_time=0.5;
x_ref_step=5;
y_ref_time=2.5;
y_ref_step=5;
z_ref_time=0;
z_ref_step=-1;
xdot_ref_time=0;
xdot_ref_step=0;
ydot_ref_time=0;
ydot_ref_step=0;
zdot_ref_time=0;
zdot_ref_step=0;
roll_init=0;
roll_step=0;
pitch_init=0;
pitch_step=0;
yaw_init=0;
yaw_step=0;

sim('TotalControllerSimOld.slx')

figure
plot(x.Time, x.Data, 'Color', '[1 0 0]','lineWidth', 1.2);
hold on;
plot(x_ref.Time, x_ref.Data, 'Color','[0.5 0 0]', 'lineStyle', '--','lineWidth', 1.2);
plot(y.Time, y.Data, 'Color', '[0 1 0]','lineWidth', 1.2);
plot(y_ref.Time, y_ref.Data,'Color','[0 0.5 0]', 'lineStyle', '--','lineWidth', 1.2);
grid on;
grid minor;
title('Velocity Translational Controllers in x_I and y_I Directions');
xlabel('Time [s]');
ylabel('Translational Position [m]');
legend('x','x Reference', 'y','y Reference','Location','southeast');
xlim([0 20])
ylim([-1 6])

figure
plot(xdot.Time, xdot.Data, 'Color', '[1 0 0]','lineWidth', 1.2);
hold on;
plot(xdot_ref.Time, xdot_ref.Data, 'Color','[0.5 0 0]', 'lineStyle', '--','lineWidth', 1.2);
plot(ydot.Time, ydot.Data, 'Color', '[0 1 0]','lineWidth', 1.2);
plot(ydot_ref.Time, ydot_ref.Data,'Color','[0 0.5 0]', 'lineStyle', '--','lineWidth', 1.2);
grid on;
grid minor;
title('Control Action for x_I and y_I Position Controllers');
xlabel('Time [s]');
ylabel('Translational Velocity [m/s]');
legend('xdot','xdot Reference', 'ydot','ydot Reference','Location','northeast');
xlim([0 20])

figure
plot(z.Time, z.Data, 'Color', '[0 0 1]','lineWidth', 1.2);
hold on
plot(z_ref.Time, z_ref.Data, 'Color','[0 0 0.5]', 'lineStyle', '--','lineWidth', 1.2);
grid on;
set(gca,'YDir','reverse');
grid minor;
title('Position Translational Controllers in z_I Direction');
xlabel('Time [s]');
ylabel('Translational Position [m]');
legend('z', 'z Reference','Location','southeast');
axis([ -.5 8 -1.2 0.2 ])

figure
plot(zdot.Time, zdot.Data, 'Color', '[0 0 1]','lineWidth', 1.2);
hold on
plot(zdot_ref.Time, zdot_ref.Data, 'Color','[0 0 0.5]', 'lineStyle', '--','lineWidth', 1.2);
grid on;
set(gca,'YDir','reverse');
grid minor;
title('Control Action for z_I Position Controller');
xlabel('Time [s]');
ylabel('Translational Velocity [m/s]');
legend( 'zdot', 'zdot Reference','Location','northeast');
axis([ -.5 8 -1.2 0.2 ])

%% ------- Open loop bode for position Controller ---------------------------------
close all
clear
clc
run Parameters.m
run xyzController.m
FigHandle = figure('Position', [100, 100, 700, 400]);
bodeplot(Gx,{0.1,10})
set(findall(gcf,'Type','line'),'LineWidth',1.2);
hold on
grid on
grid minor

%% ------- Open loop bode for position Z Controller ---------------------------------
close all
clear
clc
run Parameters.m
run xyzController.m
FigHandle = figure('Position', [100, 100, 700, 400]);
bodeplot(Gz,{0.1,10})
set(findall(gcf,'Type','line'),'LineWidth',1.2);
hold on
grid on
grid minor