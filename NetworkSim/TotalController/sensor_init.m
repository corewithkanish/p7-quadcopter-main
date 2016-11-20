function sensor_init

% Initialize TrueTime kernel
ttInitKernel('prioFP');  % scheduling policy - fixed priority

% Periodic task, send information from the wheel
starttime = 0.0;
period = 0.030;      % 100 ms

ttCreatePeriodicTask('sensor_task', starttime, period, 'sensor_code');
