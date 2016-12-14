%% 3D Plot (Put initial condition of x to 1)
clear
clc
run TotalController.m
t=36;
x_ref_time=0;
x_ref_step=0;
y_ref_time=0;
y_ref_step=0;
z_ref_time=0;
z_ref_step=1;
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
pitch_step=0;
pitch_ref_time=0;
yaw_init=0;
yaw_step=0;

sim('TotalControllerSimOld.slx')

figure
line=1.2;
font=14;
plot3(x.Data,y.Data,z.Data,'Color','[0 0 0.5]','lineWidth',line)
hold on
xvec=[0 0 1 1 1 0 0];
yvec=[0 0 0 1 1 1 0];
zvec=[0 -0.1 -0.1 -0.1 0 0 0];
plot3(input_x,input_y,input_z,'Color','[0.5 0 0]','lineWidth',line, 'lineStyle','--')
axis([-1.2 1.2 -1.2 1.2 -11 1])
grid on
grid minor
set(gca,'ZDir','Reverse')
set(gca,'YDir','Reverse')
grid on
grid minor
xlabel('$x$ Position [m]','FontSize',font,'Interpreter','Latex')
ylabel('$y$ Position [m]','FontSize',font,'Interpreter','Latex')
zlabel('$z$ Position [m]','FontSize',font,'Interpreter','Latex')
title('Trajectory using the Translational Controllers','FontSize',font,'Interpreter','Latex')
h = legend('Trajectory', 'Reference','Location','NorthEast');
set(h,'FontSize',font-2,'Interpreter','Latex');

%% x step little
clear
clc
run TotalController.m
t=20;
x_ref_time=0;
x_ref_step=1;
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
xlim([0 16])
grid on
grid minor
xlabel('Time [s]','FontSize',font,'Interpreter','Latex')
ylabel('Position [m]','FontSize',font,'Interpreter','Latex')
title('Step Response in $x$','FontSize',font,'Interpreter','Latex')
h = legend('$x$', '$x$ Reference','Location','SouthEast');
set(h,'FontSize',font-1,'Interpreter','Latex');

%% y step little
clear
clc
run TotalController.m
t=20;
x_ref_time=0;
x_ref_step=0;
y_ref_time=0;
y_ref_step=1;
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
pitch_step=0;
pitch_ref_time=0;
yaw_init=0;
yaw_step=0;

sim('TotalControllerSimOld.slx')

line=1.3;
font=14;
figure
plot(y.Time,y.Data,'Color',[0 0 0.4],'LineWidth',line)
hold on
plot(y_ref.Time,y_ref.Data,'Color',[0 0 0.7],'LineStyle','--','LineWidth',line)
xlim([0 16])
grid on
grid minor
xlabel('Time [s]','FontSize',font,'Interpreter','Latex')
ylabel('Position [m]','FontSize',font,'Interpreter','Latex')
title('Step Response in $y$','FontSize',font,'Interpreter','Latex')
h = legend('$y$', '$y$ Reference','Location','SouthEast');
set(h,'FontSize',font-1,'Interpreter','Latex');

%% z step little
clear
clc
run TotalController.m
t=10;
x_ref_time=0;
x_ref_step=0;
y_ref_time=0;
y_ref_step=0;
z_ref_time=0;
z_ref_step=1;
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
pitch_step=0;
pitch_ref_time=0;
yaw_init=0;
yaw_step=0;

sim('TotalControllerSimOld.slx')

line=1.3;
font=14;
figure
plot(z.Time,z.Data,'Color',[0 0 0.4],'LineWidth',line)
hold on
plot(z_ref.Time,z_ref.Data,'Color',[0 0 0.7],'LineStyle','--','LineWidth',line)
xlim([0 8])
ylim([0 1.1])
grid on
grid minor
xlabel('Time [s]','FontSize',font,'Interpreter','Latex')
ylabel('Angle [rad]','FontSize',font,'Interpreter','Latex')
title('Step Response in $z$','FontSize',font,'Interpreter','Latex')
h = legend('$z$', '$z$ Reference','Location','SouthEast');
set(h,'FontSize',font-1,'Interpreter','Latex');


