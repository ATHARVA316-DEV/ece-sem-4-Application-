%10
clc;
clear;
close all;

% Time for analog signal
t = 0:0.001:0.2;

% Input frequencies
f1 = input('Enter the input frequency1 = ');
f2 = input('Enter the input frequency2 = ');

% Analog signal
xa = cos(2*pi*f1*t) + cos(2*pi*f2*t);

% Sampling parameters
fm = max(f1, f2);
fs = 10 * fm;
ts = 1/fs;

% Discrete-time index
n = 0:round(0.2 * fs);

% Sampled signal
xd = cos(2*pi*f1*n*ts) + cos(2*pi*f2*n*ts);

% Plot analog and sampled signal
figure;
subplot(3,1,1);
plot(t, xa);
hold on;
stem(n*ts, xd, 'r');
hold off;
xlabel('Time (s)');
ylabel('Amplitude');
title('Analog Signal and Sampled Signal');
legend('xa(t)', 'xd[n]');

% Discrete-time signal
subplot(3,1,2);
stem(n, xd, 'k');
xlabel('n');
ylabel('xd[n]');
title('Discrete-Time Signal');

% Reconstruction using sinc interpolation
xr = zeros(size(t));
for k = 1:length(n)
    xr = xr + xd(k) * sinc((t - n(k)*ts)/ts);
end

% Reconstructed signal
subplot(3,1,3);
plot(t, xr, 'b');
xlabel('Time (s)');
ylabel('Amplitude');
title('Reconstructed Signal');





%0.25

clc;
clear;
close all;

% Time for analog signal
t = 0:0.001:0.2;

% Input frequencies
f1 = input('Enter the input frequency1 = ');
f2 = input('Enter the input frequency2 = ');

% Analog signal
xa = cos(2*pi*f1*t) + cos(2*pi*f2*t);

% Sampling parameters
fm = max(f1, f2);
fs = 0.25 * fm;
ts = 1/fs;

% Discrete-time index
n = 0:round(0.2 * fs);

% Sampled signal
xd = cos(2*pi*f1*n*ts) + cos(2*pi*f2*n*ts);

% Plot analog and sampled signal
figure;
subplot(3,1,1);
plot(t, xa);
hold on;
stem(n*ts, xd, 'r');
hold off;
xlabel('Time (s)');
ylabel('Amplitude');
title('Analog Signal and Sampled Signal');
legend('xa(t)', 'xd[n]');

% Discrete-time signal
subplot(3,1,2);
stem(n, xd, 'k');
xlabel('n');
ylabel('xd[n]');
title('Discrete-Time Signal');

% Reconstruction using sinc interpolation
xr = zeros(size(t));
for k = 1:length(n)
    xr = xr + xd(k) * sinc((t - n(k)*ts)/ts);
end

% Reconstructed signal
subplot(3,1,3);
plot(t, xr, 'b');
xlabel('Time (s)');
ylabel('Amplitude');
title('Reconstructed Signal');

