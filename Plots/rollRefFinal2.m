%% Reference in roll
load rollRefFinal2
line=0.5;
font=13;
t=[0 10 10 50];
step_roll=[0 0 0.4 0.4];
figure
plot(0:0.015:22.5,Ang(1,1500:3000),'Color',[0 0 0.5], 'Linewidth',line)
hold on
plot(0:0.015:22.5,Ang(2,1500:3000),'Color',[0 0.5 0], 'Linewidth',line)
plot(0:0.015:22.5,Ang(3,1500:3000)-0.05,'Color',[0.5 0 0], 'Linewidth',line)
plot(t,step_roll,'Color',[0.5 0 0],'LineStyle','--', 'Linewidth',1.5)
xlim([0,22])
%ylim([-0.05 0.3])
xlabel('Time [s]','FontSize',font)
ylabel('Angle [rad]','FontSize',font)
title('Reference Tracking in Roll','FontSize',font)
h = legend('Roll','Pitch', 'Yaw', 'Roll reference','Location','NorthWest');
set(h,'FontSize',font-2);
grid on
grid minor

%% Reference in roll - Other angles
load rollRefFinal2
font=13;
line=0.5;
figure

xlim([0,22])
ylim([-0.3 0.3])
xlabel('Time [s]','FontSize',font)
ylabel('Angle [rad]','FontSize',font)
title('Reference Tracking in Roll','FontSize',font)
h = legend('Pitch', 'Yaw','Location','SouthEast');
set(h,'FontSize',font-2);
grid on
grid minor