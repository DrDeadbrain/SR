%Aufgabe 4 - Messung eines Gitarrentons mit DFT

playsound = true;

file = 'C:\Users\Christian\Desktop\Uni\Vorlesung_Signalverarbeitung\3_Laborübung\LÜ03\GitOneString.wav';
[sig, Fs] = audioread(file);

t = length(sig)/Fs; %calc runtime of signal
deltaF = 1/t;

freqVec = 0 : deltaF : Fs - deltaF;

if playsound
    playblocking(audioplayer(sig,Fs));
end

spec = fft(sig);

subplot(1, 1, 1);
    plot(freqVec, abs(spec));
    title('spectrum');
    xlabel(sprintf('f'));
    ylabel('Amplitude');