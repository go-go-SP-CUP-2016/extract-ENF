%   EE6641 ASAS Lab3: Spectrogram
%
%       starter.m
%
%   Created by Hao-Wei Lee, 2015.09

clear all; close all;



opt.useFunc = 1; % use built-in spectrogram function or not
opt.windowType = 'hann'; % rectwin, hann, or hamming etc.

D = 0.05;
overlap = 0.8;

if opt.useFunc, spectrogram = str2func('spectrogram');
else spectrogram = str2func('mySpectrogram'); end

window_gen = str2func( opt.windowType );

[sig, fs] = wavread('./hw1.wav');
win = window_gen( round(D*fs) ); %how many windows in a second

Nfft = power(2, ceil( log2(length(win)) )); %number of points(bins) in spectrogram
% Nfft = length(win);

S1 = spectrogram( sig(:, 1), win, round(length(win)*overlap), Nfft );
S2 = spectrogram( sig(:, 1), win, round(length(win)*overlap), Nfft/2 );
figure(1)
imshow( abs(S1(end:-1:1, :)) );
figure(2)
imshow( abs(S2(end:-1:1, :)) );
