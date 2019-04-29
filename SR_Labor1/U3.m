% Wavedatei lesen --> y 
[y, Samplefrequenz] = audioread('C:\Users\Christian\Desktop\Uni\Vorlesung_Signalverarbeitung\3_Laborübung\LÜ01\GitRiff02.wav');
% Anzahl der Samples best.
FileSize = size(y, 1);

% Speicher für gefiltertes Signal anlegen
yDist = zeros(FileSize, 1);

type = input('Enter a distortion type(tanh= 1, bendiksen = 2): ');
d = input('Enter a distortion strength: ');



yDist = GuitarDistortion(y, type, d);
sound(y, Samplefrequenz);
pause(10)
sound(yDist, Samplefrequenz);
%Delay (Echo)
%delayed_y = [zeros(6000, size(y,2)); y];
%echo = [y; delayed_y];
%sound(delayed_y, Samplefrequenz)


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

