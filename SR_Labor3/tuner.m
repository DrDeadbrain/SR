%Aufgabe 4 - Messung eines Gitarrentons mit DFT


[signal, Fs] = audioread('GitOneString.wav');

%Calc
T = length(signal)/ Fs;
DeltaF = 1 / T;
fVec = [0 : DeltaF : Fs];
fVec = fVec(1:end-1);

%Play file
soundsc(signal, Fs);

%Perform fft
C = fft(signal) / length(signal);

%approx frequency

%find peaks
cAbs = abs(C);

%Find note by checking this table: http://pianotip.de/frequenz.html

%Plots
subplot(2, 1, 1);
    plot(signal);
    title('Signal');
    
subplot(2, 1, 2);
    stem(fVec, cAbs);
    title(strcat('FFT Absolutwerte'));
    axis([0 500 -inf inf]);