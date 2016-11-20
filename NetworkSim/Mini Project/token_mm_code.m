function [exectime, data] = token_mm_code(seg,data)

switch seg
  case 1 
    %%%% The first time this is executed, create the first genetator job
    if(data.first==0)
        data.first=1;
        data.tokens=data.BucketSize;
        ttCreateJob('generator_mm_task'); 
    end
    %%%%
    if( data.tokens < data.BucketSize) % If token bucket is not full
        data.tokens=data.tokens+1;      % Increase the number of tokens
        ttCreateJob('service_mm_task'); % Tell the service task "A token has arrived"
    end
    exectime = 0;
  case 2
    exectime = -1;
end
