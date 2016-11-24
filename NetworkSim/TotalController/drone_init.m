function drone_init

% Initialize TrueTime kernel
ttInitKernel('prioFP');  % Scheduling policy - fixed priority

starttime = 0.0;
period = 0.001;    

ttCreatePeriodicTask('drone_task',starttime,period, 'drone_code');

