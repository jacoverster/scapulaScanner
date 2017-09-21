%latest work

%load matched egde data
load('matched_edges_(nic01.JPG).mat')

%convert vertices to Mx3 array
x = vertices(:,:,1);
y = vertices(:,:,2);
z = vertices(:,:,3);

x = x(:);
y = y(:);
z = z(:);

%select point from the pointcloud data
pts = [x(1:1000:40000),y(1:1000:40000),z(1:1000:40000)];

%load surface created using gridfit.m
surface = stlread('test2.stl') 

%calculate distance from points to tri-mesh using point2trimesh.m
[distances,surface_points] = point2trimesh(surface, 'QueryPoints', pts); 
figure, patch(surface,'FaceAlpha',.5); xlabel('x'); ylabel('y'); zlabel('z'); axis equal; hold on
      plot3M = @(XYZ,varargin) plot3(XYZ(:,1),XYZ(:,2),XYZ(:,3),varargin{:});
      plot3M(pts,'*r')
      plot3M(surface_points,'*k')
      plot3M(reshape([shiftdim(pts,-1);shiftdim(surface_points,-1);shiftdim(pts,-1)*NaN],[],3),'k')
mean(abs(distances)) 
%distance is quite high - this means the surface matched with gridfit in
%surfaceCurvature.m did not generate a great match

%select pixels on the image
load('cleaned_up_image_(nic01.JPG).mat')
imshow(Icrop)
pixels = [1,1; 211,211; 780,211; 1147,714];
XYZ = pixelToXYZ(pixels,matched_cam_edges,vertices); %this fn is now vectorised

%calculate distances from points to pointcloud vertices
[k,d] = dsearchn(vert,pts);
mean(abs(d))

%test d calc by adding some distance to the pts (z-coordinates)
pts(:,3) = pts(:,3)+10;