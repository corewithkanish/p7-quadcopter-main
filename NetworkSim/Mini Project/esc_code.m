function [exectime, data] = esc_code(seg,data)

switch seg
  
  case 1 
    exectime = 0.005;
  
  case 2
    msg.timestamp = ttCurrentTime;
    msg.data = [];
    msg.destination = [1 5];    % Final destination = EC
    
    ttSendMsg(1, msg, 8*8, 1);  % Send msg to gateway (node 1)
                                % ttSendMsg(receiver, data, length, priority)
    
    exectime = -1;
end
