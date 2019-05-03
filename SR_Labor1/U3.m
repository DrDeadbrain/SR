% Wavedatei lesen --> y 
[y, Samplefrequenz] = audioread('Z:\win\Dokumente\MATLAB\LÜ01\LÜ01\GitRiff02.wav');
% Anzahl der Samples best.
FileSize = size(y, 1);

% Speicher für gefiltertes Signal anlegen
yDist = zeros(FileSize, 1);
yEcho = zeros(FileSize, 1);

%Normalisierung des Signals [-1 ... 1]
y_normiert = y/max(abs(y));

%Abfrage für Funktion
type = input('Enter a distortion type(tanh= 1, bendiksen = 2): ');
d = input('Enter a distortion strength: ');


%Distortion mit Ausgabe + Plot
yDist = GuitarDistortion(y(:,1), type, d);
yDist_norm = yDist/max(abs(yDist));

t = linspace(-1, 1, length(yDist_norm));
plot(t, yDist_norm);
%xlim([-1 1]);

%Audioausgabe
sound(y, Samplefrequenz);
pause(10)
sound(yDist_norm, Samplefrequenz);
pause(10);


%Delay (Echo)
yEcho = y(:,1);
delay = 6000;
feedback = 0.5;
for i = 1:(length(yEcho)-delay)
    yTemp = yEcho(i,1) * feedback;
    yEcho((i + delay),1) = yEcho(i + delay,1) + yTemp;
end

%sound(yEcho, Samplefrequenz);



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
