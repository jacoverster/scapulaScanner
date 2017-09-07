function edgeTriangulation(imagename,savefile)
% This is the main triangulation algorithm for creating a pointcloid
% 
%Created by: Jaco Verster (versterrie@gmail.com)
%

%Clear the workspace variables and close everything
%clc, clear , close all

%imagename = '170411deB-P2.JPG';

disp('+++ edgeTriangulation initialized...')

%% Load all the required  toolbox paths and data 
disp('+ Loading data and toolboxes...')
%Paths for external toolboxes used:
%[1] Jean-Yves Bouguet, "Camera Calibration Toolbox for Matlab",
    %http://www.vision.caltech.edu/bouguetj/calib_doc/, and
%[2] G. Falcao, et al., "Projector-Camera Calibration Toolbox", 
    %http://code.google.com/p/procamcalib, 2009. In one folder.
addpath('/Users/jacoverster/Documents/MATLAB/Cam_Proj_Calib')

%[3] Douglas Lanman, "Structured Light for 3D Scanning",
    %http://mesh.brown.edu/byo3d/index.html
addpath('/Users/jacoverster/Documents/MATLAB/mlStructuredLight')

%Load camera-projector calibration values
load('Cam_Proj_calib.mat')

%Load edge data from edgeMatching.m
load(['matched_edges_(',imagename,').mat'])
%Load crop-boundary values for cleaned up image
load(['cleaned_up_image_(',imagename,').mat'])
%Note: 'bounds' variable format => [x1 x2 y1 y2]

%% Determine mapping from projector pixels to optical rays. 
if exist('Op') == 0 %Check if Op has be calculated for the camera before.
    disp('+ Computing plane equations for projected edges...')
    c = 1:nx_proj;
    r = 1:ny_proj;
    [C,R] = meshgrid(c,r);

    np  = pixel2ray([C(:) R(:)]',fc_proj,cc_proj,kc_proj,alpha_c_proj); 

    %%%translate to camera space unsig XXc = Rc_ext * XX + Tc_ext from
    %http://www.vision.caltech.edu/bouguetj/calib_doc/htmls/parameters.htmll
    np = R_proj'*(np - T_proj*ones(1,size(np,2)));

    %Reshape data to a matrix format that matches the Projector dimensions
    Np = zeros([ny_proj nx_proj 3]);
    Np(:,:,1) = reshape(np(1,:),ny_proj,nx_proj);
    Np(:,:,2) = reshape(np(2,:),ny_proj,nx_proj);
    Np(:,:,3) = reshape(np(3,:),ny_proj,nx_proj);

    %Calculate the center of the projector in camera coordinates
    Op = -R_proj'*T_proj; 
    save(['Cam_Proj_calib.mat'],'Np','Op','-append')
    
elseif exist('Np') == 1
    disp('+ Plane equations for projected edges computed previously...')
end
%% Estimate plane equations describing every projector column.
% Notes: 
% - Resulting coefficient vector is in camera coordinates.
% - fitPlane.m tested and confirmed using an online calculator: 
%   http://www.ambrsoft.com/TrigoCalc/Plan3D/Plane3D_.htm

%Estimate the plane equations describing every projector column 
wPlaneCol = zeros(nx_proj,4);
for col = 1:nx_proj
   wPlaneCol(col,:) = fitPlane(...
       [Op(1); Np(:,col,1)],[Op(2); Np(:,col,2)],[Op(3); Np(:,col,3)]);
   %figure(4); hold on;
   %plot3(Np(:,col,1),Np(:,col,3),-Np(:,col,2),'r-');
   %drawnow;
end

%Estimate the plane equations describing every projector row
wPlaneRow = zeros(ny_proj,4);
for i = 1:ny_proj
   wPlaneRow(i,:) = ...
      fitPlane([Op(1) Np(i,:,1)],[Op(2) Np(i,:,2)],[Op(3) Np(i,:,3)]);
   %figure(4); hold on;
   %plot3(Np(i,:,1),Np(i,:,3),-Np(i,:,2),'g-');
   %drawnow;
end

%% Compute optical rays for each camera pixel
if exist('Nc') == 0 %Check if Nc has be calculated for the camera before.
    disp('+ Computing ray-equations for camera pixels...')
    c = 1:nx_cam;
    r = 1:ny_cam;
    [C,R] = meshgrid(c,r);

    nc = pixel2ray([C(:) R(:)]'-1,fc_cam,cc_cam,kc_cam,alpha_c_cam);
    %%%not sure what this '-1' is for - Needs investigating

    %Re-shape Nc
    Nc = zeros([ny_cam nx_cam 3]);
    Nc(:,:,1) = reshape(nc(1,:),ny_cam,nx_cam);
    Nc(:,:,2) = reshape(nc(2,:),ny_cam,nx_cam);
    Nc(:,:,3) = reshape(nc(3,:),ny_cam,nx_cam);

    %Camera center
    Oc = [0; 0; 0];
    save(['Cam_Proj_calib.mat'],'Nc','Oc','-append')
    
elseif exist('Nc') == 1
    disp('+ Ray-equations for camera pixels computed previously...')
end

%% Reconstruct 3D points using intersection with illumination plane(s)
disp('+ Computing ray-plane intersections reconstructing 3D points...')
%%%%%%%%%%
%intersectLineWithPlane.m tested and confirmed using an online caluclator:
%http://www.ambrsoft.com/TrigoCalc/Plan3D/PlaneLineIntersection_.htm
%%%%%%%%%%
%Check if "I" (camera image) is landscape or portrait and select
%oppropriate reconstruction method
S_cam = size(I);

if S_cam(1) < S_cam(2) %Landscape method
    %Allocate memory
    vertices = zeros([size(matched_cam_edges),3]); 
    colours   = vertices;

    for y = 1:length(matched_cam_edges(:,1))
        for x = 1:length(matched_cam_edges(1,:))
            if ~isnan(matched_cam_edges(y,x))
                cam_x = bounds(1) + matched_cam_edges(y,x);
                cam_y = y + bounds(3) - 1;
                proj_x = matched_proj_edges(y,x);

                CamPixel = Nc(cam_y,cam_x,:);
                ProjPlane = wPlaneCol(proj_x,:)';

                vertices(y,x,:) = intersectLineWithPlane(...
                    Oc,CamPixel(:),ProjPlane)';
                colours(y,x,1) = Rcam(y,matched_cam_edges(y,x));
                colours(y,x,2) = Gcam(y,matched_cam_edges(y,x));
                colours(y,x,3) = Bcam(y,matched_cam_edges(y,x));
            else
                colours(y,x,1) = NaN;
                colours(y,x,2) = NaN;
                colours(y,x,3) = NaN;
            end
        end
    end

elseif S_cam(1) > S_cam(2) %Portrait method
    %Swop row and col for around when going from matched_cam_edges to Nc
    %because calibration was done in landscape while edge detection was
    %done in portrait mode
    %Explanation: [e_row, e_col] =/= [2304-e_col, e_row],
    %[1346:2484, 603:1732] =/= [2304-603:1732, 1346:2484]

    %Allocate memory
    vertices = zeros([size(matched_cam_edges),3]); 
    colours   = vertices;

    for y = 1:length(matched_cam_edges(:,1)) %bounds(3)&(4) in play
        for x = length(matched_cam_edges(1,:)):-1:1 %bounds(1)&(2) in play
            if ~isnan(matched_cam_edges(y,x))
                cam_row = ny_cam - (matched_cam_edges(y,x) + bounds(1));
                cam_col = y + bounds(3) - 1;
                proj_row = ny_proj - matched_proj_edges(y,x);
                CamPixel = Nc(cam_row,cam_col,:);
                ProjPlane = wPlaneRow(proj_row,:)';
                vertices(y,x,:) = intersectLineWithPlane(...
                    Oc,CamPixel(:),ProjPlane)';
                colours(y,x,1) = Rcam(y,matched_cam_edges(y,x));
                colours(y,x,2) = Gcam(y,matched_cam_edges(y,x));
                colours(y,x,3) = Bcam(y,matched_cam_edges(y,x));
            else
                colours(y,x,1) = NaN;
                colours(y,x,2) = NaN;
                colours(y,x,3) = NaN;
            end
        end
    end
end

%Make all zeo values = NaN
vertices(vertices==0) = NaN;

%% Display the point cloud
disp('+ Displaying point cloud...')

%Create a pointCloud class from points and color information
ptCloud = pointCloud(vertices,'Color',colours);
ptCloudValid = removeInvalidPoints(ptCloud); %remove invalid (NaN) points
ptCloudDenoise = pcdenoise(ptCloudValid,'NumNeighbors',25);

% Display the point cloud with per-vertex color.
%player = pcplayer(ptCloud.XLimits,ptCloud.YLimits,[480,560]);
%view(player,ptCloudDenoise)
figure(2), pcshow(ptCloudValid)
xlabel('x'), ylabel('y'), zlabel('z')

%% Save the pointCloud to a file:
disp('+ Saving data...')
if savefile == 1;
    pcwrite(ptCloudValid,['pointCloud_',imagename])
    save(['matched_edges_(',imagename,').mat'],'matched_cam_edges',...
        'matched_proj_edges','Rcam','Gcam','Bcam','vertices')
    display('Results SAVED.')
else
    display('Results were NOT saved.')
end

disp('++ edgeTriangulation done!')

%more info about using pointclouds can be found at:
%http://www.geo.tuwien.ac.at/downloads/pg/pctools/publish/pointCloudIntro/html/pointCloudIntro.html
