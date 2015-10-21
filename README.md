# extract-ENF
經過一些spectrogram 參數調整得出結果：

```
default setting:
winsize=1024;
nfft=512;
noverlap=floor(winsize*0.2);
win=hann(winsize);

ss=spectrogram(y_fil,win,noverlap,nfft,Fs);
```

1. 調整window size [512 1024 1536 2048]
512 --
<img src="./spectrum tune/winsize512.jpg" width="100%"/>
1024 --
<img src="./spectrum tune/winsize1024.jpg" width="100%"/>
1536 --
<img src="./spectrum tune/winsize1536.jpg" width="100%"/>
2048 --
<img src="./spectrum tune/winsize2048.jpg" width="100%"/>
在大window可以看到在主頻率以外的地方在時間上變化的比較明顯，也可以看出一些過渡的現象（頻率在不同時間上的變化）

2. 調整nfft 數量
512 --
<img src="./spectrum tune/nfft512.jpg" width="100%"/>
1024 --
<img src="./spectrum tune/nfft1024.jpg" width="100%"/>
1536 --
<img src="./spectrum tune/nfft1536.jpg" width="100%"/>
2048 --
<img src="./spectrum tune/nfft2048.jpg" width="100%"/>
不知道為什麼，nfft數量越大，可以看到的時間上的範圍越小