clc;
close;
close all;

a = [1 -0.25 -0.125];
b = [1 0.5];

M = length(b) - 1;
N = length(a) - 1;

IC = input('enter the IC for Y: ');
ic = filtic(b, a, flip(IC));

n = -N:20;
x = (n >= 0) - (n >= 2);

subplot(2,1,1);
stem(n, x);
title('input x(n)');
xlabel('n');
ylabel('amp');

y = [ic zeros(1, length(n) - N)];

for n = N+1:20
    sumx = 0;
    sumy = 0;

    for k = 0:M
        sumx = sumx + b(k+1) * x(n-k+N+1);
    end

    for k = 1:N
        sumy = sumy + a(k+1) * y(n-k);
    end

    y(n) = sumx - sumy;
end

n = -N:20;
subplot(2,1,2);
stem(n, y);
title('output y(n)');
xlabel('n');
ylabel('amp');

yinbuilt = filter(b, a, x, ic);
disp('y[n]        yinbuilt[n]');
disp([y' yinbuilt']);

