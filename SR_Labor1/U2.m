% Chirp Signal erzeugen
%Chirp-Parameter
t_start = 0; fStart = 10;
t_stop  = 5; fStop  = 5000;

FSample = 10000; TSample = 1/FSample;
% ----------------------------------------------
t = t_start:TSample:t_stop;
y = chirp(t, fStart, t_stop, fStop, 'logarithmic');
y_norm = y / max(abs(y));

% Anzahl der Samples best.
FileSize = size(y, 1);

% Speicher für gefiltertes Signal anlegen
yFilter_10 = zeros(FileSize, 1);
yFilter_50 = zeros(FileSize, 1);
yFilter_250 = zeros(FileSize, 1);

%Berechnung des gleitenden Mittelwertes ueber k
k_10 = 10;
yFilter_10 = movmean(y, k_10);
yFilter_10_norm = yFilter_10/max(abs(yFilter_10));

k_50 = 50;
yFilter_50 = movmean(y, k_50);
yFilter_50_norm = yFilter_50/max(abs(yFilter_50));

k_250 = 250;
yFilter_250 = movmean(y, k_250);
yFilter_250_norm = yFilter_250/max(abs(yFilter_250));

%yDist = filter([-1 1], 1, y);

t = linspace(-1, 1, length(y));
figure(1);

%Input
subplot(2, 2, 1),
plot(t, y);
title('Input Data');
grid on; hold on;

%k = 10
subplot(2, 2, 2),
plot(t, yFilter_10);
title('Output k=10');
grid on; hold on;

%k = 50
subplot(2, 2, 3),
plot(t, yFilter_50);
title('Output k=50');
grid on; hold on;

%k = 250
subplot(2, 2, 4),
plot(t, yFilter_250);
title('Output k=250');
grid on; hold on;

sound(y_norm, Samplefrequenz);
pause(5);
sound(yFilter_250_norm, Samplefrequenz);


