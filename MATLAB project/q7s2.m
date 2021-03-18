[S,fs]=audioread("message.wav");
spectrogram(S,kaiser(2000,5),1000,2048,fs,'yaxis')