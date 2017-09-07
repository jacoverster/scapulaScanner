%Image to mesh script
clc, clear ,close all

tic

imagename = '2017-09-05_flat3.JPG';

%imageCleanup(imagename,1);

orientation = 'L'; %L = landscape, P = portrait
%edgeMatching(imagename,orientation,1);

edgeTriangulation(imagename,1);

%pointcloud = pcread(['pointCloud_',imagename,'.ply']);
%surfaceCurvature(pointcloud)

toc
