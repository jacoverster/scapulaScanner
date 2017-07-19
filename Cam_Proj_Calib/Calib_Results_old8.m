% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 4596.829463544583632 ; 4600.047632082713790 ];

%-- Principal point:
cc = [ 1832.814102495580983 ; 1040.283919721070788 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.075002406069462 ; 0.051763893332953 ; -0.005826112018074 ; 0.004493923113941 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 18.250587016543772 ; 18.849282888933317 ];

%-- Principal point uncertainty:
cc_error = [ 29.020856766961188 ; 19.284098190982089 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.018973336499279 ; 0.213716364008915 ; 0.001124654714572 ; 0.001272172752780 ; 0.000000000000000 ];

%-- Image size:
nx = 3456;
ny = 2304;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 14;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ -1.846081e+00 ; -2.076723e+00 ; 1.178095e+00 ];
Tc_1  = [ -1.368324e+02 ; -7.157030e+01 ; 8.846029e+02 ];
omc_error_1 = [ 5.910015e-03 ; 3.082679e-03 ; 6.166064e-03 ];
Tc_error_1  = [ 5.451913e+00 ; 3.711777e+00 ; 3.361068e+00 ];

%-- Image #2:
omc_2 = [ NaN ; NaN ; NaN ];
Tc_2  = [ NaN ; NaN ; NaN ];
omc_error_2 = [ NaN ; NaN ; NaN ];
Tc_error_2  = [ NaN ; NaN ; NaN ];

%-- Image #3:
omc_3 = [ -1.870579e+00 ; -1.890140e+00 ; 9.138359e-01 ];
Tc_3  = [ -1.364733e+02 ; -6.218943e+01 ; 8.590929e+02 ];
omc_error_3 = [ 5.000617e-03 ; 3.287125e-03 ; 5.867103e-03 ];
Tc_error_3  = [ 5.243368e+00 ; 3.619352e+00 ; 3.468339e+00 ];

%-- Image #4:
omc_4 = [ NaN ; NaN ; NaN ];
Tc_4  = [ NaN ; NaN ; NaN ];
omc_error_4 = [ NaN ; NaN ; NaN ];
Tc_error_4  = [ NaN ; NaN ; NaN ];

%-- Image #5:
omc_5 = [ -1.804460e+00 ; -1.778469e+00 ; 9.960850e-01 ];
Tc_5  = [ -1.351132e+02 ; -6.056464e+01 ; 8.674658e+02 ];
omc_error_5 = [ 5.312232e-03 ; 3.398522e-03 ; 5.601458e-03 ];
Tc_error_5  = [ 5.300819e+00 ; 3.654756e+00 ; 3.431421e+00 ];

%-- Image #6:
omc_6 = [ -1.792990e+00 ; -1.985887e+00 ; 1.269087e+00 ];
Tc_6  = [ -1.193323e+02 ; -5.923420e+01 ; 8.809751e+02 ];
omc_error_6 = [ 6.158662e-03 ; 3.178328e-03 ; 5.887010e-03 ];
Tc_error_6  = [ 5.439812e+00 ; 3.695782e+00 ; 3.263752e+00 ];

%-- Image #7:
omc_7 = [ NaN ; NaN ; NaN ];
Tc_7  = [ NaN ; NaN ; NaN ];
omc_error_7 = [ NaN ; NaN ; NaN ];
Tc_error_7  = [ NaN ; NaN ; NaN ];

%-- Image #8:
omc_8 = [ 1.924600e+00 ; 2.291601e+00 ; -8.562472e-01 ];
Tc_8  = [ -1.716624e+02 ; -1.134017e+02 ; 8.057740e+02 ];
omc_error_8 = [ 2.674965e-03 ; 4.672087e-03 ; 7.256619e-03 ];
Tc_error_8  = [ 4.960760e+00 ; 3.366192e+00 ; 3.281915e+00 ];

%-- Image #9:
omc_9 = [ 1.907412e+00 ; 2.228178e+00 ; -1.077272e+00 ];
Tc_9  = [ -1.055791e+02 ; -8.505100e+01 ; 8.402381e+02 ];
omc_error_9 = [ 2.750915e-03 ; 4.661844e-03 ; 7.364289e-03 ];
Tc_error_9  = [ 5.217818e+00 ; 3.490164e+00 ; 3.234234e+00 ];

%-- Image #10:
omc_10 = [ NaN ; NaN ; NaN ];
Tc_10  = [ NaN ; NaN ; NaN ];
omc_error_10 = [ NaN ; NaN ; NaN ];
Tc_error_10  = [ NaN ; NaN ; NaN ];

%-- Image #11:
omc_11 = [ NaN ; NaN ; NaN ];
Tc_11  = [ NaN ; NaN ; NaN ];
omc_error_11 = [ NaN ; NaN ; NaN ];
Tc_error_11  = [ NaN ; NaN ; NaN ];

%-- Image #12:
omc_12 = [ NaN ; NaN ; NaN ];
Tc_12  = [ NaN ; NaN ; NaN ];
omc_error_12 = [ NaN ; NaN ; NaN ];
Tc_error_12  = [ NaN ; NaN ; NaN ];

%-- Image #13:
omc_13 = [ -1.854908e+00 ; -1.706904e+00 ; 9.872709e-01 ];
Tc_13  = [ -1.388869e+02 ; -6.588220e+01 ; 8.659302e+02 ];
omc_error_13 = [ 5.347519e-03 ; 3.306482e-03 ; 5.664746e-03 ];
Tc_error_13  = [ 5.288354e+00 ; 3.649012e+00 ; 3.428871e+00 ];

%-- Image #14:
omc_14 = [ -1.805059e+00 ; -2.003236e+00 ; 1.247418e+00 ];
Tc_14  = [ -1.314610e+02 ; -6.337615e+01 ; 8.931662e+02 ];
omc_error_14 = [ 6.118865e-03 ; 3.168315e-03 ; 5.957446e-03 ];
Tc_error_14  = [ 5.507423e+00 ; 3.750536e+00 ; 3.339823e+00 ];

