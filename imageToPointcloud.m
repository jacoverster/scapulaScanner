%Image to mesh script
clc, clear ,close all

tic

imagename = '2017-09-12_Brian_temp_b.JPG';

%imageCleanup(imagename,1);

orientation = 'P'; %L = landscape, P = portrait
edgeMatching(imagename,orientation,1);

edgeTriangulation(imagename,1);

pointcloud = pcread(['pointCloud_',imagename,'clean.ply']);
pcshow(pointcloud)
surfaceCurvature(pointcloud)

toc
