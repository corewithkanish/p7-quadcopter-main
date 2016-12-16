close all
clc
clear

load zRef

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
set(gca,'FontSize',font-3);
xlabel('Time [s]','FontSize',font,'Interpreter','Latex')
ylabel('Position [m]','FontSize',font,'Interpreter','Latex')
%title('Step Response in $z$','FontSize',font,'Interpreter','Latex')
%h = legend('$z$', '$z$ Reference','Location','SouthEast');
%set(h,'FontSize',font-1,'Interpreter','Latex');
