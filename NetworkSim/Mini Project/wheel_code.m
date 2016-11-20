function [exectime, data] = wheel_code(seg,data)

switch seg
  
  case 1 
    exectime = 0.005;
  
  case 2
    msg.timestamp = ttCurrentTime;
    msg.data = [];
    msg.destination = [1 2];    % final destination = ESC
    
    ttSendMsg(1, msg, 20*8, 1);     % send msg to gateway (node 1)
                                    % ttSendMsg(receiver, data, length, priority)
                                
    exectime = -1;
end
