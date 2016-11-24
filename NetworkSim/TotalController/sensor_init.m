function sensor_init

% Initialize TrueTime kernel
ttInitKernel('prioFP');  % scheduling policy - fixed priority

% Periodic task, send information from the wheel
starttime = 0.0;
period = 0.035;      % 30 ms
ttCreatePeriodicTask('sensor_task', starttime, period, 'sensor_code');
