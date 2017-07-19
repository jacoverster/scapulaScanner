% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 4795.682712452744454 ; 4801.028900001105285 ];

%-- Principal point:
cc = [ 1792.595757899102637 ; 1106.421464737648876 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.054849618608816 ; 0.040038888788240 ; -0.001352366416698 ; 0.001180278593792 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 43.323417516667462 ; 43.605035184351692 ];

%-- Principal point uncertainty:
cc_error = [ 17.934477831992499 ; 11.478176203705253 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.015104932410791 ; 0.158432073269792 ; 0.000857242297970 ; 0.001039695613940 ; 0.000000000000000 ];

%-- Image size:
nx = 3456;
ny = 2304;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 12;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ -2.213644e+00 ; -2.022976e+00 ; 1.172500e-01 ];
Tc_1  = [ -1.773802e+02 ; -6.206246e+01 ; 8.083972e+02 ];
omc_error_1 = [ 2.622717e-03 ; 2.477430e-03 ; 5.275078e-03 ];
Tc_error_1  = [ 3.002366e+00 ; 1.946626e+00 ; 7.354116e+00 ];

%-- Image #2:
omc_2 = [ -2.326057e+00 ; -2.050678e+00 ; 7.388745e-02 ];
Tc_2  = [ -1.895466e+02 ; -5.380539e+01 ; 8.193895e+02 ];
omc_error_2 = [ 2.994903e-03 ; 2.610026e-03 ; 6.135641e-03 ];
Tc_error_2  = [ 3.052808e+00 ; 1.975039e+00 ; 7.458559e+00 ];

%-- Image #3:
omc_3 = [ -2.144064e+00 ; -1.981459e+00 ; 3.168042e-01 ];
Tc_3  = [ -1.901071e+02 ; -5.618544e+01 ; 8.295516e+02 ];
omc_error_3 = [ 2.631993e-03 ; 2.312384e-03 ; 4.977663e-03 ];
Tc_error_3  = [ 3.079499e+00 ; 2.000201e+00 ; 7.364285e+00 ];

%-- Image #4:
omc_4 = [ -2.144780e+00 ; -1.983941e+00 ; 1.509959e-01 ];
Tc_4  = [ -1.908154e+02 ; -5.814550e+01 ; 7.980987e+02 ];
omc_error_4 = [ 2.504131e-03 ; 2.454976e-03 ; 4.891778e-03 ];
Tc_error_4  = [ 2.961650e+00 ; 1.926516e+00 ; 7.214332e+00 ];

%-- Image #5:
omc_5 = [ -2.123104e+00 ; -2.073393e+00 ; -1.458421e-01 ];
Tc_5  = [ -1.731859e+02 ; -6.025333e+01 ; 7.570783e+02 ];
omc_error_5 = [ 2.301315e-03 ; 2.767528e-03 ; 4.978290e-03 ];
Tc_error_5  = [ 2.829424e+00 ; 1.834239e+00 ; 6.966867e+00 ];

%-- Image #6:
omc_6 = [ -2.210495e+00 ; -2.159483e+00 ; -2.590326e-01 ];
Tc_6  = [ -1.665157e+02 ; -5.896263e+01 ; 7.309475e+02 ];
omc_error_6 = [ 2.348731e-03 ; 2.729331e-03 ; 5.555737e-03 ];
Tc_error_6  = [ 2.755361e+00 ; 1.775497e+00 ; 6.660756e+00 ];

%-- Image #7:
omc_7 = [ -2.238848e+00 ; -2.091218e+00 ; 4.116209e-01 ];
Tc_7  = [ -1.633637e+02 ; -5.981137e+01 ; 8.078005e+02 ];
omc_error_7 = [ 2.685028e-03 ; 2.042897e-03 ; 5.491684e-03 ];
Tc_error_7  = [ 2.999525e+00 ; 1.940861e+00 ; 7.151876e+00 ];

%-- Image #8:
omc_8 = [ -2.258043e+00 ; -2.046536e+00 ; 2.616254e-01 ];
Tc_8  = [ -1.715821e+02 ; -4.589169e+01 ; 7.812894e+02 ];
omc_error_8 = [ 2.619923e-03 ; 2.244491e-03 ; 5.355477e-03 ];
Tc_error_8  = [ 2.896688e+00 ; 1.878568e+00 ; 7.042107e+00 ];

%-- Image #9:
omc_9 = [ -2.325549e+00 ; -1.990148e+00 ; 1.702341e-01 ];
Tc_9  = [ -1.828872e+02 ; -2.781296e+01 ; 7.885066e+02 ];
omc_error_9 = [ 2.722688e-03 ; 2.345724e-03 ; 5.491041e-03 ];
Tc_error_9  = [ 2.926345e+00 ; 1.899035e+00 ; 7.161851e+00 ];

%-- Image #10:
omc_10 = [ -2.185968e+00 ; -2.020282e+00 ; 4.345878e-01 ];
Tc_10  = [ -1.800471e+02 ; -4.641004e+01 ; 7.861870e+02 ];
omc_error_10 = [ 2.713288e-03 ; 2.126948e-03 ; 5.109179e-03 ];
Tc_error_10  = [ 2.919352e+00 ; 1.894694e+00 ; 6.882406e+00 ];

%-- Image #11:
omc_11 = [ -2.233959e+00 ; -2.075481e+00 ; 2.871855e-01 ];
Tc_11  = [ -1.889648e+02 ; -4.801225e+01 ; 7.626541e+02 ];
omc_error_11 = [ 2.619426e-03 ; 2.209844e-03 ; 5.319456e-03 ];
Tc_error_11  = [ 2.825713e+00 ; 1.840852e+00 ; 6.853703e+00 ];

%-- Image #12:
omc_12 = [ -2.298402e+00 ; -2.118852e+00 ; 1.348962e-01 ];
Tc_12  = [ -1.883380e+02 ; -3.927538e+01 ; 7.419478e+02 ];
omc_error_12 = [ 2.759916e-03 ; 2.495865e-03 ; 5.618164e-03 ];
Tc_error_12  = [ 2.758331e+00 ; 1.791476e+00 ; 6.753138e+00 ];

