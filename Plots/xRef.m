close all
clear
clc
load xRef

line=1.3;
font=14;
figure
plot(x.Time,x.Data,'Color',[0 0 0.4],'LineWidth',line)
hold on
plot(x_ref.Time,x_ref.Data,'Color',[0 0 0.7],'LineStyle','--','LineWidth',line)
xlim([0 16])
set(gca,'FontSize',font-3);
grid on
grid minor
xlabel('Time [s]','FontSize',font,'Interpreter','Latex')
ylabel('Position [m]','FontSize',font,'Interpreter','Latex')
title('Step Response in $x$','FontSize',font,'Interpreter','Latex')
h = legend('$x$', '$x$ Reference','Location','SouthEast');
set(h,'FontSize',font-1,'Interpreter','Latex');