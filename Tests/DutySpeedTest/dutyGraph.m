close all
clear 
clc
pwm=[160,165,170,175,180,185,190,195,200,205];
speed=[231.43, 267.45, 295.31, 354.05, 354.05, 391.65, 422.54, 455.01, 483.81, 511.24];
curve=speed*0.1598+122.79;

figure
scatter(speed, pwm, 'lineWidth',1.2)
hold on
plot(speed,curve, 'lineWidth',1.2)
grid on
grid minor
title('')
ylabel('Duty')
xlabel('Rotational Speed [rad/s]')
legend('Measured Data','Fitted Curve','Location','SouthEast')