clear all;
[y,Fs] = audioread('./test.wav');
figure(1);
spectrogram(y,512,120,1024,Fs);
f=fir1(64,[59*2/Fs 61*2/Fs]);% filter at sample frequency 59~61
f1=fir1(64,70*2/Fs,'low');%low pass filter for down sampling
y_fil=conv(y,f,'same');% filter the raw fignal

figure(2);
spectrogram(y_fil,512,120,1024,Fs);
ss1=spectrogram(y_fil,512,120,1024,Fs);
figure(3);
ss1_im=abs(ss1(1:1:end,:));
imshow(ss1_im);
[row col]=find(max(ss1));% get the interested points
x=1:1:length(row);
figure(4)
plot(x,row);% ENF signal plot

a=conv(y_fil,f1,'same');% low pass the original signal before downsampling
yd=downsample(a,8,0);% dowmsample to around 125hz

Fs_d=Fs/8;% downsample rate

%figure(4)
%spectrogram(yd,1024/4,60,512*4,Fs/8);


%figure(2);
%spectrogram(yd,1024,60,512,Fs_d);% show sownsampled spectrogram
ss=spectrogram(yd,1024,60,512,Fs_d);

%figure(4)
%imshow( abs(ss(1:1:end,:)) );

[row col]=find(ss>0.1);% get the interested points
x=1:1:length(row);
%figure(3)
%plot(x,row);% ENF signal plot


