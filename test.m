%% Pointcloud rigid alignment
clear, clc, close all

imagename1 = '170407dB7.1.JPG';
imagename2 = '170407dB7.2.JPG';

ptCloud1 = pcread(['pointCloud_',imagename1,'.ply']);
ptCloud2 = pcread(['pointCloud_',imagename2,'.ply']);

figure(1), pcshow(ptCloud1)
xlabel('x'), ylabel('y'), zlabel('z')
hold on
pcshow(ptCloud2)

ptCloud1deN = pcdenoise(ptCloud1,'NumNeighbors',5);
ptCloud2deN = pcdenoise(ptCloud2,'NumNeighbors',20);
figure(2), pcshow(ptCloud1deN)
figure(3), pcshow(ptCloud2deN)

[tform,movingReg,rmse] = pcregrigid(ptCloud2deN,ptCloud1deN)

figure(4),
pcshow(ptCloud1deN)
xlabel('x'), ylabel('y'), zlabel('z')
hold on
pcshow(movingReg)

pcMerged = pcmerge(ptCloud1deN,movingReg,1)

pcwrite(pcMerged,'pointCloud_aligned_woodscap_w1_merged')
