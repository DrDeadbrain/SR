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
[peaks, indices] = findpeaks(cAbs(1:round(length(C) /2)), 'MinPeakHeight', 1e-4);

%find good deltas
deltas = diff(indices);
significantDeltas = abs(deltas - median(deltas)) < 20;

%take only the good deltas
filteredDeltas = deltas(significantDeltas);
filteredPeaks = indices(significantDeltas);

f0 = mean(filteredDeltas) * DeltaF;

%Find note by checking this table: http://pianotip.de/frequenz.html

%Plots
subplot(2, 1, 1);
    plot(signal);
    title('Signal');
    
subplot(2, 1, 2);
    semilogy(fVec, abs(C), 'b', filteredPeaks * DeltaF, cAbs(filteredPeaks), 'rx');
    title(strcat('FFT (up to 5.5 kHz) - f_0 = ', num2str(f0)));
    legend('Frequencies', 'Filterred Peaks for Frequency calculation');
    axis([0 5500 -inf inf]);