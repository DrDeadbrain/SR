% IIR_1400_40dB.mat entspricht Elliptic mit Filterordnung 6 und 3 Second
% Order Sections.
% Er ist linearphasig sowie die anderen beiden entworfenen Filter auch,
% da er symmetrisch ist. (siehe Erluterung
% http://dnt.kr.hsnr.de/DSV14/skripte_dss/filter.pdf)

tmpIIR_1400_40dB = load('IIR_1400_40dB.mat'); % filter Struct *.mat Datei laden 
IIR_1400_40dB = tmpIIR_1400_40dB.SOS; % aus dem Struct den tatschlichen Filter extrahieren

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

s1 = s1/max(abs(s1)); %normieren

%filtern hier eigenen Algo, siehe SV07.pdf folie 47 u. 49
%s2 = sosfilt(IIR_1400_40dB, s1);
%s2 = mySOSfilt_matlab(IIR_1400_40dB, s1);
s2 = mySOSfilt(IIR_1400_40dB, s1); 

s2 =s2/max(abs(s2)); % normieren

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


