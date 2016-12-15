close all
clear
clc
load yRef

line=1.3;
font=14;
figure
plot(y.Time,y.Data,'Color',[0 0 0.4],'LineWidth',line)
hold on
plot(y_ref.Time,y_ref.Data,'Color',[0 0 0.7],'LineStyle','--','LineWidth',line)
xlim([0 16])
set(gca,'FontSize',font-3);
grid on
grid minor
xlabel('Time [s]','FontSize',font,'Interpreter','Latex')
ylabel('Position [m]','FontSize',font,'Interpreter','Latex')
title('Step Response in $y$','FontSize',font,'Interpreter','Latex')
h = legend('$y$', '$y$ Reference','Location','SouthEast');
set(h,'FontSize',font-1,'Interpreter','Latex');