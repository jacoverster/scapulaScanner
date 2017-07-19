% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 3933.254844144739764 ; 3944.452204212208017 ];

%-- Principal point:
cc = [ 1828.593303678807160 ; 1078.988206749236497 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.060598868061171 ; -0.204678142325209 ; -0.006606301323087 ; 0.000873519453755 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 145.616573895532468 ; 227.860133876219010 ];

%-- Principal point uncertainty:
cc_error = [ 283.729331879371614 ; 33.355480476374161 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.049258505507938 ; 0.527805673260455 ; 0.002445844618165 ; 0.006041880160985 ; 0.000000000000000 ];

%-- Image size:
nx = 3456;
ny = 2304;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 2;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ -1.917299e+00 ; -1.869987e+00 ; 6.973442e-01 ];
Tc_1  = [ -1.826696e+02 ; -7.528707e+01 ; 8.036127e+02 ];
omc_error_1 = [ 2.842985e-02 ; 2.188093e-02 ; 3.754871e-02 ];
Tc_error_1  = [ 5.353750e+01 ; 6.854467e+00 ; 4.574149e+01 ];

%-- Image #2:
omc_2 = [ -1.938724e+00 ; -2.057183e+00 ; 6.870510e-01 ];
Tc_2  = [ -1.757983e+02 ; -9.311725e+01 ; 7.910294e+02 ];
omc_error_2 = [ 2.446253e-02 ; 1.301770e-02 ; 4.266533e-02 ];
Tc_error_2  = [ 5.302137e+01 ; 6.741432e+00 ; 4.434615e+01 ];

