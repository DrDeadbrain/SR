%2.2 Faltungsecho (Convolutional delay)

%------------------------------------------
%         Position  Echohöhe
%         [sec]
Echos =  [ 0.0       1.0;
           0.3       0.3;
           0.5       0.2;
           0.7       0.1;
           0.75      0.1];
       
play_sound = true;

%load gitriff.wav
inputSignal = 'C:\Users\Christian\Desktop\Uni\Vorlesung_Signalverarbeitung\3_Laborübung\LÜ02\GitRiff.wav'; 
[y, inputFS] = audioread(inputSignal);
gitRaffAudio = audioplayer(y, inputFS); %to use playblocking()

sampleFrequenz = inputFS;

% Berechnung der Faltungsmaske Es wird bestimmt wie lang das Echo sein
% soll. Die Laenge ergibt sich aus dem hoechsten Wert(Sekunden) im Echo
% Array * 22050 (angenommene Abtastrate). Es wird angenommen, dass das Echo
% array in aufsteigender Form sortiert ist (hoechster Sekundenwert an
% letzer Pos.)

lengthOfEcho = fix(Echos(end, 1) * sampleFrequenz);

echoSignal = zeros(lengthOfEcho, 1);

for i = 1:size(Echos, 1)
    pos = round(Echos(i, 1) * sampleFrequenz + 1); %subscript error when not using round
    echoSignal(pos, :) = Echos(i, 2);
end

%Faltung mit library function conv()
tic
outputSignal = conv(y, echoSignal);
fprintf('Laufzeit von conv(): %d Sekunden\n', toc);
outputNormalized = normalize(outputSignal);

%Abspielen der ungefilterten Datei
if play_sound
    playblocking(gitRaffAudio);
end

%Abspielen des EchoSignals
if play_sound
    playblocking(audioplayer(outputNormalized, sampleFrequenz));
end

