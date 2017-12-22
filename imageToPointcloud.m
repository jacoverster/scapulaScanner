%imageToPointcloud
%
%This script calls all the required functions that convert a camera image
%to a pointcloud. The pointcloud post-processing is also done using this
%script.

clc, clear ,close all

tic %timer started

imagename = '2017-11-15_mia_0b.JPG';
orientation = 'P'; %L = landscape, P = portrait

imageCleanup(imagename,1);

edgeMatching(imagename,orientation,1);

edgeTriangulation(imagename,1);

toc %timer stopped

pause;
%% Pointcloud post processing:
pointcloud = pcread(['pointCloud_',imagename,'clean.ply']);
%pcshow(pointcloud)
[gx,gy,gz,H,Pmax] = surfaceCurvature(imagename,pointcloud,0);

load(['matched_edges_(',imagename,').mat'])
load(['cleaned_up_image_(',imagename,').mat'])

pixels = selectPixels(Icrop,3)
xyz = pixelToXYZ(pixels,matched_cam_edges,vertices)

%This alternative "xyz" can be used when pixels are already pre-selected or
%saved previously:
    %points = stlread(['pointsOnSurface_',imagename,'.stl'])
    %xyz = points.vertices

surface = stlread(['pointSurface_',imagename,'.stl']);

%calculate distance from points to tri-mesh using point2trimesh.m
[distances,surface_points] = point2trimesh(surface, 'QueryPoints', xyz);
%point2trimesh function available from: https://www.mathworks.com/...
%.../matlabcentral/fileexchange/...
%.../52882-point2trimesh------distance%C2%A0between-point-and-triangulated-surface

%Extract Pmax location
[Pmax_max,I] = max(Pmax(:))
%Pmax_min = min(Pmax(:)) used for setting caxis values
[row_max,col_max] = ind2sub(size(Pmax),I)
[X,Y] = meshgrid(gx,gy);
XZslice = [gx; -gz(row_max,:)];
Pmax_point = [X(row_max,col_max) Y(row_max,col_max) gz(row_max,col_max)]

createFigure(-gx, gy, -gz, H,...
    -surface_points(:,1), surface_points(:,2), -surface_points(:,3));
    %-xyz(:,1), xyz(:,2), -xyz(:,3),...
    %-Pmax_point(:,1), Pmax_point(:,2), -Pmax_point(:,3)
    
    %set plot axis limits
    xlim([min(-gx) max(-gx)])
    ylim([min(gy) max(gy)])
    
point_2_pointcloud_avg = mean(abs(distances)) 

stlwrite(['pointsOnSurface_',imagename,'.stl'],...
    surface_points(:,1),surface_points(:,2),surface_points(:,3))
    
%Distance from Pmax point to inferior angle mark
Dist = sqrt(sum((xyz(1,:)-Pmax_point).^2))

IA_col = find(gx <= (surface_points(1,1)+2) & gx > (surface_points(1,1)-2));
IA_row = find(gy <= (surface_points(1,2)+2) & gy > (surface_points(1,2)-2));
MB_col = find(gx <= (surface_points(2,1)+2) & gx > (surface_points(2,1)-2));
MB_row = find(gy <= (surface_points(2,2)+2) & gy > (surface_points(2,2)-2));
AA_col = find(gx <= (surface_points(3,1)+2) & gx > (surface_points(3,1)-2));
AA_row = find(gy <= (surface_points(3,2)+2) & gy > (surface_points(3,2)-2));

%plot x-z plane slice and y-z plane slice through Pmax
% figure, plot(gx,-gz(IA_row,:))
% title 'x-z plane slice through IA'
% xlabel('x'), ylabel('z')
% axis equal

% figure, plot(gx,-gz(MB_row,:))
% title 'x-z plane slice through MB'
% xlabel('x'), ylabel('z')
% axis equal

% figure, plot(gy,-gz(:,col_max))
% title 'y-z plane slice through Pmax'
% xlabel('y'), ylabel('z')
% axis equal
%}

%Show H value at IA, MB and AA
H_landmarks = [H(IA_row,IA_col); H(MB_row,MB_col); H(AA_row,AA_col)]