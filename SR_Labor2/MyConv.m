function [outputSignal] = MyConv(x,y)
%implementation of convolution operation
% 2 input vectors -> input signal
%                 -> impulse response
% Output : resulting signal from convolving the two inputs

outputLength = length(x) + length(y) -1;
outputSignal = zeros(outputLength, 1);

inputPad = outputLength - length(x);
X = [x; zeros(inputPad,1)];

responsePad = outputLength - length(y);
Y = [y; zeros(responsePad,1)];
%FOR Loop to put the result of convolution between X and Y vectors 
%in a new vector OUT. According to the convolution operation
%characteristics, the length of  a resultant vector of convolution
%operation between two vector is the sum of vectors length - 1

    %FOR Loop to walk through the vector X and Y
for i = 1: outputLength
    for j = 1: length(y)
        outputSignal(i) = outputSignal(i) + X(j) * Y(j);
    end
end
end



