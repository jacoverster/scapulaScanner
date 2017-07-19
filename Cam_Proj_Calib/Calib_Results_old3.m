% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 3024.706177901227420 ; 3022.595802137035207 ];

%-- Principal point:
cc = [ 1735.946276455492352 ; 1173.474299858905624 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.172206059126945 ; 0.191375225197964 ; -0.000849253678727 ; 0.002192089436648 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 11.581669097388131 ; 11.711521342993137 ];

%-- Principal point uncertainty:
cc_error = [ 8.919398205067198 ; 7.215619226265619 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.008430568357634 ; 0.059513013970044 ; 0.000510183277247 ; 0.000565278770336 ; 0.000000000000000 ];

%-- Image size:
nx = 3456;
ny = 2304;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 9;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ 1.862016e+00 ; 1.749715e+00 ; 3.382266e-02 ];
Tc_1  = [ -1.278631e+02 ; -1.264177e+02 ; 5.766452e+02 ];
omc_error_1 = [ 2.042193e-03 ; 2.278669e-03 ; 2.958473e-03 ];
Tc_error_1  = [ 1.732173e+00 ; 1.368433e+00 ; 2.255551e+00 ];

%-- Image #2:
omc_2 = [ 1.920099e+00 ; 1.893298e+00 ; 3.242698e-01 ];
Tc_2  = [ -1.050453e+02 ; -1.300512e+02 ; 5.230311e+02 ];
omc_error_2 = [ 2.268369e-03 ; 2.004045e-03 ; 3.070080e-03 ];
Tc_error_2  = [ 1.580766e+00 ; 1.246454e+00 ; 2.125092e+00 ];

%-- Image #3:
omc_3 = [ 1.972888e+00 ; 1.852687e+00 ; -2.100909e-01 ];
Tc_3  = [ -1.384267e+02 ; -1.283127e+02 ; 5.814904e+02 ];
omc_error_3 = [ 1.757032e-03 ; 2.347001e-03 ; 3.206033e-03 ];
Tc_error_3  = [ 1.730544e+00 ; 1.379404e+00 ; 2.201484e+00 ];

%-- Image #4:
omc_4 = [ 1.934126e+00 ; 1.830407e+00 ; -1.785311e-01 ];
Tc_4  = [ -1.383085e+02 ; -1.280871e+02 ; 5.821413e+02 ];
omc_error_4 = [ 1.800597e-03 ; 2.361208e-03 ; 3.130440e-03 ];
Tc_error_4  = [ 1.735815e+00 ; 1.381163e+00 ; 2.212093e+00 ];

%-- Image #5:
omc_5 = [ 1.877849e+00 ; 1.795478e+00 ; -1.325534e-01 ];
Tc_5  = [ -1.382305e+02 ; -1.277480e+02 ; 5.829146e+02 ];
omc_error_5 = [ 1.862771e-03 ; 2.374900e-03 ; 3.030040e-03 ];
Tc_error_5  = [ 1.742460e+00 ; 1.383486e+00 ; 2.227939e+00 ];

%-- Image #6:
omc_6 = [ 1.761877e+00 ; 1.702819e+00 ; 8.576826e-02 ];
Tc_6  = [ -1.080191e+02 ; -1.173181e+02 ; 5.490453e+02 ];
omc_error_6 = [ 2.096886e-03 ; 2.296809e-03 ; 2.847300e-03 ];
Tc_error_6  = [ 1.648234e+00 ; 1.302296e+00 ; 2.160220e+00 ];

%-- Image #7:
omc_7 = [ 1.835077e+00 ; 1.704049e+00 ; -7.340480e-02 ];
Tc_7  = [ -1.264205e+02 ; -1.026522e+02 ; 5.786543e+02 ];
omc_error_7 = [ 1.972970e-03 ; 2.321317e-03 ; 2.932046e-03 ];
Tc_error_7  = [ 1.728902e+00 ; 1.375278e+00 ; 2.206390e+00 ];

%-- Image #8:
omc_8 = [ 2.041912e+00 ; 1.970157e+00 ; 1.366167e-01 ];
Tc_8  = [ -1.043330e+02 ; -1.073745e+02 ; 5.304336e+02 ];
omc_error_8 = [ 1.979329e-03 ; 1.856396e-03 ; 3.307999e-03 ];
Tc_error_8  = [ 1.593445e+00 ; 1.262654e+00 ; 2.122959e+00 ];

%-- Image #9:
omc_9 = [ 2.251437e+00 ; 2.016796e+00 ; 4.956215e-02 ];
Tc_9  = [ -9.885133e+01 ; -1.127083e+02 ; 5.173169e+02 ];
omc_error_9 = [ 1.794143e-03 ; 1.641329e-03 ; 3.782082e-03 ];
Tc_error_9  = [ 1.548086e+00 ; 1.233246e+00 ; 2.051666e+00 ];

