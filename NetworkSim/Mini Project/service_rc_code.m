function [exectime, data] = service_rc_code(seg,data)

switch seg
  case 1 
    data=t
    dataT=ttGetData('token_rc_task');     % Read what is in the bucket
    transmission=1;                       % transmission=1 indicates that we are transmitting
    while(transmission==1)
        transmission=0;
        if(dataT.tokens>0)                  % If there are tokens
            msg = ttTryFetch('buffer_rc');  % Message is extracted from buffer
            if(dataQ.Q>0)                               % If there are packets in the queue 
                dataQ.Q=dataQ.Q-1;                      % Reduce number of packets in the queue
                ttSetData('generator_rc_task',dataQ);   % Change data   
                dataT.tokens=dataT.tokens-1;            % Reduce number of tokens
                ttSetData('token_rc_task',dataT);       % Change number of tokens
                transmission=1;                         % We enter the loop again   
                data.seq=data.seq+1;
                 
                ttSendMsg(1, msg, 1400*8, 2);     % send msg to gateway (node 1)
                                                  % ttSendMsg(receiver, data, length, priority)
                
                PLP=(msg.seq-data.seq)/msg.seq;     % Packet Loss Probability
                disp(PLP);         
            
                time_del_tok_buck=ttCurrentTime-msg.timestamp; % Delay
                ttAnalogOut(3, time_del_tok_buck); % Delay --> Output 3
            end
        end
    end
    
    ttAnalogOut(1, dataQ.Q);
    ttAnalogOut(2, dataT.tokens);
    
    exectime = 0;
  case 2
    %msg.destination = [2 1];    % final destination = controller
    %ttSendMsg(2, msg, 250);     % send msg to gateway (node 2)
    exectime = -1;
end
