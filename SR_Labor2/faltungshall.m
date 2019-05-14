useMyConv = false;
play_sound = true;
%load gitriff.wav
inputSignal = 'C:\Users\Christian\Desktop\Uni\Vorlesung_Signalverarbeitung\3_Labor�bung\L�02\GitRiff.wav'; 
[y, inputFS] = audioread(inputSignal);
gitRaffAudio = audioplayer(y, inputFS); %to use playblocking()

% if play_sound
%     playblocking(gitRaffAudio);
% end

%load trigRoom.wav
responseSignal = 'C:\Users\Christian\Desktop\Uni\Vorlesung_Signalverarbeitung\3_Labor�bung\L�02\Church2.wav';
[yTrig, responseFS] = audioread(responseSignal);
responseAudio = audioplayer(yTrig, responseFS);

% if play_sound
%     playblocking(responseAudio);
% end

%Absch�tzen der durchzuf�hrenden Multiplikationen bei der Faltung
%
%Samples in inputSignal x samples in impulseResponse = multiplications

%Vergleich der Abtastraten
fprintf('Input Sample Rate: %d\n', inputFS);
fprintf('Response Sample Rate: %d\n', responseFS);

%Sampleraten sind gleich, Abtastraten m�ssen nicht angepasst werden
%Filesize
sizeGitRiff = size(y,1);
sizeTrig = size(yTrig,1);


%Umwandlung Stereo -> Mono mit eigener Funktion
responseMono = stereoToMono(yTrig);
%L�nge der Signale

inputLength = length(y);
fprintf('Length of input signal: %d\n', inputLength);
responseLength = length(responseMono);
fprintf('length of response signal: %d\n', responseLength);

%Durchf�hrung der Faltung

if useMyConv
    %Faltung mit eigener Funktion
    tic 
    outputSignal = MyConv(y, responseMono);
    fprintf('Laufzeit von MyConv(): %f Sekunden \n', toc);
    outputNormalized = normalize(outputSignal);
else
    %Faltung mit library Funktion conv()
    tic
    outputSignal = conv(y, responseMono);
    fprintf('Laufzeit von conv(): %d Sekunden \n', toc);
    outputNormalized = normalize(outputSignal);
end

% Abspielen der ungefilterten Datei
if play_sound
    playblocking(gitRaffAudio);
end

%Abspielen der Systemantwort
if play_sound
    playblocking(audioplayer(outputSignal, responseFS));
end













