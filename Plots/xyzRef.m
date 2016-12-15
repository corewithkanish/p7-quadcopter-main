close all
clear 
clc

load xyzRef

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
set(gca,'FontSize',font-3);
grid on
grid minor
xlabel('Time [s]','FontSize',font,'Interpreter','Latex')
ylabel('Position [m]','FontSize',font,'Interpreter','Latex')
title('Step Response of the Translational Position Controller','FontSize',...
    font,'Interpreter','Latex')
h = legend('$x_{\mathrm{I}}$', '$x_{\mathrm{I}}$ Reference','$y_{\mathrm{I}}$',...
    '$y_{\mathrm{I}}$ Reference','$z_{\mathrm{I}}$', '$z_{\mathrm{I}}$ Reference','Location','SouthEast');
set(h,'FontSize',font-3,'Interpreter','Latex');
