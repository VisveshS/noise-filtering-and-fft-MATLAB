[y,fs] = audioread('signal_5.wav');
my = (fft(y));
my(abs(my) < 1*mean(abs(my))) = 0;
z  = my.*2;
yo = abs(ifft(my));
subplot(3,1,1);
plot(yo);
subplot(3,1,2);
plot(abs(fft(y)));
subplot(3,1,3);
plot(abs(fft(yo)));
sound(y);
title('filtered');

