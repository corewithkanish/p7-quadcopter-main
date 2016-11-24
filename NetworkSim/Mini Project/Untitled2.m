%% Distributed Real Time Systems - Mini Project

% Input flows arrival curves
W1=rtcpjdu(40);
W2=rtcpjdu(40);
W3=rtcpjdu(40);
W4=rtcpjdu(40);
ESP=rtcpjdu(400);
figure(1);
rtcplot(W1,W4,100);

% Service curve
CAN=rtcfs(1e3);% 1Mbps = 1e3 bpms
%figure(2)
%rtcplot(CAN,'r',500)

