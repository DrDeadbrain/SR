%Aufgabe 3 -Untersuchung der DFT

numSamples = 256;
freq = 15.0;

t = 0 : numSamples - 1;

testFreq = [15 15.25 15.5 50];

for i = 1 : length(testFreq);
    sig = cos(2*pi*testFreq(i)*t/numSamples);
    Sig = fft(sig);
    %f = (0 : (length(sig)-1)) / length(sig);
    normSig = normalize(Sig);
    
figureName = sprintf('f = %d', testFreq(i));
figure('Name', figureName, 'NumberTitle', 'off');

subplot(3, 1, 1);
    plot(t, sig);
    title('original signal');
    xlabel(sprintf('t'));
    ylabel('Amplitude');
    
subplot(3, 1, 2);
    plot(t, real(Sig),'r');
    hold on;
    plot(t, imag(Sig), 'g');
    hold off;
    %title('Spektrum Sig - real');
    xlabel(sprintf('f'));
    ylabel('Amplitude');
    legend('real', 'imaginary');
    
%subplot(3, 1, 3);
 %   plot(t, imag(Sig));
  %  title('imaginary part of Sig');
   % xlabel(sprintf('f'));
    %ylabel('Amplitude');
    
subplot(3, 1, 3);
    plot(t, abs(Sig));
    title('abs value of Sig');
    xlabel(sprintf('f'));
    ylabel('Amplitude');
end