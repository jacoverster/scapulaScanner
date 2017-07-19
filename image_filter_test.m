%This script runs a selected image through a few different filters (mostly
%downloaded from Mathworks) in order to compare the differences
clc, clear all, close all

%Select the image for filtering
I = im2double(imread('color_corrected_canoncrop2.png'));

%NLMF 
%https://www.mathworks.com/matlabcentral/fileexchange/27395-fast-non-local-means-1d--2d-color-and-3d
disp('+ NLMF...')
addpath('/Users/jacoverster/Documents/My Documents/BME/SLS Software/Matlab toolboxes/toolbox_nlmeans_version2');
Options.kernelratio = 4;
Options.windowratio = 4;
Options.verbose = true;
Options.filterstrength = 0.1;

J=NLMF(I,Options);

%FastNonLocalMeans3D
%https://www.mathworks.com/matlabcentral/fileexchange/43901-fast-and-robust-nonlocal-means-denoising/content/FastNonLocalMeans3D.m
disp('+ FastNonLocalMeans3D...')
addpath('/Users/jacoverster/Documents/My Documents/BME/SLS Software/Matlab toolboxes/FastNonLocalMeans3D/')
tic
K = FastNonLocalMeans3D(I,0.1);
toc

%Filter with FastNonLocalMeans3D + NLMF
L = NLMF(K); %,Options);

figure,
subplot(2,2,1),imshow(I); title('Original image')
subplot(2,2,2),imshow(J); title('NLMF image')
subplot(2,2,3),imshow(K); title('FastNonLocalMeans3D image')
subplot(2,2,4),imshow(L); title('Double filtered image')

%Comments: from these results and some other pre-liminary testing it looks
%like NLMF provides similar results to FastNonLocalMeans3D but 2x better performance