function XYZ = pixelToXYZ(pixel,matched_cam_edges,vertices)
% This function converts a pixel location to XYZ coordinates.
%
%Created by: Jaco Verster (versterrie@gmail.com)
%
%Inputs: pixel location: [row col]
%Output: XYZ coordinate for pixel.

%Clear the workspace variables and close everything
%clc, clear , close all
XYZ = zeros(3,1);
row = pixel(1);
col = pixel(2); %This is the value interpolated to

f = matched_cam_edges(row,:);
d = sort(abs(f-col));   
nearest = min(find(abs(col-f)==d(1)));
sec_nearest = max(find(abs(col-f)==d(2)));

%Load XYZ values from the pointcloud information
XYZ_nearest = vertices(row,nearest,:);
XYZ_sec_nearest = vertices(row,sec_nearest,:);

A = f(nearest);
B = col;
C = f(sec_nearest);

for i = 1:3
    XYZ(i) = XYZ_nearest(i)-(A-B)/(A-C)*(XYZ_nearest(i)-XYZ_sec_nearest(i));
end

