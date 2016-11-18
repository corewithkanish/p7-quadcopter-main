
%3D graph
close all;

plot3(PosX.Data, PosY.Data, PosZ.Data);
hold on;
plot3(PosXref.Data(1:end-1), PosYref.Data(1:end-1), PosZref.Data(1:end-1));
grid;
set(gca,'Zdir','reverse');
set(gca,'Ydir','reverse');
%xlim([-1, 52]);
%ylim([-0.12, 0.12]);

title('Position Control Simulation', 'interpreter', 'LaTex');

xlabel('x-aksis [m]', 'interpreter', 'LaTex');
ylabel('y-aksis [m]', 'interpreter', 'LaTex');
zlabel('z-aksis [m]', 'interpreter', 'LaTex');
% plot(Roll.Time, Roll.Data, 'Color', '[1 0 0]');
% hold on;
% plot(Rollref.Time, Rollref.Data, 'Color','[0.5 0 0]', 'lineStyle', '--');
% plot(Pitch.Time, Pitch.Data, 'Color', '[0 1 0]');
% plot(Pitchref.Time, Pitchref.Data,'Color','[0 0.5 0]', 'lineStyle', '--');
% plot(Yaw.Time, Yaw.Data, 'Color', '[0 0 1]');
% plot(Yawref.Time, Yawref.Data, 'Color','[0 0 0.5]', 'lineStyle', '--');
% 
% %xlim([-1, 52]);
% ylim([-0.12, 0.12]);
% grid;
% 
% title('Attitude Control Simulation', 'interpreter', 'LaTex');
% xlabel('Time [s]', 'interpreter', 'LaTex');
% ylabel('Angle [rad]', 'interpreter', 'LaTex');
% 
% legend('Roll','Roll reference', 'Pitch','Pitch reference', 'Yaw', 'Yaw reference','Location','southeast');
