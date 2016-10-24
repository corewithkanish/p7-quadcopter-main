ThrustData=[0 0.67758 0.72668 0.8347 0.87398 0.95254 0.97218 1.11948 1.26678 1.473 1.5712 1.78724 1.9149 2.1113 ...
    2.23896 2.455];
SpeedData=[0 117.2861257 120.6895178 128.0199006 130.6378945 135.3502835 139.5390737 147.1836158 156.817833 ...
    167.2898088 172.1069175 182.8930523 188.9667981 197.134939 203.575204 212.5811029];

Kth=5.316868e-05;

t=linspace(0,250,2000);
curve=Kth.*t.^2;

% Plot
plot(SpeedData,ThrustData,'*k')
hold on;
plot(t,curve,'LineWidth',1.2)
grid on
grid minor
title('Thrust Force')
xlabel('Motor Velocity [rad/s]')
ylabel('Thrust Force [N]')
legend('Test Data','Approximated Curve','Location','SouthEast')
