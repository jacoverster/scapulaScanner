% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 4298.031786147734238 ; 4315.694959879070666 ];

%-- Principal point:
cc = [ 1798.421391766623174 ; 1210.318390282287282 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.082640235687495 ; 0.026310833872703 ; 0.003181960496671 ; 0.002010113782542 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 91.461819538159205 ; 91.391335068137522 ];

%-- Principal point uncertainty:
cc_error = [ 15.504430924213231 ; 13.061172796433581 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.020296347356644 ; 0.267445272199253 ; 0.000721502597220 ; 0.000825941131591 ; 0.000000000000000 ];

%-- Image size:
nx = 3456;
ny = 2304;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 10;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ -2.126785e+00 ; -2.216772e+00 ; 1.307119e-03 ];
Tc_1  = [ -1.075365e+02 ; -7.645272e+01 ; 5.081339e+02 ];
omc_error_1 = [ 2.587660e-03 ; 2.643881e-03 ; 5.267978e-03 ];
Tc_error_1  = [ 1.833871e+00 ; 1.549736e+00 ; 1.077075e+01 ];

%-- Image #2:
omc_2 = [ -2.096110e+00 ; -2.190657e+00 ; 2.491641e-02 ];
Tc_2  = [ -9.793948e+01 ; -8.526946e+01 ; 5.220380e+02 ];
omc_error_2 = [ 2.707801e-03 ; 2.760022e-03 ; 5.260978e-03 ];
Tc_error_2  = [ 1.879900e+00 ; 1.589471e+00 ; 1.100528e+01 ];

%-- Image #3:
omc_3 = [ -2.136516e+00 ; -2.241886e+00 ; 1.166529e-01 ];
Tc_3  = [ -9.840159e+01 ; -8.332818e+01 ; 5.259699e+02 ];
omc_error_3 = [ 2.604872e-03 ; 2.512412e-03 ; 5.646271e-03 ];
Tc_error_3  = [ 1.886618e+00 ; 1.590683e+00 ; 1.104677e+01 ];

%-- Image #4:
omc_4 = [ 2.066123e+00 ; 2.243434e+00 ; 1.946438e-01 ];
Tc_4  = [ -9.080850e+01 ; -8.608341e+01 ; 4.926547e+02 ];
omc_error_4 = [ 2.722698e-03 ; 2.884261e-03 ; 5.892601e-03 ];
Tc_error_4  = [ 1.791905e+00 ; 1.504041e+00 ; 1.043416e+01 ];

%-- Image #5:
omc_5 = [ 2.324967e+00 ; 1.990877e+00 ; 1.350052e-01 ];
Tc_5  = [ -1.109703e+02 ; -6.267110e+01 ; 5.160281e+02 ];
omc_error_5 = [ 2.954796e-03 ; 2.597519e-03 ; 5.991261e-03 ];
Tc_error_5  = [ 1.877073e+00 ; 1.574440e+00 ; 1.091247e+01 ];

%-- Image #6:
omc_6 = [ 2.352777e+00 ; 2.058489e+00 ; -5.974196e-02 ];
Tc_6  = [ -1.166029e+02 ; -8.788345e+01 ; 5.402824e+02 ];
omc_error_6 = [ 2.597966e-03 ; 2.584270e-03 ; 5.862999e-03 ];
Tc_error_6  = [ 1.954022e+00 ; 1.638758e+00 ; 1.143683e+01 ];

%-- Image #7:
omc_7 = [ 2.214431e+00 ; 2.113681e+00 ; 9.771870e-02 ];
Tc_7  = [ -1.037927e+02 ; -9.873506e+01 ; 5.313220e+02 ];
omc_error_7 = [ 2.834668e-03 ; 2.931411e-03 ; 5.789347e-03 ];
Tc_error_7  = [ 1.935515e+00 ; 1.618988e+00 ; 1.125771e+01 ];

%-- Image #8:
omc_8 = [ -2.199736e+00 ; -2.138889e+00 ; -1.429680e-01 ];
Tc_8  = [ -9.952027e+01 ; -1.010431e+02 ; 5.315023e+02 ];
omc_error_8 = [ 2.853652e-03 ; 2.771534e-03 ; 6.165830e-03 ];
Tc_error_8  = [ 1.938247e+00 ; 1.628322e+00 ; 1.129353e+01 ];

%-- Image #9:
omc_9 = [ 2.157175e+00 ; 2.144390e+00 ; 1.156775e-01 ];
Tc_9  = [ -1.007674e+02 ; -5.470462e+01 ; 4.799295e+02 ];
omc_error_9 = [ 2.777493e-03 ; 2.760294e-03 ; 5.570412e-03 ];
Tc_error_9  = [ 1.743153e+00 ; 1.464109e+00 ; 1.011402e+01 ];

%-- Image #10:
omc_10 = [ -2.129338e+00 ; -2.247492e+00 ; -8.925679e-02 ];
Tc_10  = [ -8.764252e+01 ; -7.918799e+01 ; 5.087295e+02 ];
omc_error_10 = [ 2.477653e-03 ; 2.724701e-03 ; 5.573447e-03 ];
Tc_error_10  = [ 1.847338e+00 ; 1.553411e+00 ; 1.081487e+01 ];

