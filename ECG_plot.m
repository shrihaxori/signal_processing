close all;
%Define number of samples to take
fs = 10000;
f = 2500; %Hz

%Define signal
%t = 0:1/fs:1-1/fs;
%signal = sin(2*pi*f*t);
Array=csvread('ECG.csv');
time = Array(:, 1);
noisy = Array(:, 2);
%signal = lowpass(noisy, 0.0001, f)
signal = smoothdata(noisy);

%Plot to illustrate that it is a sine wave
%plot(x,B,'-o',x,C,'-x')
plot(time, noisy);
title('ECG time domain unfiltered');

figure;
plot(time, signal);
title('ECG time domain filtered')
%Take fourier transform
fftSignal = fft(signal);

%apply fftshift to put it in the form we are used to (see documentation)
fftSignal = fftshift(fftSignal);

%Next, calculate the frequency axis, which is defined by the sampling rate
f = fs/2*linspace(-1,1,fs);

figure
plot(f, abs(fftshift(fft(noisy))))
title('ECG f-domain unfiltered')
%Since the signal is complex, we need to plot the magnitude to get it to
%look right, so we use abs (absolute value)
figure;
plot(f, abs(fftSignal));
title('ECG f-domain filtered');
xlabel('Frequency (Hz)');
ylabel('magnitude');


