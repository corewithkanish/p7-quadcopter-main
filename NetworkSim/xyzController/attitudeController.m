%--------------------- Attitude Control -----------------------------------
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

D=0;

system=ss(A,B,C,D);
%poles_system=pole(system);
%zeros_system=zero(system);

% State Feedback Controller
controllability=[B A*B A*A*B A*A*A*B A*A*A*A*B A*A*A*A*A*B];
rank(controllability);

% Addition of a Reference
Ae=[A zeros(size(A,1),size(C,1));
        C zeros(size(C,1),size(C,1))];
Be=[B; zeros(size(C,1),size(B,2))];

Fe=-place(Ae,Be,[[-15 -15.2 -15.3 -15.4 -15.5 -15.6] [-17.7 -17.8 -17.9]]); % Place uses the form A-BF
F=Fe(:,1:size(A,2));
F1=F(:,1:3);
F2=F(:,4:6);
FI=Fe(:,size(A,2)+1:size(Fe,2));

% Reduced Order Observer 
observability=[C;
               C*A;
               C*A*A;
               C*A*A*A;
               C*A*A*A*A;
               C*A*A*A*A*A];
rank(observability);

A11=A(1:3,1:3);
A12=A(1:3,4:6);
A21=A(4:6,1:3);
A22=A(4:6,4:6);
B1=B(1:3,:);
B2=B(4:6,:);
C1=C(:,1:3);
C2=C(:,4:6);

Lobs=(-place(A22',A12',[-60 -70 -80]))';  % Place uses the form A-BF. If we have A22+L*A12 -----> A22'+A12'*(-L)'

LA12=Lobs*A12;
