function s2 = mySOSfilt(sosfilter, s1)
    Bs = sosfilter(:,1:3); % Section numerator polynomials, die ersten 3 spalten pro zeile
    As = sosfilter(:,4:6); % Section denominator polynomials, die letzten 3 spalten pro zeile
    numberOfSecondOrderSections = size(sosfilter, 1); % 3 durchlufe, weil der SOS filter 3 zeilen hat
    %s2 = [s1; zeros(2, 1)];
    s2 = s1;
    for i = 1:numberOfSecondOrderSections
        a1 = As(i, 2);
        a2 = As(i, 3);
        b0 = Bs(i, 1);
        b1 = Bs(i, 2);
        b2 = Bs(i, 3);
        x1k = 0;
        x2k = 0;
        for k = 1:length(s2)
            s = s2(k);
            
            x1k1 = x2k; 
            x2k1 = -a2*x1k - a1*x2k + s; 
            g = +b0*x2k1 + b1*x2k + b2*x1k; 
            x1k = x1k1; % Verzgerungselement
            x2k = x2k1; % Verzgerungselement
            
            s2(k) = g;
        end
    end
end

