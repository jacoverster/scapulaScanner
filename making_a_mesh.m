clc, clear all, close all

addpath('/Users/jacoverster/Documents/My Documents/BME/SLS Software/Matlab toolboxes/Projector calibration')
addpath('/Users/jacoverster/Documents/My Documents/BME/SLS Software/Matlab toolboxes/Camera calibration')
addpath('/Users/jacoverster/Documents/MATLAB/mlStructuredLight')
addpath('/Users/jacoverster/Documents/MATLAB/Cam_Proj_Calib')

load('matched_edges.mat')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%For when using Cam_Proj_calib.mat instead of calib_cam_proj.mat
%load('calib_cam_proj.mat')
load('Cam_Proj_calib.mat')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

nx_cam = length(matched_cam_edges(1,:));
ny_cam = length(matched_cam_edges(:,1));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%

nx_proj = length(matched_proj_edges(1,:)); 
ny_proj = length(matched_proj_edges(:,1));

%Code from calibration_script.m (mlStructuredLight) - modified slightly
%('%%%' indicates my modifications)
% Determine mapping from projector pixels to optical rays.
% Note: Ideally, the projected images should be pre-warped to
%       ensure that projected planes are actually planar.

c = 1:nx_proj;
r = 1:ny_proj;
[C,R] = meshgrid(c,r);

%%% the first input for pixel2ray needed to be changed to match the
% formatting used in matched_proj_edges
np_pixel2ray_first_input = [matched_proj_edges(:) R(:)]';
np  = pixel2ray(np_pixel2ray_first_input,fc_proj,cc_proj,kc_proj,alpha_c_proj); %confirm that this is correct...
%%%above 'np' replaces the one below
%%%np  = pixel2ray([C(:) R(:)]',fc_proj,cc_proj,kc_proj,alpha_c_proj);
%%%translate the to camera space unsig XXc = Rc_ext * XX + Tc_ext from
%http://www.vision.caltech.edu/bouguetj/calib_doc/htmls/parameters.htmll

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%For when using Cam_Proj_calib.mat instead of calib_cam_proj.mat
%np = Rc_1_proj'*(np - Tc_1_proj*ones(1,size(np,2)));
np = R_proj'*(np - T_proj*ones(1,size(np,2)));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Np = zeros([ny_proj nx_proj 3]);
Np(:,:,1) = reshape(np(1,:),ny_proj,nx_proj);
Np(:,:,2) = reshape(np(2,:),ny_proj,nx_proj);
Np(:,:,3) = reshape(np(3,:),ny_proj,nx_proj);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%For when using Cam_Proj_calib.mat instead of calib_cam_proj.mat
%P = -Rc_1_proj'*Tc_1_proj; %This is the projector center (I think!?)
P = -R_proj'*T_proj; 
%I have confirmed that this is indeed the center of the Projector
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Estimate plane equations describing every projector column.
% Note: Resulting coefficient vector is in camera coordinates.
%%%%%%%%%%
%fitPlane.m tested and confirmed using an online calculator: 
%http://www.ambrsoft.com/TrigoCalc/Plan3D/Plane3D_.htm
%%%%%%%%%%
%%%Calculate the plane equation for every column 
%%%%%%%%%%%%%%%%%%%%INSERT NEW CODE BELOW
wPlaneCol = zeros(nx_proj,4);
for col = 1:nx_proj
   wPlaneCol(col,:) = ...
      fitPlane([P(1); Np(:,col,1)],[P(2); Np(:,col,2)],[P(3); Np(:,col,3)]);
   %figure(4); hold on;
   %plot3(Np(:,col,1),Np(:,col,3),-Np(:,col,2),'r-');
   %drawnow;
end


% Estimate plane equations describing every projector row.
% Note: Resulting coefficient vector is in camera coordinates.
%{
wPlaneRow = zeros(ny_proj,4);
for i = 1:ny_proj
   wPlaneRow(i,:) = ...
      fitPlane([P(1) Np(i,:,1)],[P(2) Np(i,:,2)],[P(3) Np(i,:,3)]);
   %figure(4); hold on;
   %plot3(Np(i,:,1),Np(i,:,3),-Np(i,:,2),'g-');
   %drawnow;
end
%}

% Compute optical rays for each camera pixel. - NEEDS EDITING TO CALCULATE
% CORRECTLY ACCORDING TO matched_cam_edges
%for i = 1:length(fc_cam) %%only one camera image
   c = 1:nx_cam;%%%{i};
   r = 1:ny_cam;%%%{i};
   [C,R] = meshgrid(c,r);
   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%For when using Cam_Proj_calib.mat instead of calib_cam_proj.mat
   %Nc = Rc_1_cam{1}*Rc_1_cam{1}'*pixel2ray([C(:) R(:)]'-1,fc_cam{1},cc_cam{1},kc_cam{1},alpha_c_cam{1});
   %Oc = Rc_1_cam{1}*Rc_1_cam{1}'*(-Tc_1_cam{1}) + Tc_1_cam{1};%%%{i} = {1}
   Oc = [0; 0; 0]; %this is when using own Cam_Proj_calib.mat
   Nc = pixel2ray([C(:) R(:)]'-1,fc_cam,cc_cam,kc_cam,alpha_c_cam);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%end
%%%
%Re-shape Nc
nc = Nc;
Nc = zeros([ny_cam nx_cam 3]);
Nc(:,:,1) = reshape(nc(1,:),ny_cam,nx_cam);
Nc(:,:,2) = reshape(nc(2,:),ny_cam,nx_cam);
Nc(:,:,3) = reshape(nc(3,:),ny_cam,nx_cam);
%%%
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
Old method: based on old version of edge_matching...
nx_proj = length(loc_proj_edges(1,:));
ny_proj = length(loc_proj_edges(:,1));
%%%PROJECTOR SPACE%%%
%Use this for the matched_cam_edges structureJLV 
c = 1:nx_proj;
r = 1:ny_proj;
[C,R] = meshgrid(c,r);
temp = loc_proj_edges'; %some magic to get the rows right
RR = R';
np_pixel2ray_first_input = [temp(:) RR(:)]';
np  = pixel2ray(np_pixel2ray_first_input,fc_proj,cc_proj,kc_proj,alpha_c_proj); %confirm that this is correct...

%np  = pixel2ray([C(:) R(:)]',fc_proj,cc_proj,kc_proj,alpha_c_proj);
%line above is commented out to ensure only number op projected columns are used, not all
%columns - should reduce computational time
np = Rc_1_proj'*(np - Tc_1_proj*ones(1,size(np,2)));
Np = zeros([ny_proj nx_proj 3]);
Np(:,:,1) = reshape(np(1,:),nx_proj,ny_proj)';
Np(:,:,2) = reshape(np(2,:),nx_proj,ny_proj)';
Np(:,:,3) = reshape(np(3,:),nx_proj,ny_proj)';
P = -Rc_1_proj'*Tc_1_proj;


% Estimate plane equations describing every projector column.
% Note: Resulting coefficient vector is in camera coordinates.
wPlaneCol = zeros(nx_proj,4);
for i = 1:nx_proj
   wPlaneCol(i,:) = ...
      fitPlane([P(1); Np(:,i,1)],[P(2); Np(:,i,2)],[P(3); Np(:,i,3)]);
   %figure(4); hold on;
   %plot3(Np(:,i,1),Np(:,i,3),-Np(:,i,2),'r-');
   %drawnow;
end

%Confirm planes go through center of projector as plotted by
%procamCalibDisplay.m and plot_planes_test.m

%%%CAMERA SPACE%%%
% Pre-compute optical rays for each camera pixel.
c = 1:nx_cam;
r = 1:ny_cam;
[C,R] = meshgrid(c,r);
temp2 = matched_cam_edges'; %some magic to get the rows right
RR = R';%some magic to get the rows right
nc_pixel2ray_first_input = [temp2(:) RR(:)]';
nc = Rc_1_cam{1}*Rc_1_cam{1}'*pixel2ray(nc_pixel2ray_first_input,fc_cam{1},cc_cam{1},kc_cam{1},alpha_c_cam{1});
Nc = zeros([ny_cam nx_cam 3]);
Nc(:,:,1) = reshape(nc(1,:),nx_cam,ny_cam)';
Nc(:,:,2) = reshape(nc(2,:),nx_cam,ny_cam)';
Nc(:,:,3) = reshape(nc(3,:),nx_cam,ny_cam)';
Oc = Rc_1_cam{1}*Rc_1_cam{1}'*(-Tc_1_cam{1}) + Tc_1_cam{1};
%}

% Reconstruct 3D points using intersection with illumination plane(s).
% Note: Reconstructs from all cameras in the first camera coordinate system.

%%%%%%%%%%
%intersectLineWithPlane.m tested and confirmed using an online caluclator:
%http://www.ambrsoft.com/TrigoCalc/Plan3D/PlaneLineIntersection_.htm
%%%%%%%%%%
vertices = zeros(ny_cam,nx_cam,3); 
colors   = zeros(ny_cam,nx_cam,3);
for y = 1:ny_cam
    for x = 1:nx_cam
        CamPixel = Nc(y,x,:);
        vertices(y,x,:) = intersectLineWithPlane(Oc,CamPixel(:),wPlaneCol(x,:)')';
        
        if ~isnan(matched_cam_edges(y,x))
            colors(y,x,1) = Rcam(y,matched_cam_edges(y,x));
            colors(y,x,2) = Gcam(y,matched_cam_edges(y,x));
            colors(y,x,3) = Bcam(y,matched_cam_edges(y,x));
        else
            colors(y,x,1) = NaN;
            colors(y,x,2) = NaN;
            colors(y,x,3) = NaN;
        end
    end
end

%Create a pointCloud class from points and color information
ptCloud = pointCloud(vertices,'Color',colors);
ptCloudValid = removeInvalidPoints(ptCloud); %remove invalid (NaN) points
ptCloudDenoise = pcdenoise(ptCloudValid) %This is a de-noise option
%other functions to consider: pcfitplane

% Display the point cloud with per-vertex color.
figure, pcshow(ptCloudDenoise)

%Save the pointCloud to a file:
%pcwrite(ptCloudValid,'myfirstpointcloudfrom matlab')

%more info about using pointclouds can be found at:
%http://www.geo.tuwien.ac.at/downloads/pg/pctools/publish/pointCloudIntro/html/pointCloudIntro.html
