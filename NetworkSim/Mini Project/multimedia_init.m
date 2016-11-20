function multimedia_init

% Initialize TrueTime kernel
ttInitKernel('prioFP');  % scheduling policy - fixed priority

% Periodic task
starttime = 0.0;
tokenperiod = 0.001;  
deadline=0.01;

DataQ.BufferSize=8;  % Max queue lenght: L
DataQ.lambda=1/0.0025;    % Arrival rate in packets/s
DataQ.Q=0;           % Initial items in the queue
DataQ.seq=0;
 
DataT.BucketSize=10;  % Size of bucket: M
DataT.first=0;      
DataT.tokens=DataT.BucketSize;  % Initial number of tokens in the bucket

DataS.seq=0;

ttCreateMailbox('buffer_mm', DataQ.BufferSize);

ttCreateTask('generator_mm_task',deadline,3,'generator_mm_code',DataQ);
ttCreatePeriodicTask('token_mm_task', starttime, tokenperiod,1, 'token_mm_code',DataT);
ttCreateTask('service_mm_task', deadline,2,'service_mm_code',DataS);


