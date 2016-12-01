% function [exectime, data] = drone_code(seg,data)
% 
% switch seg
%   case 1
%     exectime = 0.00000025; % WE SHOULD SET THIS PROPERLY
%   case 2
%     exectime = 0;
%     msg = ttGetMsg(1);
%     if ~isempty(msg)
%       ttAnalogOut(1,msg.data);
%       %exectime = exectime + 0.0025;
%     end  
%   case 3
%     exectime = -1;
% end
function [exectime,data] = drone_code(seg,data)
    switch seg,
    case 1,
        msg.data=ttGetMsg(1);
        if ~isempty(msg.data)
            ttAnalogOut(1,msg.data(1))
            ttAnalogOut(2,msg.data(2))
            ttAnalogOut(3,msg.data(3))
            ttAnalogOut(4,msg.data(4))
            ttAnalogOut(5,msg.data(5))
            ttAnalogOut(6,msg.data(6))
            ttAnalogOut(7,msg.data(7))
            ttAnalogOut(8,msg.data(8))
            ttAnalogOut(9,msg.data(9))
            ttAnalogOut(10,msg.data(10))
            ttAnalogOut(11,msg.data(11))
            ttAnalogOut(12,msg.data(12))
        end
        exectime = 0.0000001; % Delay on the system
    case 2,
        exectime = -1;
    end


