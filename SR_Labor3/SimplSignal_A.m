%Aufgabe2 - implementation and test of DFT and compare with fft-lib
%function

%Signal 
s = [0 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1];
sLength = length(s);
step = 1/sLength;
t = 0 : step : 1  - step;

%calc with myDFT
[a, b] = myDFT(s);

%calc with fft lib function
s_fft = fft(s);

%extract coefficients
a_fft = real(s_fft);
b_fft = imag(s_fft);

%normalize
a_fft = a_fft / length(a_fft);
b_fft = b_fft / length(b_fft);


%%Plot

% Plot Results
x = linspace(1, length(s), length(s));
    subplot(3, 2, 1);
    stem(x, s);
    title('Signal');

subplot(3, 2, 3);
    stem(x, a);
    title('Coeffs for COS: a');

subplot(3, 2, 5);
    stem(x, b);
    title('Coeffs for SIN: b');
    
subplot(3, 2, 2);
    stem(x, s);
    title('Coeffs for SIN: b');

subplot(3, 2, 4);
    stem(x, a_fft);
    title('Coeffs for SIN: b');
   
subplot(3, 2, 6);
    stem(x, b_fft);
    title('Coeffs for SIN: b');
pause;

%%
%plot differences

subplot(2, 1, 1);
    stem(a - a_fft);
    title(strcat('Difference between myDFT and fft for a = max=', num2str(max(abs(a-a_fft)))));
    
subplot(2, 1, 2);
    stem(b - b_fft);
    title(strcat('Difference between myDFT and fft for b max=', num2str(max(abs(b - b_fft)))));
    
    
    
    
    
    
    
    
    




    
    
    
    
    
    
    
    
    
    
    
    