function [gx,gy,gz,H] = surfaceCurvature(imagename,pointcloud,plot)
% This function calculates the surface curvature from a set of points
%Inputs: 
%   - imagename
%   - a pointcloud
%   - plot = 1/other - only produces plots if value is exactly 1
% 
%Created by: Jaco Verster (versterrie@gmail.com)
%

%Extract vertices data and convert to vector
x = double(pointcloud.Location(:,1)); %double included to keep gridfit happy
y = double(pointcloud.Location(:,2));
z = double(pointcloud.Location(:,3));

%Create a grid to match the surface using gridfit
gx = double(pointcloud.XLimits(1)):4:double(pointcloud.XLimits(2));
gy = double(pointcloud.YLimits(1)):4:double(pointcloud.YLimits(2));
gz = gridfit(x,y,z,gx,gy); %,'regularizer','springs','smoothness',[0.1 1]);

%after experimenting with the above variation I could not really beat the
%"out of the box performance of gridfit - decided to keep settings 'default'

%Calculate surface curvature of the fitted grid
[X,Y] = meshgrid(gx,gy);
[K,H,Pmax,Pmin] = surfature(X,Y,gz);

if plot == 1
    %Plot the surface and pointcloud to verify if a good fit was found
    figure
    colormap(hot(256));
    surf(-gx,gy,-gz); %mirror x and z coordinates to align
    camlight right;
    lighting phong;
    hold on
    scatter3(-x,y,-z,'.');
    title 'Gridfit surface and pointcloud data'
    xlabel('x'), ylabel('y'), zlabel('z')

    %plot the surface curvature
    figure
    surf(-X,Y,-gz,H,'facecolor','interp'); %mirror x and z coordinates to align
    title 'Surface curvature'
    xlabel('x'), ylabel('y'), zlabel('z')

    %calculate and plot surface normals
    figure
    surfnorm(X,Y,gz)
    title 'Surface normals'
    xlabel('x'), ylabel('y'), zlabel('z')
end

%write the gridfit data to an .stl mesh file
stlwrite(['pointSurface_',imagename,'.stl'],gx,gy,gz);


