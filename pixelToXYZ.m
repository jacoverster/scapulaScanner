function XYZ = pixelToXYZ(pixels,matched_cam_edges,vertices)
% This function converts a pixel location to XYZ coordinates.
%
%Created by: Jaco Verster (versterrie@gmail.com)
%
%Inputs: pixel location: [row col]
%Output: XYZ coordinate for pixel.

%Clear the workspace variables and close everything
%clc, clear , close all
XYZ = zeros(length(pixels),3);
row = pixels(:,1);
col = pixels(:,2); %This is the value interpolated to

for i = 1:length(pixels)
    f = matched_cam_edges(row(i),:);
    d = sort(abs(f-col(i)));
    nearest = min(find(abs(col(i)-f) == d(1)));
    sec_nearest = max(find(abs(col(i)-f) == d(2)));

    %Load XYZ values from the pointcloud information
    XYZ_nearest = vertices(row(i),nearest,:);
    XYZ_sec_nearest = vertices(row(i),sec_nearest,:);

    A = f(nearest);
    B = col(i);
    C = f(sec_nearest);

    for j = 1:3
       XYZ(i,j) = XYZ_nearest(j)-(A-B)/(A-C)*(XYZ_nearest(j)-XYZ_sec_nearest(j));
    end
end

