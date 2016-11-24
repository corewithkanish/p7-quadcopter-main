function esc_init

% Initialize TrueTime kernel
ttInitKernel('prioFP');  % scheduling policy - fixed priority

% Periodic task, send information from the ESC
starttime = 0.0;
period = 0.4;      % 400 ms

ttCreatePeriodicTask('esc_task', starttime, period, 'esc_code');
