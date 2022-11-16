clear all
clc
close all

[filename, pathname] = uigetfile('ECG.csv', 'Open file .dat');
if isequal(filename, 0) || isequal(pathname, 0)   
    disp('File input canceled.');  
   ECG_Data = [];  
else
fid=fopen(filename,'r');
end;

time=10;  % duration of ecg signal
fs = 150; %sample frequency
 
f=fread(fid,2*fs*time,'ubit12');
len = length(f(1:2:length(f))); %length of the signal
time_step = 1/fs; 
max_time = len/fs; % duration of your signal in seconds depending on sampling rate
t = time_step:time_step:max_time;  % this is our time vector.

Orig_Sig=f(1:2:length(f))/len; %compute the clean ecg signal
subplot(4,1,1);
plot(t,Orig_Sig)


noise_coeff = 0.1;    %randomize the amplitude of the noisy ecg signal
noise_signal = 5*sin(2*pi*50*t);      %add 50Hz noise from power supply
noise_signal = noise_signal';           %transpose vector
dirty_signal = Orig_Sig + noise_coeff*noise_signal;  %mix the original ecg signal with the noisy 50 Hz sine

subplot(4,1,2);
plot(t,noise_signal);
subplot(4,1,3);
plot(t,dirty_signal);


NFFT = 2 ^ nextpow2(length(dirty_signal));  %compute FFT length depends on the signal length
Y = fft(dirty_signal,NFFT);  %compute the fft of the noisy signal
Y = Y(1:NFFT/2);  %we only need a one sided fft plot
Y_abs = 1/NFFT*abs(Y); %calculate the magnitude and normalize the spectrum
f_fft = (0:NFFT/2-1)*fs/NFFT; %scale the frequency axe and calculate the coresponding frequencys

subplot(4,1,4);
plot(f_fft,Y_abs);