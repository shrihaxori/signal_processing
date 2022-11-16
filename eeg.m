close all;
eegs = readmatrix('EEG.txt');
signal = eegs(1, 1:10000);
t = eegs(2, 1:10000);
plot(t, signal);
title("eeg in time domain");


%Define number of samples to take
fs = 10000;
f = 2500; %Hz

%Take fourier transform
fftSignal = fft(signal);

%apply fftshift to put it in the form we are used to (see documentation)
fftSignal = fftshift(fftSignal);

%Next, calculate the frequency axis, which is defined by the sampling rate
f = fs/2*linspace(-1,1,fs);

figure;
plot(f, abs(fftSignal));
title("EEG in f domain");