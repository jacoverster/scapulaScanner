%Image to mesh script
clc, clear ,close all

tic

imagename = '2017_04_20Jaco3.JPG';

%imageCleanup(imagename,1);

orientation = 'P'; %L = landscape, P = portrait
%edgeMatching(imagename,orientation,1);

edgeTriangulation(imagename,1);

toc
