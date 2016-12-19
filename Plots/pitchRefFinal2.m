%% Reference in pitch
load pitchRefFinal2
font=13;
line=0.5;
t=[0 7.5 7.5 50];
step_pitch=[0 0 0.4 0.4];
figure
plot(0:0.015:22.5,Ang(1,1500:3000),'Color',[0 0 0.5], 'Linewidth',line)
hold on
plot(0:0.015:22.5,Ang(2,1500:3000),'Color',[0 0.5 0], 'Linewidth',line)
plot(0:0.015:22.5,Ang(3,1500:3000)-0.05,'Color',[0.5 0 0], 'Linewidth',line)
plot(t,step_pitch,'Color',[0.5 0 0],'LineStyle','--', 'Linewidth',1.5)
xlim([0,22])
xlabel('Time [s]','FontSize',font)
ylabel('Angle [rad]','FontSize',font)
title('Reference Tracking in Pitch','FontSize',font)
h = legend('Roll','Pitch','Yaw', 'Pitch reference','Location','East');
set(h,'FontSize',font-2);
grid on
grid minor

%% Reference in pitch - Other angles
load pitchRefFinal2
font=13;
line=0.5;
figure
plot(0:0.015:22.5,Ang(1,1500:3000),'Color',[0 0 0.5], 'Linewidth',line)
hold on

xlim([0,22])
ylim([-0.3 0.3])
xlabel('Time [s]','FontSize',font)
ylabel('Angle [rad]','FontSize',font)
title('Reference Tracking in Pitch','FontSize',font)
h = legend('Roll', 'Yaw','Location','SouthEast');
set(h,'FontSize',font-2);
grid on
grid minor