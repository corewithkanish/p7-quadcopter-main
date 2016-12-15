close all
clear
clc

load helix

FigHandle = figure('Position', [100, 100, 600, 500]);
line=1.2;
font=14;
plot3(x.Data,y.Data,z.Data,'Color','[0 0 0.5]','lineWidth',line)
hold on
plot3(input_x,input_y,input_z,'Color','[0.5 0 0]','lineWidth',line, 'lineStyle','--')
axis([-1.2 1.2 -1.2 1.2 -11 1])
set(gca,'FontSize',font-3);
grid on
grid minor
set(gca,'ZDir','Reverse')
set(gca,'YDir','Reverse')
grid on
grid minor
xlabel('$x$ [m]','FontSize',font,'Interpreter','Latex')
ylabel('$y$ [m]','FontSize',font,'Interpreter','Latex')
zlabel('$z$ [m]','FontSize',font,'Interpreter','Latex')
title('Trajectory using the Translational Controllers','FontSize',font,'Interpreter','Latex')
h = legend('Trajectory', 'Reference','Location','NorthEast');
set(h,'FontSize',font-1,'Interpreter','Latex');
