clc, clear ,close all

addpath('/Users/jacoverster/Documents/My Documents/BME/SLS Software/Matlab toolboxes/mexopencv')
addpath('/Users/jacoverster/Documents/My Documents/BME/SLS Software/Matlab toolboxes/mexopencv/opencv_contrib')


im = im2double(imread('small2.jpg'));
figure, imshow(im)

im2 = FastNonLocalMeans3D(im,0.1);
%im2 = zeros(size(im));
%im2(:,:,1) = NLmeansfilter(im(:,:,1),5,2,10);
%im2(:,:,2) = NLmeansfilter(im(:,:,2),5,2,10);
%im2(:,:,3) = NLmeansfilter(im(:,:,3),5,2,10);

figure, imshow(im2)
toc

%implemenbt openCV in Matlab: download Xcode7, type 'mex -setup c++' and
%select complier - watch video at https://www.youtube.com/watch?v=BasC2jkgyaM&feature=youtu.be

%then look at fastNlMeansDenoisingColored openCV function