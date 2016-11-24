function [exectime, data] = token_rc_code(seg,data)

switch seg
  case 1 
    %%%% The first time this is executed, Create the first genetator job
    if(data.first==0)
        data.first=1;
        data.tokens=data.BucketSize;
        ttCreateJob('generator_rc_task'); 
    end
    %%%%
    if( data.tokens < data.BucketSize) %if token bucket is not full
        data.tokens=data.tokens+1;  % Increase the number of tokens
        ttCreateJob('service_rc_task'); % Tell the service task "A token has arrived"
    end
    exectime = 0;
  case 2
    exectime = -1;
end
