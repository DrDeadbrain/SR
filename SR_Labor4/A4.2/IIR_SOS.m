% IIR_1500_80dB.mat entspricht Elliptic mit Filterordnung 11 und 6 Second
% Order Sections.
% Er ist linearphasig sowie die anderen beiden entworfenen Filter auch,
% da er symmetrisch ist.

tmpfilter = load('IIR_1500_80dB.mat'); % filter Struct *.mat Datei laden 
IIR_1500_80dB = tmpfilter.SOS; % aus dem Struct den tatschlichen Filter extrahieren

Fs = 44100;
select = 4;

%%chirp-parameter
tStart = 0; fStart = 50;
tStop = 5; fStop = 5000;
TSample = 1/ Fs;

if select == 1 %wav datei lesen
    %filename = '../ACDClike.wav';
    [s1, Fs] = audioread('ACDClike.wav');
elseif select == 2 %chirp
    t = tStart:TSample:tStop;
    s1 = chirp(t, fStart, tStop, fStop, 'linear');
elseif select == 3 %rauschen
    s1 = rand(1, Fs*tStop) -0.5; %-0.5 um negative Werte zu erhalten
elseif select == 4 %Rechteckimpulsfolge
    t = 0:TSample:1; %44.1kHz sample freq fr 1s, TSample = 1/44100
    d = 0:1/20:1; %20 Hz Wiederholrate fr 1s
    s1 = pulstran(t, d, 'rectpuls', 0.005); %Rect der breite 5ms
end

s2 = sosfilt(IIR_1500_80dB, s1); %filtern
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

