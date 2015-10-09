[y,Fs] = audioread('./Train_Grid_G_P1.wav');

%spectrogram(y,512,120,1024,Fs);
f=fir1(32,[49*2/Fs 51*2/Fs]);
f1=fir1(32,70*2/Fs,'low');
y_fil=conv(y,f1,'same');
yd=downsample(y_fil,8,0);
figure(4)
spectrogram(yd,1024/4,60,512*4,Fs/8);

a=conv(yd,f,'same');
figure(2);
spectrogram(a,1024/4,60,512*4,Fs/8);
ss=spectrogram(a,1024/4,60,512*4,Fs/8);

figure(3)
imshow( abs(ss(end:-1:1, :)) );
