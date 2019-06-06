function [a, b] = myDFT(signal)
    M = length(signal); %M



    %pre allocate space
    a = zeros(1, M);
    b = zeros(1, M);

    n = 0:(M-1);

    for k = n
    % k+1 because matlab index starts at 1
     a(k+1) =  1/M * sum(signal .* cos(2 * pi *k / M * n));
     b(k+1) = -1/M * sum(signal .* sin(2 * pi *k / M * n));
    end
end

