% Wavedatei lesen --> y 
[y, Samplefrequenz] = audioread('C:\Users\Christian\Desktop\Uni\Vorlesung_Signalverarbeitung\3_Laborübung\LÜ01\JetztGehtsLos.wav');
% Anzahl der Samples best.
FileSize = size(y, 1);

% Speicher für gefiltertes Signal anlegen
yFilter_10 = zeros(FileSize, 1);
yFilter_50 = zeros(FileSize, 1);
yFilter_250 = zeros(FileSize, 1);

%Berechnung des gleitenden Mittelwertes ueber k
k_10 = 10;
yFilter_10 = movmean(y, k_10);

k_50 = 50;
yFilter_50 = movmean(y, k_50);

k_100 = 100;
yFilter_100 = movmean(y, k_100);

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

%k = 100
subplot(2, 2, 4),
plot(t, yFilter_100);
title('Output k=100');
grid on; hold on;

disp('Size of vector y is:')
disp(FileSize);
disp('SampleRate:')
disp(Samplefrequenz);
sound(y, Samplefrequenz);
pause(5);
sound(yFilter_10, Samplefrequenz);
pause(5);
sound(yFilter_50, Samplefrequenz);
pause(5);
sound(yFilter_100, Samplefrequenz);

