%% Distributed Real Time Systems - Mini Project

% Input flows arrival curves
W1=rtccurve([0 20*8 20*8/0.04]);
W2=rtccurve([0 20*8 20*8/0.04]);
W3=rtccurve([0 20*8 20*8/0.04]);
W4=rtccurve([0 20*8 20*8/0.04]);
ESP=rtccurve([0 8*8 8*8/0.4]);

RC=6;


% Service curve
CAN=rtcfs(1e6);% 1Mbps = 1e6 bps

figure(1)
subplot(1,2,1)
rtcplot(W3,0.001);hold on
rtcplot(CAN,0.001,'g');
ylim([0 300]);
hold off
subplot(1,2,2)
rtcplot(ESP,0.001,'r');hold on
rtcplot(CAN,0.001,'g');
ylim([0 100]);
hold off