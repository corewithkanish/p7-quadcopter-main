
clear 
close all 
clc

% Header
header = 255;

% Angular Positions
roll=2.55;
pitch=-2.55;
yaw=-1.34;

roll=round(roll*100);
pitch=round(pitch*100);
yaw=round(yaw*100);

% Translational Positions
x=5110;
y=3110;
z=-5110;

x=round(x/10);
y=round(y/10);
z=round(z/10);

% Translational References
xref=-5110;
yref=5110;
zref=410;

xref=round(xref/10);
yref=round(yref/10);
zref=round(zref/10);

% Translational Velocities
xdot=-10230;
ydot=10230;
zdot=1023;

xdot=round(xdot/10);
ydot=round(ydot/10);
zdot=round(zdot/10);

% Package Creation
package=zeros(1,21,'uint8');

for i=1:1:21
    switch i
        case 1
            package(i)=uint8(header);
            
        case 2
            package(i)=uint8(header);            
        case 3
            package(i)=uint8(header);          
        case 4
            if (roll<0)
                signbit=128;
            else 
                signbit=0;
            end
            a=bitshift(fi(uint8(abs(roll))),-1);
            package(i)=bitor(uint8(a),uint8(signbit));
            b=bitshift(bitand(uint8(abs(roll)),uint8(1)),7);
        case 5
            if (pitch<0)
                signbit=64;
            else 
                signbit=0;
            end
            a=bitshift(fi(uint8(abs(pitch))),-2);
            package(i)=bitor(uint8(a),uint8(signbit));
            package(i)=bitor(uint8(package(i)),uint8(b));
            b=bitshift(bitand(uint8(abs(pitch)),uint8(3)),6);   
        case 6
            if (yaw<0)
                signbit=32;
            else 
                signbit=0;
            end
            a=bitshift(fi(uint8(abs(yaw))),-3);
            package(i)=bitor(uint8(a),uint8(signbit));
            package(i)=bitor(uint8(package(i)),uint8(b));
            b=bitshift(bitand(uint8(abs(yaw)),uint8(7)),5);  
        case 7
            if (x<0)
                signbit=16;
            else 
                signbit=0;
            end
            a=bitshift(fi(uint16(abs(x))),-5);
            package(i)=bitor(uint8(a),uint8(signbit));
            package(i)=bitor(uint8(package(i)),uint8(b));
            b=bitand(bitshift(fi(uint16(abs(x))),3),uint16(255));
        case 8
            if (y<0)
                signbit=4;
            else 
                signbit=0;
            end
            a=bitshift(fi(uint16(abs(y))),-7);
            package(i)=bitor(uint8(a),uint8(signbit));
            package(i)=bitor(uint8(package(i)),uint8(b));
            b=bitand(bitshift(fi(uint16(abs(y))),1),uint16(255));
        case 9
            if (z<0)
                signbit=1;
            else 
                signbit=0;
            end
            package(i)=bitor(uint8(signbit),uint8(b));
        case 10
            a=bitshift(fi(uint16(abs(z))),-1);
            package(i)=uint8(a);
            b=bitand(bitshift(fi(uint16(abs(z))),7),uint16(255));
        case 11
             if (xref<0)
                signbit=64;
            else 
                signbit=0;
            end
            a=bitshift(fi(uint16(abs(xref))),-3);
            package(i)=bitor(uint8(a),uint8(signbit));
            package(i)=bitor(uint8(package(i)),uint8(b));
            b=bitand(bitshift(fi(uint16(abs(xref))),5),uint16(255));  
        case 12
             if (yref<0)
                signbit=16;
            else 
                signbit=0;
            end
            a=bitshift(fi(uint16(abs(yref))),-5);
            package(i)=bitor(uint8(a),uint8(signbit));
            package(i)=bitor(uint8(package(i)),uint8(b));
            b=bitand(bitshift(fi(uint16(abs(yref))),3),uint16(255));  
        case 13
             if (zref<0)
                signbit=4;
            else 
                signbit=0;
            end
            a=bitshift(fi(uint16(abs(zref))),-7);
            package(i)=bitor(uint8(a),uint8(signbit));
            package(i)=bitor(uint8(package(i)),uint8(b));
            b=bitand(bitshift(fi(uint16(abs(zref))),1),uint16(255));  
        case 14
             if (xdot<0)
                signbit=1;
            else 
                signbit=0;
            end
            package(i)=bitor(uint8(signbit),uint8(b));
        case 15
            a=bitshift(fi(uint16(abs(xdot))),-2);
            package(i)=uint8(a);
            b=bitand(bitshift(fi(uint16(abs(xdot))),6),uint16(255)); 
        case 16
             if (ydot<0)
                signbit=32;
            else 
                signbit=0;
            end
            a=bitshift(fi(uint16(abs(ydot))),-5);
            package(i)=bitor(uint8(a),uint8(signbit));
            package(i)=bitor(uint8(package(i)),uint8(b));
            b=bitand(bitshift(fi(uint16(abs(ydot))),3),uint16(255));  
        case 17
            if (zdot<0)
                signbit=4;
            else 
                signbit=0;
            end
            a=bitshift(fi(uint16(abs(zdot))),-8);
            package(i)=bitor(uint8(a),uint8(signbit));
            package(i)=bitor(uint8(package(i)),uint8(b));     
            b=bitand(fi(uint16(abs(zdot))),uint16(255));
        case 18
           package(i)=uint8(b);     
        case 19
           check=checksum(package);
           a=bitand(bitshift(fi(uint32(abs(check))),-16),uint32(255)); 
           package(i)=uint8(a);
        case 20
           a=bitand(bitshift(fi(uint32(abs(check))),-8),uint32(255));           
           package(i)=uint8(a); 
        case 21
           a=bitand(uint32(abs(check)),uint32(255));
           package(i)=uint8(a);
    end 
end

S1 = serial('COM5', 'BaudRate', 9600, 'Terminator', 'CR', 'StopBit', 1, 'Parity', 'None'); 
fopen(S1);

    fwrite(S1,package);
    pause(0.1);
    fread(S1)

fclose(S1);
delete(S1);
clear S1;


