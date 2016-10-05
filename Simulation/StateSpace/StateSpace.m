run Parameters.m

% State-Space Representation of the Angle Equations
A=[0 0 0 1 0 0;
    0 0 0 0 1 0;
    0 0 0 0 0 1;
    0 0 0 0 0 0;
    0 0 0 0 0 0;
    0 0 0 0 0 0];

B=[0 0 0 0;
    0 0 0 0;
    0 0 0 0;
    0 -2*kth*L*w2_bar/Jx 0 2*kth*L*w4_bar/Jx;
    2*kth*L*w1_bar/Jy 0 -2*kth*L*w3_bar/Jy 0;
    2*kd*w1_bar/Jz -2*kd*w2_bar/Jz 2*kd*w3_bar/Jz -2*kd*w4_bar/Jz];

C=[1 0 0 0 0 0;
    0 1 0 0 0 0;
    0 0 1 0 0 0];

% State Feedback Controller
controllability=[B A*B A*A*B A*A*A*B A*A*A*A*B A*A*A*A*A*B];
rank(controllability);

%K=place(A,B,[-1 -2 -3 -4 -5 -6]);

% Addition of a reference
Ae=[A zeros(size(A,1),size(C,1));
        C zeros(size(C,1),size(C,1))];
Be=[B; zeros(size(C,1),size(B,2))];

Fe=place(Ae,Be,[[-2 -2.2 -2.3 -7.4 -7.5 -7.6] [-3.7 -3.8 -3.9]]);
F=Fe(:,1:size(A,2));
FI=Fe(:,size(A,2)+1:size(Fe,2));

% Reduced Order Observer 
observability=[C;
               C*A;
               C*A*A;
               C*A*A*A;
               C*A*A*A*A;
               C*A*A*A*A*A];
rank(observability);


A12=A(1:3,4:6);
A22=A(4:6,4:6);

Lobs=(-place(A22',A12',[-60 -70 -80]))';  %% Place uses the form A-BF. If we have A22+L*A12 -----> A22'+A12'*(-L)'

LA12=Lobs*A12;

%% 
P=[-1.2 -1.5 -15];
K=place(A,B,P);
   
k=1;
P1=[0 -1 -2];
close all;
for i=1:0.5:20
    P1(k)=P1(k)-2;
%     if (P1(1)==P1(2) || P1(1)==P1(3) || P1(2)==P1(3)) 
%      P1(k)=P1(k)-2;
%     end;
    P1(2)=P1(1)-1;  
    P1(3)=P1(2)-8;
    K1=place(A,B,P1);
    if (i==1)
        Ptotal=P1;
        Ktotal=K1;
    else
        Ptotal=[Ptotal; P1];
        Ktotal=[Ktotal; K1]; 
    end;
    warning('off');
    sim('stateSpaceController.slx');
    warning('on');
    figure(1);
    plot(position1,'linewidth',1.2);
    hold on;
    figure(2);
    plot(position2,'linewidth',1.2);
    hold on;
    figure(3);
    plot(wheel1,'linewidth',1.2);
    hold on;
    figure(4);
    plot(wheel2,'linewidth',1.2);
    hold on;   
    drawnow;    
    hold on;
    if (K1(1)<-5)
        break;
    end;
end

figure(1);
title('Catching Response with Initial Velocity of the Frame');
grid on, grid minor;
set(gca,'GridLineStyle',':', 'GridColor', 'k', 'GridAlpha', .6)
xlabel('Time (s)');
ylabel('Angular Position (rad)');
xlim([0 3]);
hold off;