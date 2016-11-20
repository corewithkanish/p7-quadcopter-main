% function [exectime, data] = sensor_code(seg,data)
% switch seg
%   case 1 
%     exectime = 0.005; % WE NEED TO SET THIS PROPERLY
%   case 2
% %    msg.timestamp = ttCurrentTime;
%     msg.data = ttAnalogIn(1);
% %    msg.destination = [1 2];    % final destination = Drone Maybe not needed
%     
%     ttSendMsg(2, msg, 21*8, 1);     % send msg to drone, node 2
%                                     % ttSendMsg(receiver, data, length, priority)                            
%     exectime = -1;
% end
function [exectime,data] = sensor_code(seg,data)
    switch seg,
    case 1,
        data.u = ttAnalogIn(1);
        exectime = 0.03; % Delay on the system
    case 2,
        ttSendMsg(2, data.u, 21*8, 1);  % send msg to drone, node 2
                                     % ttSendMsg(receiver, data, length, priority)
        ttAnalogOut(1,data.u);
        exectime = -1;
    end

