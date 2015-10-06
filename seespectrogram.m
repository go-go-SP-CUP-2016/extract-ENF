[y,Fs] = audioread('C:\Users\John Li\Desktop\Grid_E\Power_recordings\Train_Grid_E_P1.wav');
figure(1);
spectrogram(y,512,120,1024,1000);
yd=downsample(y,8,0);
figure(2);
spectrogram(yd,128,60,512,125);
