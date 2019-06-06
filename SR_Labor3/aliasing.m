%Aufgabe 1 
%Aliasing - Diskrete Fouriertransformation

playsound = true;
fs = 10000; % Abtastfrequenz
Ts = 1/fs; %Abtastintervall

samplingRate = [10000, 6000];
freqVec = 500 : 500 : 4500;
t = 0 : Ts : 0.5-Ts;
wave = [];
periodPerFreq = 0.5;

for i = 1 : length(freqVec)
    tmp = cos(2 * pi * freqVec(i) * t);
    %wave = cat(2, wave, tmp);
    wave = [wave tmp];
    t = (i * 0.5) : Ts : (i * 0.5 + 0.5 - Ts); %shift wave 0.5 time units
end

tPlot = 0 : Ts : (length(freqVec)*0.5 - Ts);
subplot(3, 1, 1);
    plot(tPlot, wave);
    ylim([-1, 1]);
    title('original Signal - sampled at 10kHz');
    xlabel (sprintf ('Time in s/%d', fs));
    ylabel ('Amplitude');

if playsound
    playblocking(audioplayer(wave, fs));
end 

newFs = 6000; %change of sampling frequency
newTs = 1/newFs;

tNew = 0 : newTs : (length(freqVec)*0.5 - newTs);
waveNew = wave(1 : (5.0/3) : end); %10000kHz / 6000kHz = 5/3 -> takes only every 5/3 value of original wave (needs to be verified)

if playsound
    playblocking(audioplayer(waveNew, newFs));
end

subplot(3, 1, 2);
    plot(tNew, waveNew);
    %ylim([-1, 1]);
    title('sampled at 6kHz');
    xlabel (sprintf('Time in s/%d', newFs));
    ylabel ('Amplitude');
    
%using matlab resample function
[p, q] = rat(newFs/fs, 0.0001); %rational fraction aprox
resampledWave = resample(wave, p, q);

if playsound
    playblocking(audioplayer(resampledWave,newFs));
end

subplot(3,1,3);
    plot(tNew, resampledWave); 
    %ylim([-1,1]);
    title('resampled at 6kHz with resample function');
    xlabel (sprintf ('Time in s/%d', newFs));
    ylabel ('Amplitude');


    
    
    
    
    
    
    


