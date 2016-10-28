%%
header = 15;

roll=0.02;
pitch=0.02;
yaw=0.01;

roll=floor(roll*100);
pitch=floor(pitch*100);
yaw=floor(yaw*100);

if (roll<0)
    roll=abs(roll)+256;
end
if (pitch<0)
    pitch=abs(pitch)+256;
end
if (yaw<0)
   yaw=abs(yaw)+256;
end

angles = fi([roll,pitch,yaw],0,9,0);

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
            b=bitshift(bitand(uint8(roll),uint8(1)),7);
        case 5
            if (pitch<0)
                signbit=64;
            else 
                signbit=0;
            end
            disp(b)
            a=bitshift(fi(uint8(roll)),-2);
            package(i)=bitor(uint8(a),uint8(signbit));
            package(i)=bitor(uint8(package(i)),uint8(b));
            b=bitshift(fi(uint8(pitch)),6);   
          
    end 
end














