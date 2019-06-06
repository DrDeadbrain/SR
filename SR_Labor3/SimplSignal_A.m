%Aufgabe2 - implementation and test of DFT and compare with fft-lib
%function

%Signal 
s = [1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1];
sLength = length(s);
step = 1/sLength;
t = 0 : step : 1  - step;

%calc with myDFT
[A, B] = myDFT(s);

%calc with fft lib function
s_fft = fft(s);

complexSpec = ((A.^2)+(B.^2)).^0.5;

%%Plot

figure;
subplot(3, 1, 1);
    plot(t, s);
    title('original signal');
    xlabel(sprintf('t'));
    ylabel('Amplitude');
    
subplot(3, 1, 2);
    plot(A, 'r');
    hold on;
    plot(B, 'g');
    hold off;
    title('fft with myDFT()');
    xlabel(sprintf('f'));
    ylabel('Amplitude');
    legend('real', 'imaginary');
    
subplot(3, 1, 3);
    plot(complexSpec);
    title('fft with myDFT() - complex spectrum');
    xlabel(sprintf('f'));
    ylabel('Amplitude');
 
figure;
subplot(3, 1, 1);
    plot(t, s);
    title('original signal');
    xlabel(sprintf('t'));
    ylabel('Amplitude');

subplot(3, 1, 2);
    plot(abs(s_fft));
    title('fft with matlab lib');
    xlabel(sprintf('f'));
    ylabel('Amplitude');
    
subplot(3, 1, 3);
    plot(real(s_fft), 'r');
    hold on;
    plot(imag(s_fft), 'g');
    hold off;
    title('fft with matlab lib');
    xlabel('Amplitude');
    legend('real', 'imaginary');
    
    
    
    
    
    
    
    
    




    
    
    
    
    
    
    
    
    
    
    
    