clear all
close all
clc

%% Distributed Real Time Systems - Mini Project

% Time is in miliseconds - Multipling by 8 is to transform bytes in bits
% Input flows arrival curves - alphas - Periodic Sources
Wi=rtccurve([0 20*8 20*8/40]); % [Start_point Slope] 
ESC=rtccurve([0 8*8 8*8/400]); % [Start_point Slope] 
% Input flows arrival curves - staircase - Periodic Sourcs
Wi_SC=rtccurve([0 0 0],20*8,40,20*8);
ESC_SC=rtccurve([0 0 0],8*8,400,8*8); 

% Arrival Curves - alphas - Non-Periodic Sources
Multimedia=rtccurve([0 6*1400*8 1400*8/17]); % [Start_point Slope] 
RC=rtccurve([0 8*1400*8 1400*8/20]); % [Start_point Slope] 

% Service curve
CAN=rtcfs(1e3);% 1Mbps = 1e3 bpms 

%extracting data from the rtcplots
figure('name', 'temp')
rtcplot(Wi,300);
WiData = findobj(gca,'Type','line');
Wi_X = linspace(WiData.XData(2), WiData.XData(3), 200);
Wi_Y = linspace(WiData.YData(2), WiData.YData(3), 200);
close temp
figure('name', 'temp')
rtcplot(Wi_SC,300)
Wi_SCData = findobj(gca,'Type','line');
Wi_SC_X = Wi_SCData.XData;
Wi_SC_Y = Wi_SCData.YData;
close temp
figure('name', 'temp')
rtcplot(CAN,300)
CANData = findobj(gca,'Type','line');
CAN_X = linspace(CANData(1).XData(2), CANData(1).XData(3), 200);
CAN_Y = linspace(CANData(2).YData(2), CANData(1).YData(3), 200);
close temp

figure(1)
%---For each wheel affine curve----------
plot(Wi_X, Wi_Y, 'linewidth', 1.2)
hold on

%---For each wheel staircase curve-------
plot(Wi_SC_X, Wi_SC_Y, 'linewidth', 1.2)

limY = get(gca,'ylim');

%---The service curve for the CAN-bus----
plot(CAN_X, CAN_Y, 'linewidth', 1.2, 'color', '[0 .5 0]')

axis([-5 300 limY])
grid on%, grid minor

title('Arrival Curves for Each Wheel', 'interpreter', 'LaTeX')
xlabel('Time [ms]', 'interpreter', 'LaTeX')
ylabel('Data [bit]', 'interpreter', 'LaTeX')

legend( 'Affine model',...
        'Staircase model',...
        'CAN service curve',...
        'location', 'southeast')

figure('name', 'temp')
%extracting data from the rtcplots
rtcplot(ESC,3000)
ESCData = findobj(gca,'Type','line');
ESC_X = linspace(ESCData.XData(2), ESCData.XData(3), 200);
ESC_Y = linspace(ESCData.YData(2), ESCData.YData(3), 200);
close temp
figure('name', 'temp')
rtcplot(ESC_SC,3000)
ESC_SCData = findobj(gca,'Type','line');
ESC_SC_X = ESC_SCData.XData;
ESC_SC_Y = ESC_SCData.YData;
close temp
figure('name', 'temp')
rtcplot(CAN,3000)
CANData = findobj(gca,'Type','line');
CAN_X = linspace(CANData(1).XData(2), CANData(1).XData(3), 200);
CAN_Y = linspace(CANData(2).YData(2), CANData(1).YData(3), 200);
close temp

figure(2)
%---For each ESC affine curve------------
plot(ESC_X, ESC_Y, 'linewidth', 1.2)
hold on

%---For each wheel staircase curve-------
plot(ESC_SC_X, ESC_SC_Y, 'linewidth', 1.2)

limY = get(gca,'ylim');

%---The service curve for the CAN-bus----
plot(CAN_X, CAN_Y, 'linewidth', 1.2, 'color', '[0 .5 0]')

axis([-50 3000 limY])
grid on%, grid minor

title('Arrival Curves for the ESC', 'interpreter', 'LaTeX')
xlabel('Time [ms]', 'interpreter', 'LaTeX')
ylabel('Data [bit]', 'interpreter', 'LaTeX')

legend( 'Affine model',...
        'Staircase model',...
        'CAN service curve',...
        'location', 'southeast')


figure('name', 'temp')
%extracting data from the rtcplots
rtcplot(Multimedia,1000);
MultData = findobj(gca,'Type','line');
Mult_X = linspace(MultData.XData(2), MultData.XData(3), 200);
Mult_Y = linspace(MultData.YData(2), MultData.YData(3), 200);
close temp
figure('name', 'temp')
rtcplot(CAN,1000)
CANData = findobj(gca,'Type','line');
CAN_X = linspace(CANData(1).XData(2), CANData(1).XData(3), 200);
CAN_Y = linspace(CANData(2).YData(2), CANData(1).YData(3), 200);
close temp

figure(3)
%---For each multimedia affine curve-----
plot(Mult_X, Mult_Y, 'linewidth', 1.2)
hold on

limY = get(gca,'ylim');

%---The service curve for the CAN-bus----
plot(CAN_X, CAN_Y, 'linewidth', 1.2, 'color', '[0 .5 0]')

axis([0 1000 limY])
grid on%, grid minor

title('Arrival Curves for the Multimedia', 'interpreter', 'LaTeX')
xlabel('Time [ms]', 'interpreter', 'LaTeX')
ylabel('Data [bit]', 'interpreter', 'LaTeX')

legend( 'Affine model',...
        'CAN service curve',...
        'location', 'southeast')



figure('name', 'temp')
%extracting data from the rtcplots
rtcplot(RC,1000);
RCData = findobj(gca,'Type','line');
RC_X = linspace(RCData.XData(2), RCData.XData(3), 200);
RC_Y = linspace(RCData.YData(2), RCData.YData(3), 200);
close temp
figure('name', 'temp')
rtcplot(CAN,1000)
CANData = findobj(gca,'Type','line');
CAN_X = linspace(CANData(1).XData(2), CANData(1).XData(3), 200);
CAN_Y = linspace(CANData(2).YData(2), CANData(1).YData(3), 200);
close temp

figure(4)
%---For each multimedia affine curve-----
plot(RC_X, RC_Y, 'linewidth', 1.2)
hold on

limY = get(gca,'ylim');

%---The service curve for the CAN-bus----
plot(CAN_X, CAN_Y, 'linewidth', 1.2, 'color', '[0 .5 0]')

axis([0 1000 limY])
grid on%, grid minor

title('Arrival Curves for the RC', 'interpreter', 'LaTeX')
xlabel('Time [ms]', 'interpreter', 'LaTeX')
ylabel('Data [bit]', 'interpreter', 'LaTeX')

legend( 'Affine model',...
        'CAN service curve',...
        'location', 'southeast')