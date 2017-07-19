% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 4424.742345345838658 ; 4371.804616389639705 ];

%-- Principal point:
cc = [ 1398.049273599292292 ; 1281.845176544050446 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.119262825879416 ; 0.381198435390664 ; 0.010115354536804 ; 0.008465521954053 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 367.475342741267468 ; 393.195101776368801 ];

%-- Principal point uncertainty:
cc_error = [ 272.302820976600970 ; 67.003040446982411 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.056514388626807 ; 0.451685305905654 ; 0.002935777189296 ; 0.005931227915973 ; 0.000000000000000 ];

%-- Image size:
nx = 3456;
ny = 2304;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 3;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ 2.140154e+00 ; 2.006016e+00 ; 5.396195e-01 ];
Tc_1  = [ -4.201117e+01 ; -7.675958e+01 ; 5.985441e+02 ];
omc_error_1 = [ 2.235746e-02 ; 1.628428e-02 ; 4.947887e-02 ];
Tc_error_1  = [ 3.739428e+01 ; 9.237752e+00 ; 5.304341e+01 ];

%-- Image #2:
omc_2 = [ 2.159482e+00 ; 2.028849e+00 ; 4.230016e-01 ];
Tc_2  = [ -4.714761e+01 ; -8.427436e+01 ; 6.140557e+02 ];
omc_error_2 = [ 1.779940e-02 ; 1.452553e-02 ; 4.155159e-02 ];
Tc_error_2  = [ 3.844030e+01 ; 9.489069e+00 ; 5.436822e+01 ];

%-- Image #3:
omc_3 = [ 2.150686e+00 ; 2.064230e+00 ; 6.587690e-01 ];
Tc_3  = [ -4.913580e+01 ; -9.535841e+01 ; 6.113334e+02 ];
omc_error_3 = [ 2.646086e-02 ; 1.403768e-02 ; 5.870598e-02 ];
Tc_error_3  = [ 3.821199e+01 ; 9.407514e+00 ; 5.342212e+01 ];

