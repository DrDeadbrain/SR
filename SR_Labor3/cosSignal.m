%Aufgabe 3 -Untersuchung der DFT

M = 256;



FVec = [15 15.25 15.5 50];

for F = FVec
    %Generate signal
    t = 0 : M - 1;
    x = cos(2*pi*F*t/M);
    
    win = hann(M)';
    x = x .* win;
    
    
    
    %Perform fft
    X = fft(x);
    X = X / length(X);
    
    %plot real/imaginary

    subplot(4, 1, 1);
        stem(t, x);
        title('original signal');
        xlabel(sprintf('t'));
        ylabel('Amplitude');
    
    subplot(4, 1, 2);
        stem(t, real(X));
        title(strcat('Real (F=', num2str(F), ')'));
        axis([0 256 -inf inf]);
    
    subplot(4, 1, 3);
        %plot(t, imag(X), 'bx', t, imag(X), 'b');
        stem(t, imag(X));
        title(strcat('Imag (F=', num2str(F), ')'));
        axis([0 256 -inf inf]);

  subplot(4, 1, 4);
        %plot(t, abs(X), 'bx', t, abs(X), 'b');
        stem(t, abs(X));
        title(strcat('Abs (F=', num2str(F), ')'));
        axis([0 256 -inf inf]);
        
  pause;
end