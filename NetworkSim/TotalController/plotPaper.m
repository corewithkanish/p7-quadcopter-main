%% Back to equilibrium
clear
clc
run TotalController.m
t=10;
x_ref_time=0;
x_ref_step=0;
y_ref_time=0;
y_ref_step=0;
z_ref_time=0;
z_ref_step=0;
xdot_ref_time=0;
xdot_ref_step=0;
ydot_ref_time=0;
ydot_ref_step=0;
zdot_ref_time=0;
zdot_ref_step=0;
roll_init=-0.3;
roll_step=0;
roll_ref_time=0;
pitch_init=0.2;
pitch_step=0;
pitch_ref_time=0;
yaw_init=-0.2;
yaw_step=0;

sim('TotalControllerSimOld.slx')

line=1.3;
font=14;
figure
plot(roll.Time,roll.Data,'Color',[0 0.5 0],'LineWidth',line)
hold on
plot(pitch.Time,pitch.Data,'Color',[0 0 0.5],'LineWidth',line)
plot(yaw.Time,yaw.Data,'Color',[0.5 0 0],'LineWidth',line)
xlim([0 10])
%ylim([0 1.1])
grid on
grid minor
xlabel('Time [s]','FontSize',font,'Interpreter','Latex')
ylabel('Angle [rad]','FontSize',font,'Interpreter','Latex')
title('Stabilization of the Attitude around Equilibrium','FontSize',...
    font,'Interpreter','Latex')
h = legend('Roll','Pitch','Yaw','Location','SouthEast');
set(h,'FontSize',font-3,'Interpreter','Latex');

%% Roll step
clear
clc
run TotalController.m
t=25;
x_ref_time=0;
x_ref_step=0;
y_ref_time=0;
y_ref_step=0;
z_ref_time=0;
z_ref_step=0;
xdot_ref_time=0;
xdot_ref_step=0;
ydot_ref_time=0;
ydot_ref_step=0;
zdot_ref_time=0;
zdot_ref_step=0;
roll_init=0;
roll_step=0.2;
roll_ref_time=0;
pitch_init=0;
pitch_step=0;
pitch_ref_time=0;
yaw_init=0;
yaw_step=0;

sim('TotalControllerSimOld.slx')

line=1.3;
font=14;
figure
plot(roll.Time,roll.Data,'Color',[0 0 0.4],'LineWidth',line)
hold on
plot(roll_ref.Time,roll_ref.Data,'Color',[0 0 0.7],'LineStyle','--','LineWidth',line)
plot(pitch.Time,pitch.Data,'Color',[0 0.4 0],'LineWidth',line)
plot(yaw.Time,yaw.Data,'Color',[0.4 0 0],'LineWidth',line)
xlim([0 3])
%ylim([0 1.1])
grid on
grid minor
xlabel('Time [s]','FontSize',font,'Interpreter','Latex')
ylabel('Angle [rad]','FontSize',font,'Interpreter','Latex')
title('Step Response for Roll','FontSize',...
    font,'Interpreter','Latex')
h = legend('Roll', 'Roll Reference','Pitch','Yaw','Location','SouthEast');
set(h,'FontSize',font-3,'Interpreter','Latex');

%% Pitch step
clear
clc
run TotalController.m
t=5;
x_ref_time=0;
x_ref_step=0;
y_ref_time=0;
y_ref_step=0;
z_ref_time=0;
z_ref_step=0;
xdot_ref_time=0;
xdot_ref_step=0;
ydot_ref_time=0;
ydot_ref_step=0;
zdot_ref_time=0;
zdot_ref_step=0;
roll_init=0;
roll_step=0;
roll_ref_time=0;
pitch_init=0;
pitch_step=0.2;
pitch_ref_time=0;
yaw_init=0;
yaw_step=0;

sim('TotalControllerSimOld.slx')

line=1.3;
font=14;
figure
plot(pitch.Time,pitch.Data,'Color',[0 0 0.4],'LineWidth',line)
hold on
plot(pitch_ref.Time,pitch_ref.Data,'Color',[0 0 0.7],'LineStyle','--','LineWidth',line)
plot(roll.Time,roll.Data,'Color',[0 0.4 0],'LineWidth',line)
plot(yaw.Time,yaw.Data,'Color',[0.4 0 0],'LineWidth',line)
xlim([0 3])
%ylim([0 1.1])
grid on
grid minor
xlabel('Time [s]','FontSize',font,'Interpreter','Latex')
ylabel('Angle [rad]','FontSize',font,'Interpreter','Latex')
title('Step Response for Pitch','FontSize',...
    font,'Interpreter','Latex')
h = legend('Pitch', 'Pitch Reference','Roll','Yaw','Location','SouthEast');
set(h,'FontSize',font-3,'Interpreter','Latex');

%% Step in x, y and z
clear
clc
run TotalController.m
t=25;
x_ref_time=0;
x_ref_step=1;
y_ref_time=8;
y_ref_step=1;
z_ref_time=16;
z_ref_step=1;
xdot_ref_time=0;
xdot_ref_step=0;
ydot_ref_time=0;
ydot_ref_step=0;
zdot_ref_time=0;
zdot_ref_step=0;
roll_init=0;
roll_step=0.2;
roll_ref_time=0;
pitch_init=0;
pitch_step=0;
pitch_ref_time=0;
yaw_init=0;
yaw_step=0;

sim('TotalControllerSimOld.slx')

line=1.3;
font=14;
figure
plot(x.Time,x.Data,'Color',[0 0 0.4],'LineWidth',line)
hold on
plot(x_ref.Time,x_ref.Data,'Color',[0 0 0.7],'LineStyle','--','LineWidth',line)
plot(y.Time,y.Data,'Color',[0 0.4 0],'LineWidth',line)
plot(y_ref.Time,y_ref.Data,'Color',[0 0.7 0],'LineStyle','--','LineWidth',line)
plot(z.Time,z.Data,'Color',[0.4 0 0],'LineWidth',line)
plot(z_ref.Time,z_ref.Data,'Color',[0.7 0 0],'LineStyle','--','LineWidth',line)
xlim([0 25])
%ylim([0 1.1])
grid on
grid minor
xlabel('Time [s]','FontSize',font,'Interpreter','Latex')
ylabel('Position [m]','FontSize',font,'Interpreter','Latex')
title('Step Response of the Translational Position Controller','FontSize',...
    font,'Interpreter','Latex')
h = legend('$x_{\mathrm{I}}$', '$x_{\mathrm{I}}$ Reference','$y_{\mathrm{I}}$',...
    '$y_{\mathrm{I}}$ Reference','$z_{\mathrm{I}}$', '$z_{\mathrm{I}}$ Reference','Location','SouthEast');
set(h,'FontSize',font-3,'Interpreter','Latex');