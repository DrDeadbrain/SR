%%Aufgabe 1 

%Aliasing - Diskrete Fouriertransformation

%%
%Parameter
FsVec = [10000, 6000];
freqVec = 500 : 500 : 4500;


for Fs = FsVec
    %%
    
    % Calc
    Ts = 1 / Fs;
    t = 0 : Ts : 0.5;
    
    %%
    %Build signal
    signal = zeros();
    for f = freqVec
        w = 2*pi*f;
        signal = [signal cos(w * t)];
    end
    
    %%
    %Play Signal
    pause;
    soundsc(signal, Fs);
end


    
    
    
    


