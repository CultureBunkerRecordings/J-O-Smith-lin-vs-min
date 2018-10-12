N = 8;
Rp = 0.5;
Rs = 60;
Fs = 8192;
Fp = 2000/(fs/2);
Fc = 2200/ (fs/2);
Ns = 4096;

[B,A] = ellip(N, Rp,Rs,Fp);

%min phase
imp =  [1, zeros(1,Ns/2-1)];
h1 = filter(B,A,imp);
hmp = filter(B,A,[h1,zeros(1,Ns/2)]);

% linear;
h1r = fliplr(h1); % max phase;
hzp = filter(B,A,[h1r, zeros(1,Ns/2)]); %min*max

%%
for i = 1:20
    sound(hmp,Fs);
    pause(0.5);
    sound(hzp,Fs);
    pause(2);
end