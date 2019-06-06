%Aufgabe2 - implementation and test of DFT and compare with fft-lib
%function

%Signal 
s = [1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1];
sLength = length(s);
step = 1/sLength;
t = 0 : step : 1  - step;

%calc with myDFT
[a, b] = myDFT(s);

%calc with fft lib function
s_fft = fft(s);

%extract coefficients
a_fft = real(s_fft);
b_fft = real(s_fft);

%normalize
a_fft = a_fft / length(a_fft);
b_fft = b_fft / length(b_fft);


%%Plot

% Plot Results
x = linspace(1, length(s), length(s));
    subplot(3, 1, 1);
    plot(x, s, 'bx', x, s, 'b');
    title('Signal');

subplot(3, 1, 2);
    plot(x, a ,'bx', x, a_fft ,'r+', x, a, 'b', x, a_fft, 'r');
    title('Coeffs for COS: a');
    legend('myDFT()', 'fft()');

subplot(3, 1, 3);
    plot(x, b ,'bx', x, b_fft ,'r+', x, b, 'b', x, b_fft, 'r');
    title('Coeffs for SIN: b');
    legend('myDFT()', 'fft()');

pause;

%%
%plot differences

subplot(2, 1, 1);
    plot(a - a_fft);
    title(strcat('Difference between myDFT and fft for a = max=', num2str(max(abs(a-a_fft)))));
    
subplot(2, 1, 2);
    plot(b - b_fft);
    title(strcat('Difference between myDFT and fft for b max=', num2str(max(abs(b - b_fft)))));
    
    
    
    
    
    
    
    
    




    
    
    
    
    
    
    
    
    
    
    
    