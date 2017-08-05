function surfaceCurvature(vertices)

%Extract vertices data and convert to vector
x = vertices(:,:,1);
y = vertices(:,:,2);
z = vertices(:,:,3);

x = x(:);
y = y(:);
z = z(:);

%Create a grid to match the surface using gridfit
gx = min(x):4:max(x);
gy = min(y):4:max(y);
gz = gridfit(x,y,z,gx,gy);

%Plot the surface and pointcloud to verify if a good fit was found
figure
colormap(hot(256));
surf(-gx,gy,-gz); %mirror x and z coordinates to align
camlight right;
lighting phong;
%line(x,y,z,'marker','.','markersize',4,'linestyle','none');
title 'Gridfit surface and pointcloud data'
xlabel('x'), ylabel('y'), zlabel('z')

%Calculate surface curvature of the fitted grid
[X,Y] = meshgrid(gx,gy);
[K,H,Pmax,Pmin] = surfature(X,Y,gz);

%plot the surface curvature
figure
surf(-X,Y,-gz,H,'facecolor','interp'); %mirror x and z coordinates to align
title 'Surface curvature'
xlabel('x'), ylabel('y'), zlabel('z')

%write the gridfit data to an .stl mesh file
stlwrite('test2.stl',gx,gy,gz)
