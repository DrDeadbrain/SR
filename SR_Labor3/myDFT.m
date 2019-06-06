function [A, B] = myDFT(Signal)
sigLength = length(Signal); %M
%sigPeriod = 1;             %T = 1


%pre allocate space
A = zeros(1, sigLength);
B = zeros(1, sigLength);

t = 0 : 1/sigLength : 1 - 1/sigLength;

for f = 0 : sigLength - 1
    cos_f = cos(2*pi*(f)*t);
    sin_f = sin(2*pi*(f)*t);
    
    %A(f) = (1/sigLength) * sum(Signal.*cos_f); %elementwise multiplication
    %B(f) = -(1/sigLength) * sum(Signal.*sin_f); %and then taking the sum of it
    
    A(f+1) = sum(Signal.*cos_f);
    B(f+1) = -(sum(Signal.*sin_f));
end

