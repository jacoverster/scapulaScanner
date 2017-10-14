%Image to mesh script
clc, clear ,close all

tic

imagename = '2017-09-13_werner_0a.JPG';

%imageCleanup(imagename,1);

orientation = 'P'; %L = landscape, P = portrait
%edgeMatching(imagename,orientation,1);

%edgeTriangulation(imagename,1);

toc

%pause;
%%
pointcloud = pcread(['pointCloud_',imagename,'clean.ply']);
pcshow(pointcloud)
[gx,gy,gz,H,Pmax] = surfaceCurvature(imagename,pointcloud,0);

load(['matched_edges_(',imagename,').mat'])
load(['cleaned_up_image_(',imagename,').mat'])
    
pixels = selectPixels(Icrop,3)
xyz = pixelToXYZ(pixels,matched_cam_edges,vertices)
surface = stlread(['pointSurface_',imagename,'.stl']);

%calculate distance from points to tri-mesh using point2trimesh.m
[distances,surface_points] = point2trimesh(surface, 'QueryPoints', xyz);

figure, surf(-gx,gy,-gz,H,'facecolor','interp')
hold on
scatter3(-xyz(:,1),xyz(:,2),-xyz(:,3),'*','k')
scatter3(-surface_points(:,1),surface_points(:,2),-surface_points(:,3),'o','r')
title 'Gridfit surface and landmark locations'
xlabel('x'), ylabel('y'), zlabel('z')
axis equal

point_2_pointcloud_avg = mean(abs(distances)) 

stlwrite(['pointsOnSurface_',imagename,'.stl'],...
    surface_points(:,1),surface_points(:,2),surface_points(:,3))


%Extract Pmax location
[C,I] = max(Pmax(:));
[col_max,row_max] = ind2sub(size(Pmax),I);

    %plot x-z plane slice and y-z plane slice through Pmax
    figure, plot(gx,-gz(row_max,:))
    title 'x-z plane slice through Pmax'
    xlabel('x'), ylabel('z')
    axis equal
    
    figure, plot(gy,-gz(:,col_max))
    title 'y-z plane slice through Pmax'
    xlabel('y'), ylabel('z')
    axis equal
    
Pmax_point = [X(col_max,row_max) Y(col_max,row_max) gz(col_max,row_max)]
%}

