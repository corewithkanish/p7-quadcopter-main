function [exectime, data] = gateway_code(seg,data)

switch seg
  case 1
    exectime = 0.0025;
 
  case 2
    
    exectime = 0;
    for nw = 1:2  % Read messages from both network 1 and 2
      msg = ttGetMsg(nw);
      
      if ~isempty(msg)
        % Forward message to the destination
        ttSendMsg(msg.destination, msg, 160, 3);
        exectime = exectime + 0.0025;
      end
    end
    
  case 3
    exectime = -1;
end

    
