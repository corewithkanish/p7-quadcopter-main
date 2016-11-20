function wheel_init

% Initialize TrueTime kernel
ttInitKernel('prioFP');  % scheduling policy - fixed priority

% Periodic task, send information from the wheel
starttime = 0.0;
period = 0.040;      % 40 ms

ttCreatePeriodicTask('wheel_task', starttime, period, 'wheel_code');
