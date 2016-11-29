%% 3D graph
close all;
run 'TotalController.m'
Tstep=0.3;
input_x=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
    1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0].';
input_y=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
    1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
    1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1].';
input_z=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
    -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1...
    -0.2 -0.2 -0.2 -0.2 -0.2 -0.2 -0.2 -0.2 -0.2 -0.2 -0.2 -0.2 -0.2 -0.2 -0.2 -0.2...
    -0.3 -0.3 -0.3 -0.3 -0.3 -0.3 -0.3 -0.3 -0.3 -0.3 -0.3 -0.3 -0.3 -0.3 -0.3 -0.3...
    -0.4 -0.4 -0.4 -0.4 -0.4 -0.4 -0.4 -0.4 -0.4 -0.4 -0.4 -0.4 -0.4 -0.4 -0.4 -0.4 ...
    -0.5 -0.5 -0.5 -0.5 -0.5 -0.5 -0.5 -0.5 -0.5 -0.5 -0.5 -0.5 -0.5 -0.5 -0.5 -0.5...
    -0.6 -0.6 -0.6 -0.6 -0.6 -0.6 -0.6 -0.6 -0.6 -0.6 -0.6 -0.6 -0.6 -0.6 -0.6 -0.6...
    -0.7 -0.7 -0.7 -0.7 -0.7 -0.7 -0.7 -0.7 -0.7 -0.7 -0.7 -0.7 -0.7 -0.7 -0.7 -0.7].';

sim 'TotalControllerSim'
plot3(PosX.Data, PosY.Data, PosZ.Data,'b', 'LineWidth',1.2);
hold on;
plot3(PosXref.Data(1:end-1), PosYref.Data(1:end-1), PosZref.Data(1:end-1),'-*r', 'LineWidth',1.2);
grid on
grid minor
set(gca,'Zdir','reverse');
set(gca,'Ydir','reverse');
xlim([-0.1, 1.1]);
ylim([-0.1, 1.1]);
zlim([-0.8, 0.1]);

title('Position Control 3D Simulation', 'interpreter', 'LaTex');

xlabel('x-axis [m]', 'interpreter', 'LaTex');
ylabel('y-axis [m]', 'interpreter', 'LaTex');
zlabel('z-axis [m]', 'interpreter', 'LaTex');
%% The other plot
close all;
run 'TotalController.m'

Tstep=0.3;
input_x=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
    1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0].';
input_y=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
    1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ...
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
    1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1].';
input_z=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
    -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1...
    -0.2 -0.2 -0.2 -0.2 -0.2 -0.2 -0.2 -0.2 -0.2 -0.2 -0.2 -0.2 -0.2 -0.2 -0.2 -0.2...
    -0.3 -0.3 -0.3 -0.3 -0.3 -0.3 -0.3 -0.3 -0.3 -0.3 -0.3 -0.3 -0.3 -0.3 -0.3 -0.3...
    -0.4 -0.4 -0.4 -0.4 -0.4 -0.4 -0.4 -0.4 -0.4 -0.4 -0.4 -0.4 -0.4 -0.4 -0.4 -0.4 ...
    -0.5 -0.5 -0.5 -0.5 -0.5 -0.5 -0.5 -0.5 -0.5 -0.5 -0.5 -0.5 -0.5 -0.5 -0.5 -0.5...
    -0.6 -0.6 -0.6 -0.6 -0.6 -0.6 -0.6 -0.6 -0.6 -0.6 -0.6 -0.6 -0.6 -0.6 -0.6 -0.6...
    -0.7 -0.7 -0.7 -0.7 -0.7 -0.7 -0.7 -0.7 -0.7 -0.7 -0.7 -0.7 -0.7 -0.7 -0.7 -0.7].';
sim 'TotalControllerSim'
plot(PosZ.Time, PosZ.Data, 'Color', '[0 0 1]');
hold on;
plot(PosZref.Time(1:end-1), PosZref.Data(1:end-1), 'Color','[0 0 0.5]', 'lineStyle', '--');
plot(PosX.Time, PosX.Data, 'Color', '[1 0 0]');
plot(PosXref.Time(1:end-1), PosXref.Data(1:end-1), 'Color','[0.5 0 0]', 'lineStyle', '--');
plot(PosY.Time, PosY.Data, 'Color', '[0 1 0]');
plot(PosYref.Time(1:end-1), PosYref.Data(1:end-1),'Color','[0 0.5 0]', 'lineStyle', '--');

%xlim([-1, 52]);
ylim([-1.2, 1.2]);
grid on
grid minor

title('Position Control Simulation', 'interpreter', 'LaTex');
xlabel('Time [s]', 'interpreter', 'LaTex');
ylabel('Position [m]', 'interpreter', 'LaTex');

legend('X position','X position reference', 'Y position','Y position reference', ...
    'Z position', 'Z position reference','Location','SouthWest');


%% Angular plots
close all;
run 'TotalController.m'
sim 'TotalControllerSim'

plot(Roll.Time, Roll.Data, 'Color', '[1 0 0]');
hold on;
plot(Rollref.Time(1:end-1), Rollref.Data(1:end-1), 'Color','[0.5 0 0]', 'lineStyle', '--');
plot(Pitch.Time, Pitch.Data, 'Color', '[0 1 0]');
plot(Pitchref.Time, Pitchref.Data,'Color','[0 0.5 0]', 'lineStyle', '--');
plot(Yaw.Time, Yaw.Data, 'Color', '[0 0 1]');
plot(Yawref.Time(1:end-1), Yawref.Data(1:end-1), 'Color','[0 0 0.5]', 'lineStyle', '--');

%xlim([-1, 52]);
ylim([-0.1, 0.07]);
grid;

title('Attitude Control Simulation', 'interpreter', 'LaTex');
xlabel('Time [s]', 'interpreter', 'LaTex');
ylabel('Angle [rad]', 'interpreter', 'LaTex');

legend('Roll','Roll reference', 'Pitch','Pitch reference', 'Yaw', 'Yaw reference','Location','southeast');
