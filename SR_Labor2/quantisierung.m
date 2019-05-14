%2.3 Quantisierungsrauschen

play_sound = true;

Qsteps = [10, 20, 50, 100, 200, 500];
inputSignal = 'C:\Users\Christian\Desktop\Uni\Vorlesung_Signalverarbeitung\3_Laborübung\LÜ02\GitRiff.wav'; 
[y, inputFS] = audioread(inputSignal);


inputLength = length(y);
normalizedInput = normalize(y);

timeFrame = linspace(15000, 15400, 400);

for i = Qsteps
    
    %Quantisierung
    q = round (normalizedInput * i) / i;
    normalizedQ = normalize(q);
    
    figure
    subplot(4, 1, 1);
    plot(timeFrame, y(15000:15399), timeFrame, q(15000:15399));
    ylim ([-1, 1]);
    title(sprintf("Quantisierung mit %d steps", i));
    xlabel(sprintf("Time in s/%d", inputFS));
    ylabel("Amplitude");
    hold on;
    qError = y - q;
    subplot(4, 1, 2);
    plot(timeFrame, qError(15000:15399));
    ylim([-1, 1]);
    title("Max Quantisierungsfehler");
    xlabel(sprintf("Time in s/%d", inputFS));
    ylabel("Amplitude");
    hold on;
    
    fprintf('Maximaler Absoultwert: %f\n', max(abs(qError)));
    
    if play_sound
        qAudio = audioplayer(normalizedQ, inputFS);
        playblocking(qAudio);
    end
end
