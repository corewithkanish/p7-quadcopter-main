%% --------------------- Roll ---------------------------------------------
close all
clear 
clc

run('Parameters')

% Simulation Input
inputw4=[0 0+1 0 0-1 0 0-1 0 0+1].';
inputw1=[0].';
inputw2=[0 0-1 0 0+1 0 0+1 0 0-1].';
inputw3=[0].';
inputroll=[0].';
inputpitch=[0].';
t=50;

sim('CompleteModel')

% Comparison between linear and non linear angular position in roll
FigHandle = figure('Position', [100, 100, 800, 400]);

[hAx,hLineRoll,hLineVel]=plotyy([roll.Time, roll_lin.Time],[roll.Data, roll_lin.Data],omega4.Time,omega4.Data-omega2.Data);

hLineVel.LineStyle = '-';
%hLineVel.Color = 'o';
hLineVel.LineWidth = 1.2;
hLineRoll(1).LineStyle = '-';
hLineRoll(1).Color = 'k';
hLineRoll(1).LineWidth = 1.2;
hLineRoll(2).LineStyle = '--';
hLineRoll(2).Color = 'r';
hLineRoll(2).LineWidth = 1.2;

title('Angular Behavior around x Axis')
xlabel('Time (s)')
ylabel(hAx(1),'Angular Position [rad]') % left y-axis
ylabel(hAx(2),'Motor Speed [rad/s]') % right y-axis
legend('Roll (Non Linear)','Roll (Linear)','Motor Speeds Difference = \omega_4 - \omega_2','Location','SouthEast')
grid minor


%% --------------------- Pitch ---------------------------------------------
close all
clear 
clc

run('Parameters')

% Simulation Input
inputw1=[0 0+1 0 0-1 0 0-1 0 0+1].';
inputw2=[0].';
inputw3=[0 0-1 0 0+1 0 0+1 0 0-1].';
inputw4=[0].';
inputroll=[0].';
inputpitch=[0].';
t=50;

sim('CompleteModel')

% Comparison between linear and non linear angular position in roll
FigHandle = figure('Position', [100, 100, 800, 400]);

[hAx,hLinePitch,hLineVel]=plotyy([pitch.Time, pitch_lin.Time],[pitch.Data, pitch_lin.Data],omega1.Time,omega1.Data-omega3.Data);

hLineVel.LineStyle = '-';
%hLineVel.Color = 'o';
hLineVel.LineWidth = 1.2;
hLinePitch(1).LineStyle = '-';
hLinePitch(1).Color = 'k';
hLinePitch(1).LineWidth = 1.2;
hLinePitch(2).LineStyle = '--';
hLinePitch(2).Color = 'r';
hLinePitch(2).LineWidth = 1.2;

title('Angular Behavior around y Axis')
xlabel('Time (s)')
ylabel(hAx(1),'Angular Position [rad]') % left y-axis
ylabel(hAx(2),'Motor Speed [rad/s]') % right y-axis
legend('Pitch (Non Linear)','Pitch (Linear)','Motor Speeds Difference = \omega_1 - \omega_3','Location','SouthEast')
grid minor

%% --------------------- Yaw ---------------------------------------------
close all
clear 
clc

run('Parameters')

% Simulation Input
inputw1=[0 0+1 0 0-1 0 0-1 0 0+1].';
inputw2=[0 0-1 0 0+1 0 0+1 0 0-1].';
inputw3=[0 0+1 0 0-1 0 0-1 0 0+1].';
inputw4=[0 0-1 0 0+1 0 0+1 0 0-1].';
inputroll=[0].';
inputpitch=[0].';
t=50;

sim('CompleteModel')

% Comparison between linear and non linear angular position in roll
FigHandle = figure('Position', [100, 100, 800, 400]);

[hAx,hLineYaw,hLineVel]=plotyy([yaw.Time, yaw_lin.Time],[yaw.Data, yaw_lin.Data],omega4.Time,omega1.Data-omega2.Data+omega3.Data-omega4.Data);

hLineVel.LineStyle = '-';
%hLineVel.Color = 'o';
hLineVel.LineWidth = 1.2;
hLineYaw(1).LineStyle = '-';
hLineYaw(1).Color = 'k';
hLineYaw(1).LineWidth = 1.2;
hLineYaw(2).LineStyle = '--';
hLineYaw(2).Color = 'r';
hLineYaw(2).LineWidth = 1.2;

title('Angular Behavior around z Axis')
xlabel('Time (s)')
ylabel(hAx(1),'Angular Position [rad]') % left y-axis
ylabel(hAx(2),'Motor Speed [rad/s]') % right y-axis
legend('Yaw (Non Linear)','Yaw (Linear)','Motor Speeds Difference = \omega_1 - \omega_2 + \omega_3 - \omega_4','Location','SouthEast')
grid minor

%% --------------------- x ---------------------------------------------
close all
clear 
clc

run('Parameters')

% Simulation Input
inputw1=[0].';
inputw2=[0].';
inputw3=[0].';
inputw4=[0].';
inputroll=[0].';
inputpitch=[0 0.2 0 -0.2 0 -0.2 0 0.2 0].';
t=50;

sim('CompleteModel')

% Comparison between linear and non linear angular position in roll
FigHandle = figure('Position', [100, 100, 800, 400]);

[hAx,hLineX,hLinePitch]=plotyy([x.Time, x_lin.Time],[x.Data, x_lin.Data],pitch_input.Time,pitch_input.Data);

hLinePitch.LineStyle = '-';
%hLinePitch.Color = 'o';
hLinePitch.LineWidth = 1.2;
hLineX(1).LineStyle = '-';
hLineX(1).Color = 'k';
hLineX(1).LineWidth = 1.2;
hLineX(2).LineStyle = '--';
hLineX(2).Color = 'r';
hLineX(2).LineWidth = 1.2;

title('Translational Behavior along x Axis')
xlabel('Time (s)')
ylabel(hAx(1),'Translational Position [m]') % left y-axis
ylabel(hAx(2),'Angular Position [rad]') % right y-axis
legend('x_I (Non Linear)','x_I (Linear)','Pitch','Location','NorthEast')
grid minor

%% --------------------- y ---------------------------------------------
close all
clear 
clc

run('Parameters')

% Simulation Input
inputw1=[0].';
inputw2=[0].';
inputw3=[0].';
inputw4=[0].';
inputroll=[0 0.2 0 -0.2 0 -0.2 0 0.2 0].';
inputpitch=[0].';
t=50;

sim('CompleteModel')

% Comparison between linear and non linear angular position in roll
FigHandle = figure('Position', [100, 100, 800, 400]);

[hAx,hLineY,hLineRoll]=plotyy([y.Time, y_lin.Time],[y.Data, y_lin.Data],roll_input.Time,roll_input.Data);

hLineRoll.LineStyle = '-';
%hLineRoll.Color = 'o';
hLineRoll.LineWidth = 1.2;
hLineY(1).LineStyle = '-';
hLineY(1).Color = 'k';
hLineY(1).LineWidth = 1.2;
hLineY(2).LineStyle = '--';
hLineY(2).Color = 'r';
hLineY(2).LineWidth = 1.2;

title('Translational Behavior along y Axis')
xlabel('Time (s)')
ylabel(hAx(1),'Translational Position [m]') % left y-axis
ylabel(hAx(2),'Angular Position [rad]') % right y-axis
legend('y_I (Non Linear)','y_I (Linear)','Roll','Location','SouthEast')
grid minor

%% --------------------- z ---------------------------------------------
close all
clear 
clc

run('Parameters')

% Simulation Input
inputw1=[0 0 2 0 0 -2 0 0 -2 0 0 2 0 0].';
inputw2=[0 0 2 0 0 -2 0 0 -2 0 0 2 0 0].';
inputw3=[0 0 2 0 0 -2 0 0 -2 0 0 2 0 0].';
inputw4=[0 0 2 0 0 -2 0 0 -2 0 0 2 0 0].';
inputroll=[0].';
inputpitch=[0].';
t=100;

sim('CompleteModel')

% Comparison between linear and non linear angular position in roll
FigHandle = figure('Position', [100, 100, 800, 400]);

[hAx,hLineZ,hLineRoll]=plotyy([z.Time, z_lin.Time],[z.Data, z_lin.Data],omega1.Time,omega1.Data+omega2.Data+omega3.Data+omega4.Data);

hLineRoll.LineStyle = '-';
%hLineRoll.Color = 'o';
hLineRoll.LineWidth = 1.2;
hLineZ(1).LineStyle = '-';
hLineZ(1).Color = 'k';
hLineZ(1).LineWidth = 1.2;
hLineZ(2).LineStyle = '--';
hLineZ(2).Color = 'r';
hLineZ(2).LineWidth = 1.2;

title('Translational Behavior along z Axis')
xlabel('Time (s)')
ylabel(hAx(1),'Translational Position [m]') % left y-axis
ylabel(hAx(2),'Motor Speed [rad/s]') % right y-axis
legend('z_I (Non Linear)','z_I (Linear)','Motor Speeds Summation = \omega_1 + \omega_2 + \omega_3 + \omega_4','Location','NorthEast')
grid minor




