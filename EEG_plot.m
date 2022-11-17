close all;
eegs = readmatrix('EEG.txt');
signal = eegs(1, 1:10000);
time = eegs(2, 1:10000);
plot(time, signal);
title("EEG varying with time (Time-Domain Analysis)");


%Defining number of samples to take
fs = 10000;
f = 2500; %Hz

%Taking fourier transform
fftSignal = fft(signal);

%Appyling fftshift to put it in the form we are used to, shifts the zero
%frequency component to the center of the graph
fftSignal = fftshift(fftSignal);

%Next, calculating the frequency axis, which is defined by the sampling rate
f = fs/2*linspace(-1,1,fs);

figure;
plot(f, abs(fftSignal));
title("EEG in Frequency domain");