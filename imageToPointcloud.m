%Image to mesh script
clc, clear ,close all

tic

imagename = 'nic01.JPG';

imageCleanup(imagename,1);

orientation = 'L'; %L = landscape, P = portrait
edgeMatching(imagename,orientation,1);

%edgeTriangulation(imagename,1);

toc
