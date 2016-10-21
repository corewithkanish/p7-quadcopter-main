clear all;
clear home;

S1 = serial('COM9', 'BaudRate', 115200, 'Terminator', 'CR', 'StopBit', 1, 'Parity', 'None'); 

%set(S1,'Timeout',2);

fopen(S1);

for i=0:1:1000
    
    %warning('off','MATLAB:serial:fscanf:unsuccessfulRead');
    fprintf(S1,'0');
    %warning('on','MATLAB:serial:fscanf:unsuccessfulRead');
    
end

a = 1

%if(in == '0')
fclose(S1);
delete(S1);
clear S1;
%end

