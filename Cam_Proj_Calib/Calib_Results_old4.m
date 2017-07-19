% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 1682.367997901635363 ; 1682.033568734957953 ];

%-- Principal point:
cc = [ 970.189086883422078 ; 651.904741378960352 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.175704592680575 ; 0.208632062005385 ; -0.001185725459980 ; 0.002854608164068 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 17.085132325040458 ; 16.300532738155198 ];

%-- Principal point uncertainty:
cc_error = [ 9.268007862404833 ; 10.870990416540048 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.024795869468083 ; 0.206874961994083 ; 0.001238715574296 ; 0.001135535152091 ; 0.000000000000000 ];

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
omc_1 = [ 1.916698e+00 ; 1.764372e+00 ; 1.150942e-01 ];
Tc_1  = [ -1.382290e+02 ; -1.192723e+02 ; 5.666496e+02 ];
omc_error_1 = [ 5.193050e-03 ; 4.228980e-03 ; 5.908784e-03 ];
Tc_error_1  = [ 3.195996e+00 ; 3.610714e+00 ; 5.781596e+00 ];

%-- Image #2:
omc_2 = [ 2.220744e+00 ; 1.922304e+00 ; -9.420351e-02 ];
Tc_2  = [ -1.330974e+02 ; -1.040028e+02 ; 5.527484e+02 ];
omc_error_2 = [ 3.523814e-03 ; 3.640340e-03 ; 7.031889e-03 ];
Tc_error_2  = [ 3.074097e+00 ; 3.513787e+00 ; 5.567634e+00 ];

%-- Image #3:
omc_3 = [ 2.122317e+00 ; 1.880965e+00 ; -9.673186e-02 ];
Tc_3  = [ -1.322152e+02 ; -1.039816e+02 ; 5.653327e+02 ];
omc_error_3 = [ 3.887377e-03 ; 3.962941e-03 ; 6.570760e-03 ];
Tc_error_3  = [ 3.149185e+00 ; 3.586040e+00 ; 5.674922e+00 ];

%-- Image #4:
omc_4 = [ 2.170337e+00 ; 1.925357e+00 ; -1.627993e-01 ];
Tc_4  = [ -1.338491e+02 ; -1.040511e+02 ; 5.642477e+02 ];
omc_error_4 = [ 3.488128e-03 ; 3.879240e-03 ; 6.862572e-03 ];
Tc_error_4  = [ 3.127399e+00 ; 3.573781e+00 ; 5.668676e+00 ];

%-- Image #5:
omc_5 = [ 2.091488e+00 ; 1.888261e+00 ; -5.394521e-02 ];
Tc_5  = [ -1.252631e+02 ; -1.135046e+02 ; 5.663923e+02 ];
omc_error_5 = [ 4.089287e-03 ; 4.021301e-03 ; 6.513744e-03 ];
Tc_error_5  = [ 3.163350e+00 ; 3.590586e+00 ; 5.683542e+00 ];

%-- Image #6:
omc_6 = [ 1.882137e+00 ; 1.824290e+00 ; 1.288776e-01 ];
Tc_6  = [ -1.226093e+02 ; -1.417687e+02 ; 5.742427e+02 ];
omc_error_6 = [ 5.203414e-03 ; 4.372674e-03 ; 5.940010e-03 ];
Tc_error_6  = [ 3.239903e+00 ; 3.651283e+00 ; 5.845973e+00 ];

%-- Image #7:
omc_7 = [ 1.883829e+00 ; 1.806329e+00 ; 5.381634e-02 ];
Tc_7  = [ -1.270412e+02 ; -1.390773e+02 ; 5.855128e+02 ];
omc_error_7 = [ 5.004198e-03 ; 4.432836e-03 ; 5.965882e-03 ];
Tc_error_7  = [ 3.294846e+00 ; 3.711385e+00 ; 5.943564e+00 ];

%-- Image #8:
omc_8 = [ 1.868956e+00 ; 1.776671e+00 ; -8.251570e-02 ];
Tc_8  = [ -1.312417e+02 ; -1.333459e+02 ; 6.033087e+02 ];
omc_error_8 = [ 4.702610e-03 ; 4.579170e-03 ; 6.041984e-03 ];
Tc_error_8  = [ 3.377451e+00 ; 3.809756e+00 ; 6.077329e+00 ];

