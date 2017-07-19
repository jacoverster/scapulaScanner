% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 1682.375638138828890 ; 1682.041681504947292 ];

%-- Principal point:
cc = [ 970.186151898516755 ; 651.900394382435252 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.175706443512697 ; 0.208640336800196 ; -0.001185761526562 ; 0.002853138539526 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 17.084237595307613 ; 16.299670293212010 ];

%-- Principal point uncertainty:
cc_error = [ 9.267624418312819 ; 10.870441678784383 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.024795239440003 ; 0.206872741078511 ; 0.001238664297684 ; 0.001135482024027 ; 0.000000000000000 ];

%-- Image size:
nx = 1920;
ny = 1280;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 8;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ 1.916697e+00 ; 1.764373e+00 ; 1.150895e-01 ];
Tc_1  = [ -1.382280e+02 ; -1.192708e+02 ; 5.666531e+02 ];
omc_error_1 = [ 5.192766e-03 ; 4.228767e-03 ; 5.908557e-03 ];
Tc_error_1  = [ 3.195868e+00 ; 3.610535e+00 ; 5.781290e+00 ];

%-- Image #2:
omc_2 = [ 2.220743e+00 ; 1.922304e+00 ; -9.421047e-02 ];
Tc_2  = [ -1.330964e+02 ; -1.040014e+02 ; 5.527517e+02 ];
omc_error_2 = [ 3.523654e-03 ; 3.640179e-03 ; 7.031595e-03 ];
Tc_error_2  = [ 3.073973e+00 ; 3.513611e+00 ; 5.567338e+00 ];

%-- Image #3:
omc_3 = [ 2.122314e+00 ; 1.880962e+00 ; -9.673832e-02 ];
Tc_3  = [ -1.322143e+02 ; -1.039801e+02 ; 5.653358e+02 ];
omc_error_3 = [ 3.887192e-03 ; 3.962756e-03 ; 6.570475e-03 ];
Tc_error_3  = [ 3.149056e+00 ; 3.585858e+00 ; 5.674617e+00 ];

%-- Image #4:
omc_4 = [ 2.170335e+00 ; 1.925356e+00 ; -1.628106e-01 ];
Tc_4  = [ -1.338481e+02 ; -1.040496e+02 ; 5.642517e+02 ];
omc_error_4 = [ 3.487960e-03 ; 3.879069e-03 ; 6.862268e-03 ];
Tc_error_4  = [ 3.127276e+00 ; 3.573605e+00 ; 5.668379e+00 ];

%-- Image #5:
omc_5 = [ 2.091487e+00 ; 1.888261e+00 ; -5.395025e-02 ];
Tc_5  = [ -1.252621e+02 ; -1.135031e+02 ; 5.663954e+02 ];
omc_error_5 = [ 4.089083e-03 ; 4.021106e-03 ; 6.513479e-03 ];
Tc_error_5  = [ 3.163222e+00 ; 3.590405e+00 ; 5.683237e+00 ];

%-- Image #6:
omc_6 = [ 1.882136e+00 ; 1.824291e+00 ; 1.288749e-01 ];
Tc_6  = [ -1.226082e+02 ; -1.417672e+02 ; 5.742459e+02 ];
omc_error_6 = [ 5.203135e-03 ; 4.372456e-03 ; 5.939784e-03 ];
Tc_error_6  = [ 3.239772e+00 ; 3.651101e+00 ; 5.845660e+00 ];

%-- Image #7:
omc_7 = [ 1.883828e+00 ; 1.806330e+00 ; 5.381042e-02 ];
Tc_7  = [ -1.270402e+02 ; -1.390758e+02 ; 5.855164e+02 ];
omc_error_7 = [ 5.003922e-03 ; 4.432615e-03 ; 5.965649e-03 ];
Tc_error_7  = [ 3.294713e+00 ; 3.711201e+00 ; 5.943248e+00 ];

%-- Image #8:
omc_8 = [ 1.868954e+00 ; 1.776670e+00 ; -8.252036e-02 ];
Tc_8  = [ -1.312406e+02 ; -1.333442e+02 ; 6.033118e+02 ];
omc_error_8 = [ 4.702355e-03 ; 4.578933e-03 ; 6.041736e-03 ];
Tc_error_8  = [ 3.377313e+00 ; 3.809564e+00 ; 6.077003e+00 ];

