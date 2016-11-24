function rc_init

% Initialize TrueTime kernel
ttInitKernel('prioFP');  % scheduling policy - fixed priority

% Periodic task
starttime = 0.0;
tokenperiod = 0.001;  
deadline=0.01;

DataQ.BufferSize=8;  % Max queue lenght: L
DataQ.lambda=1/0.002;    % Arrival rate in packets/s
DataQ.Q=0;           % Initial items in the queue
DataQ.seq=0;
 
DataT.BucketSize=10;  % Size of bucket: M
DataT.first=0;      
DataT.tokens=DataT.BucketSize;  % Initial number of tokens in the bucket

DataS.seq=0;

ttCreateMailbox('buffer_rc', DataQ.BufferSize);

ttCreateTask('generator_rc_task',deadline,3,'generator_rc_code',DataQ);
ttCreatePeriodicTask('token_rc_task', starttime, tokenperiod,1, 'token_rc_code',DataT);
ttCreateTask('service_rc_task', deadline,2,'service_rc_code',DataS);


