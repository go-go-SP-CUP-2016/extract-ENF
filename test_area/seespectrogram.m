clear all ; close all;
fnames = dir('*.wav');
numfids = length(fnames);
winsize=1024;
nfft=512;
vals = cell(1,numfids);

thepath='./';
<<<<<<< HEAD
syntax='wav'
=======
syntax='wav';
>>>>>>> refs/remotes/origin/master
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
<<<<<<< HEAD
for i=1:numfids% different grid
    %value=1:10;
    %for knob=2.^value
        
=======
numfids = length(vals);
for i=1:numfids% different grid
    %value=1:10;
    %for knob=2.^value
        fname=cell2mat(fileList(i));
>>>>>>> refs/remotes/origin/master
        y=cell2mat(vals(i));
        Fs=cell2mat(fs(i));
        %spectrogram(y,512,120,1024,Fs);
        f=fir1(32,[59*2/Fs 61*2/Fs]);% filter at sample frequency 59~61
        f1=fir1(32,70*2/Fs,'low');%low pass filter for down sampling
        y_fil=conv(y,f,'same');% filter the raw fignal
        
        a=conv(y_fil,f1,'same');% low pass the original signal before downsampling
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
        imshow(abs(ss));
<<<<<<< HEAD
        title(fnames(i).name)
        filenames = strrep(fnames(i).name, '.wav', '.jpg');
=======
        title(fname)
        filenames = strrep(fname, '.wav', '.jpg');
>>>>>>> refs/remotes/origin/master
        saveas(fig,filenames);
        
        %     [row col]=find(ss>0.1);% get the interested points
        %     x=1:1:length(row);
        %     figure(3)
        %     plot(x,row);% ENF signal plot
        
        
        %figure(3)
        %imshow( abs(ss(1:1:end, :)) );
    %end
end
