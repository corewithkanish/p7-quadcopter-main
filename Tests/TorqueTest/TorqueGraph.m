TorqueData=[0 0.025 0.02876 0.03062 0.03376 0.03438 0.04126 0.0425 0.04626 0.04812];
SpeedData=[0 163.1533785 173.206475 178.8613417 191.3753525 196.6113402 205.0412805 ...
    211.7957047 222.0058809 225.6710723];

Kd=9.423327e-07;

t=linspace(0,250,2000);
curve=Kd.*t.^2;

% Plot
plot(SpeedData,TorqueData,'*k')
hold on;
plot(t,curve,'LineWidth',1.2)
grid on
grid minor
title('Drag Torque')
xlabel('Motor Velocity [rad/s]')
ylabel('Drag Torque [Nm]')
legend('Test Data','Approximated Curve','Location','SouthEast')