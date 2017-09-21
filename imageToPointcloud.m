%Image to mesh script
clc, clear ,close all

tic

imagename = '2017-09-12_Brian_temp_b.JPG';

%imageCleanup(imagename,1);

orientation = 'P'; %L = landscape, P = portrait
%edgeMatching(imagename,orientation,1);

%edgeTriangulation(imagename,1);

toc

%
pointcloud = pcread(['pointCloud_',imagename,'clean.ply']);
pcshow(pointcloud)
[gx,gy,gz,H] = surfaceCurvature(imagename,pointcloud,0);

load(['matched_edges_(',imagename,').mat'])
load(['cleaned_up_image_(',imagename,').mat'])

pixels = [333         477; %temporary, so I don't have to repeatedly select 
        1055         499;
        1062        1323]
    
%pixels = selectPixels(Icrop,3)
xyz = pixelToXYZ(pixels,matched_cam_edges,vertices)

surface = stlread(['pointSurface_',imagename,'.stl']);
%calculate distance from points to tri-mesh using point2trimesh.m
[distances,surface_points] = point2trimesh(surface, 'QueryPoints', xyz);

figure, surf(-gx,gy,-gz,H,'facecolor','interp')
hold on
scatter3(-xyz(:,1),xyz(:,2),-xyz(:,3),'o')
scatter3(-surface_points(:,1),surface_points(:,2),-surface_points(:,3),'o','r')

point_2_pointcloud_avg = mean(abs(distances)) 

