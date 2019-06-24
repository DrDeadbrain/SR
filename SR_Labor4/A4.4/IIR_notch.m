% IIR_notch_880.mat entspricht Elliptic mit Filterordnung 2
load('IIR_notch_880.mat'); % filter Struct *.mat Datei laden 
%IIR_notch_880=IIR_notch_880mat.IIR_notch_880; % aus dem Struct den tatschlichen Filter extrahieren
%v=getfield(Denominator,IIR_notch_880)


Fs = 44100;

[s1, Fs] = audioread('GitRiff_880Hz.wav');

s1 = s1/max(abs(s1)); %normieren
s2 = filter(Num, Den, s1);
s2 = s2/max(abs(s2)); %normieren

subplot(2, 1, 1);
    plot(s1);
    title ('Originalsignal');
    ylim ([-1, 1]);
    xlabel (sprintf ('Zeit in s/%d', Fs));

subplot(2, 1, 2);
    plot(s2);
    title ('Ergebnis');
    ylim ([-1, 1]);
    xlabel (sprintf ('Zeit in s/%d', Fs));

    
sound(s1, Fs);
pause
sound(s2, Fs);
