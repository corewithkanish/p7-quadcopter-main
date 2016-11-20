function [exectime, data] = generator_rc_code(seg,data)
switch seg
  case 1 
    msg.timestamp = ttCurrentTime;
    msg.data = [];
    msg.destination = [1 4];    % final destination = HUD
    
    data.seq=data.seq+1;
    if(data.Q<data.BufferSize) % If queue lenght is smaller than L
        data.Q=data.Q+1;       % increase the number of messages in the queue
        msg.seq=data.seq;   
        ttTryPost('buffer_rc', msg);
        ttCreateJob('service_rc_task');   % Create job for service task ("A message has arrived")
    end
    %%%%%% Then we create a job to start the generator task in a
    %%%%%% poisson distributed time. This is to generate the next message
    u=rand(1);
    time=-log(1-u)/data.lambda;   
    ttCreateJob('generator_rc_task', ttCurrentTime+time); 
    exectime=0;
    %%%%%% 
  case 2
  exectime = -1;
end
