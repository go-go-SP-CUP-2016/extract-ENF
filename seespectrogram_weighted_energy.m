clear all ; close all;
fnames = dir('*.wav');
numfids = length(fnames);
winsize=1024;
nfft=512;
vals = cell(1,numfids);

thepath='./';
syntax='wav'
fileList = getAllFiles(thepath);
% fileList=cell2mat(fileList);
validIndex =strfind(fileList,syntax);
validIndex = not(cellfun('isempty', validIndex));
for iDir=find(validIndex)
    fileList=fileList(iDir);
end

for K = 1:length(fileList)
  [vals{K} fs{K}] = audioread(cell2mat(fileList(K)));
end
%%
for i=1:numfids% different grid
    %value=1:10;
    %for knob=2.^value
        
        y=cell2mat(vals(i));
        Fs=cell2mat(fs(i));
        %spectrogram(y,512,120,1024,Fs);
        
        f=fir1(1024,[49/Fs*2 51/Fs*2],'band');% filter at sample frequency 59~61
        f1=fir1(32,70*2/Fs,'low');%low pass filter for down sampling
        y_fil=filter(f,1,y);;% filter the raw fignal
        spectrogram(y_fil,10000,5,1600,1000);               
        s1=spectrogram(y_fil,10000,5,1600,1000);  % save spectrogram output
        a=conv(y_fil,f1,'same');% low pass the original signal before downsampling
        
        energy=abs(s1).*abs(s1);        
        f=linspace(1,Fs/2,size(energy,1));
        total_e=sum(energy(:,1:size(energy,2)));
        f_estimate=(f*energy)./total_e;
        
        
        yd=downsample(a,8,0);% dowmsample to around 125hz
        
        Fs_d=Fs/8;% downsample rate
        
        %figure(4)
        %spectrogram(yd,1024/4,60,512*4,Fs/8);
        winsize=2048;
        noverlap=floor(winsize*0.2);
        nfft=1024;
        %figure
        win=hann(winsize);
        spectrogram(y_fil,win,noverlap,nfft,Fs);
        ss=spectrogram(y_fil,win,noverlap,nfft,Fs);
        fig=figure
        
        ss=f_estimate;
        imshow(abs(ss));
        title(fnames(i).name)
        filenames = strrep(fnames(i).name, '.wav', '.jpg');
        saveas(fig,filenames);
        
        %     [row col]=find(ss>0.1);% get the interested points
        %     x=1:1:length(row);
        %     figure(3)
        %     plot(x,row);% ENF signal plot
        
        
        %figure(3)
        %imshow( abs(ss(1:1:end, :)) );
    %end
end
