% To calibrate the camera(projector) with this method everything should be
% on the same image.
% revised by alphashi (yuexinshi@gmail.com)
% 12/20/2012

if ~exist('Projector_3Dpoints_check')
   fprintf(1,'The 3D points cloud should be defined before.\n');
   fprintf(1,'Generate the calibration data');
   return;
end;


%% saving stuff to come back to this state but calibrated
copy_ind_active = ind_active;
copy_active_images = active_images;
copy_n_ima = n_ima;
n_points = size(ProjectedGrid_2dpoints_projectorFrame,2);


%% Merge all the points in one image and a set of points.  
XX = [];
xx = [];
for i=ind_active
    eval( ['x_' num2str(i) ' = ProjectedGrid_2dpoints_projectorFrame;']);
end

%% Calibrating

dont_ask = 0;
no_image = 1;

% Image size: (may or may not be available)
[ny nx] = size(I); %Get size of Projected Image
% nx = 768;
% ny = 1024;

go_calib_optim

%% Recovering
ind_active=copy_ind_active;
active_images=copy_active_images;
n_ima=copy_n_ima;


Projector_calibrated_check = 1;
%% cleanning the temporal variables
clear copy_ind_active copy_active_images copy_n_ima n_points;


%-- Projector parameters:
%%
fc_proj  = fc;
cc_proj = cc;
kc_proj = kc;
alpha_c_proj = alpha_c;
fc_error_proj  = fc_error;
cc_error_proj = cc_error;
kc_error_proj = kc_error;
alpha_c_error_proj = alpha_c_error;

est_fc_proj = est_fc;
est_dist_proj = est_dist;
est_alpha_proj = est_alpha;
center_optim_proj = center_optim;
nx_proj = nx;
ny_proj = ny;
active_images_proj = active_images;
ind_active_proj = ind_active;

% Position of the global structure wrt the projector:
eval(['T_proj = Tc_' num2str(ind_active(1)) ';' ]);
eval(['om_proj = omc_' num2str(ind_active(1)) ';']);
R_proj = rodrigues(om_proj);
T_error_proj = Tc_error_1;
om_error_proj = omc_error_1;

% Loading camera parameters
load Calib_Results alpha_c fc cc kc nx ny
alpha_c_cam = alpha_c;
fc_cam = fc;
cc_cam = cc;
kc_cam =kc;
nx_cam = nx;
ny_cam = ny;


% Restore Projector parameters

fc = fc_proj;
cc = cc_proj;
kc = kc_proj;
alpha_c = alpha_c_proj;
nx = nx_proj;
ny = ny_proj;
