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

shifted_data = delayseq(y, 6000);
y_delayed =feedback( y + shifted_data, +1);
sound(y_delayed, Samplefrequenz);




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

