close all;
emg = readmatrix('EMG.txt');
signal = emg(:, 1)
time = linspace(0, 10, 30000);
plot(time, signal);
title("emg in time domain");

%Define number of samples to take
fs = 30000;
f = 1000; %Hz

%Take fourier transform
fftSignal = fft(signal);

%apply fftshift to put it in the form we are used to (see documentation)
fftSignal = fftshift(fftSignal);

%Next, calculate the frequency axis, which is defined by the sampling rate
f = fs/2*linspace(-1,1,fs);

figure;
plot(f, abs(fftSignal));
title("EMG in f domain");
