% Wavedatei lesen --> y 
[y, Samplefrequenz] = audioread('C:\Users\Christian\Desktop\Uni\Vorlesung_Signalverarbeitung\3_Labor�bung\L�01\GitRiff02.wav');
% Anzahl der Samples best.
FileSize = size(y, 1);

% Speicher f�r gefiltertes Signal anlegen
yDist = zeros(FileSize, 1);

%Normalisierung des Signals [-1 ... 1]
y_normiert = y/max(abs(y));

%Abfrage f�r Funktion
%type = input('Enter a distortion type(tanh= 1, bendiksen = 2): ');
%d = input('Enter a distortion strength: ');


%Distortion mit Ausgabe
%yDist = GuitarDistortion(y, type, d);
%sound(y, Samplefrequenz);
%pause(10)
%sound(yDist, Samplefrequenz);


%Delay (Echo)

echo_delay = 0.2722; %in seconds
echo_delay_s = round(echo_delay*Samplefrequenz); % delay in samples
echo_gain = 0.1; % to control a linear gain of an echo
y_echoed = feedback(y, [zeros(echo_delay_s - 1, 1); y(echo_delay_s:end)]);
y_echoed_normiert = y_echoed/max(abs(y_echoed));
sound(y_echoed_normiert, Samplefrequenz);
mask = (-1 < x < 1);
plot(yDist(mask));

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

