% Select/save bounding box.
%Define variable
bounds = [];

%load the image
C = imread('cal_b.JPG');

%Initiate box selection
figure(10); clf;
imagesc(C); axis image off;
title('Select the bounding box'); drawnow;
[x,y] = ginput(2);
bounds = round([min(x) max(x) min(y) max(y)]);
hold on;
plot(bounds([1 2 2 1 1]),bounds([3 3 4 4 3]),'r.-'); 
hold off;



