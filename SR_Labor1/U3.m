% Wavedatei lesen --> y 
[y, Samplefrequenz] = audioread('C:\Users\Christian\Desktop\Uni\Vorlesung_Signalverarbeitung\3_Laborübung\LÜ01\GitRiff02.wav');
% Anzahl der Samples best.
FileSize = size(y, 1);

% Speicher für gefiltertes Signal anlegen
yDist = zeros(FileSize, 1);

%Normalisierung des Signals [-1 ... 1]
y_normiert = y/max(abs(y));

%Abfrage für Funktion
type = input('Enter a distortion type(tanh= 1, bendiksen = 2): ');
d = input('Enter a distortion strength: ');


%Distortion mit Ausgabe + Plot
yDist = GuitarDistortion(y, type, d);
yDist_norm = yDist/max(abs(yDist));


plot(yDist);
xlim([-1 1]);
%Audioausgabe
sound(y, Samplefrequenz);
pause(10)
sound(yDist_norm, Samplefrequenz);
pause(10);


%Delay (Echo)

%n = 60000;
%delayed_signal = [zeros(n, size(y,2)); y];
%sound(delayed_signal,Samplefrequenz);

shifted_data = delayseq(y, 6000);
y_delayed =feedback( y + shifted_data, +1);
sound(y_delayed, Samplefrequenz);

%sound(full_sig, Samplefrequenz);
%echo_delay = 0.2722; %in seconds
%echo_delay_s = round(echo_delay*Samplefrequenz); % delay in samples
%echo_gain = 0.1; % to control a linear gain of an echo
%y_echoed =feedback(y, [zeros(echo_delay_s - 1, 1); y(echo_delay_s:end)]);
%disp(y_echoed);
%y_echoed_normiert = y_echoed/max(abs(y_echoed));
%sound(y_echoed_normiert, Samplefrequenz);






function yDist = GuitarDistortion(x, type, d)
    switch type
        case 1
          yDist = tanh(d*x);
        case 2
          z = d * x;
          yDist = -sign(-z) .* (1 - exp(sign(-z).*z));
        otherwise
          disp('Unknown Input')
    end
end

