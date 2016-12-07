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
        data.u(1) = ttAnalogIn(1);
        data.u(2) = ttAnalogIn(2);
        data.u(3) = ttAnalogIn(3);
        data.u(4) = ttAnalogIn(4);
        data.u(5) = ttAnalogIn(5);
        data.u(6) = ttAnalogIn(6);
        data.u(7) = ttAnalogIn(7);
        data.u(8) = ttAnalogIn(8);
        data.u(9) = ttAnalogIn(9);
        data.u(10) = ttAnalogIn(10);
        data.u(11) = ttAnalogIn(11);
        data.u(12) = ttAnalogIn(12);
        max_time=0.03;%0.0506; 
        exectime=max_time; % Delay on the system 
    case 2,
        ttSendMsg(2, data.u, 1, 1);  % send msg to drone, node 2
                                     % ttSendMsg(receiver, data, length, priority)
        %disp(data.u)
        %ttAnalogOut(1,data.u(1));
        %ttAnalogOut(2,data.u(2));
        exectime = -1;
    end

