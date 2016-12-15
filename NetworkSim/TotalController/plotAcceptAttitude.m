%% Back to equilibrium
close all

figure
load eqRefFinal
line=0.5;
font=13;
plot(0:0.015:22.5,Ang(1,2000:3500),'Color',[0 0 0.5], 'Linewidth',line)
hold on
plot(0:0.015:22.5,Ang(2,2000:3500),'Color',[0 0.5 0], 'Linewidth',line)
plot(0:0.015:22.5,Ang(3,2000:3500)-0.05,'Color',[0.5 0 0], 'Linewidth',line)
xlim([0,20])
xlabel('Time [s]','FontSize',font)
ylabel('Angle [rad]','FontSize',font)
title('Stabilization of the Attitude around Equilibrium','FontSize',font)
h = legend('Roll','Pitch', 'Yaw','Location','SouthEast');
set(h,'FontSize',font-2);
grid on
grid minor

%% Reference in roll
load rollRefFinal
line=0.5;
font=13;
t=[0 6 6 50];
step_roll=[0 0 0.2 0.2];
figure
plot(0:0.015:22.5,Ang(1,2300:3800),'Color',[0 0 0.5], 'Linewidth',line)
hold on
plot(t,step_roll,'Color',[0.5 0 0],'LineStyle','--', 'Linewidth',1.5)
xlim([0,22])
ylim([-0.05 0.3])
xlabel('Time [s]','FontSize',font)
ylabel('Angle [rad]','FontSize',font)
title('Reference Tracking in Roll','FontSize',font)
h = legend('Roll', 'Reference in Roll','Location','SouthEast');
set(h,'FontSize',font-2);
grid on
grid minor

%% Reference in roll - Other angles
load rollRefFinal
font=13;
line=0.5;
figure
plot(0:0.015:22.5,Ang(2,2300:3800),'Color',[0 0.5 0], 'Linewidth',line)
hold on
plot(0:0.015:22.5,Ang(3,2300:3800)-0.05,'Color',[0.5 0 0], 'Linewidth',line)
xlim([0,22])
ylim([-0.3 0.3])
xlabel('Time [s]','FontSize',font)
ylabel('Angle [rad]','FontSize',font)
title('Reference Tracking in Roll','FontSize',font)
h = legend('Pitch', 'Yaw','Location','SouthEast');
set(h,'FontSize',font-2);
grid on
grid minor

%% Reference in pitch
load pitchRefFinal
font=13;
line=0.5;
t=[0 7 7 50];
step_pitch=[0 0 0.2 0.2];
figure
plot(0:0.015:30,Ang(2,2000:4000),'Color',[0 0.5 0], 'Linewidth',line)
hold on
plot(t,step_pitch,'Color',[0.5 0 0],'LineStyle','--', 'Linewidth',1.5)
xlim([0,30])
xlabel('Time [s]','FontSize',font)
ylabel('Angle [rad]','FontSize',font)
title('Reference Tracking in Pitch','FontSize',font)
h = legend('Pitch', 'Reference in Pitch','Location','SouthEast');
set(h,'FontSize',font-2);
grid on
grid minor

%% Reference in pitch - Other angles
load pitchRefFinal
font=13;
line=0.5;
figure
plot(0:0.015:30,Ang(1,2000:4000),'Color',[0 0 0.5], 'Linewidth',line)
hold on
plot(0:0.015:30,Ang(3,2000:4000)-0.05,'Color',[0.5 0 0], 'Linewidth',line)
xlim([0,30])
ylim([-0.3 0.3])
xlabel('Time [s]','FontSize',font)
ylabel('Angle [rad]','FontSize',font)
title('Reference Tracking in Pitch','FontSize',font)
h = legend('Roll', 'Yaw','Location','SouthEast');
set(h,'FontSize',font-2);
grid on
grid minor