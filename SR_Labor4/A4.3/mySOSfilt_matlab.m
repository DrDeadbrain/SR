function signalFiltered = mySOSfilt_matlab(sosfilter, signalOriginal)
    Bs = sosfilter(:, 1:3); % Section numerator polynomials
    As = sosfilter(:, 4:6); % Section denominator polynomials
    numberOfSecondOrderSections = size(sosfilter);
    signalFiltered = signalOriginal;
    for i=1:numberOfSecondOrderSections
        signalFiltered = filter(Bs(i,:), As(i,:), signalFiltered); % Series sections
    end
end
