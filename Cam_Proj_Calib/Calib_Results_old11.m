% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 4889.605318525044822 ; 4896.454213114159757 ];

%-- Principal point:
cc = [ 1719.577152380899633 ; 1335.247160018118166 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.061393207557620 ; 0.081977622875462 ; 0.008813152631419 ; -0.001911117374202 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 40.349191061068773 ; 43.941345276953676 ];

%-- Principal point uncertainty:
cc_error = [ 33.117404359042645 ; 13.772546130923699 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.016860387383415 ; 0.190060835417155 ; 0.000950646380483 ; 0.001129191229495 ; 0.000000000000000 ];

%-- Image size:
nx = 3456;
ny = 2304;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 15;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ NaN ; NaN ; NaN ];
Tc_1  = [ NaN ; NaN ; NaN ];
omc_error_1 = [ NaN ; NaN ; NaN ];
Tc_error_1  = [ NaN ; NaN ; NaN ];

%-- Image #2:
omc_2 = [ NaN ; NaN ; NaN ];
Tc_2  = [ NaN ; NaN ; NaN ];
omc_error_2 = [ NaN ; NaN ; NaN ];
Tc_error_2  = [ NaN ; NaN ; NaN ];

%-- Image #3:
omc_3 = [ 2.165997e+00 ; 2.196600e+00 ; 4.891176e-01 ];
Tc_3  = [ -5.629826e+01 ; -9.740059e+01 ; 6.908518e+02 ];
omc_error_3 = [ 3.544962e-03 ; 2.332371e-03 ; 7.484265e-03 ];
Tc_error_3  = [ 4.735201e+00 ; 1.939290e+00 ; 5.997870e+00 ];

%-- Image #4:
omc_4 = [ -2.148760e+00 ; -2.250544e+00 ; -3.535668e-01 ];
Tc_4  = [ -1.075849e+02 ; -1.127907e+02 ; 7.082873e+02 ];
omc_error_4 = [ 2.454671e-03 ; 2.904283e-03 ; 7.251107e-03 ];
Tc_error_4  = [ 4.885847e+00 ; 2.004181e+00 ; 6.101084e+00 ];

%-- Image #5:
omc_5 = [ 2.129552e+00 ; 2.172311e+00 ; 4.988274e-01 ];
Tc_5  = [ -9.434630e+01 ; -1.117805e+02 ; 6.967421e+02 ];
omc_error_5 = [ 3.455336e-03 ; 2.463131e-03 ; 7.124125e-03 ];
Tc_error_5  = [ 4.806807e+00 ; 1.966486e+00 ; 6.143470e+00 ];

%-- Image #6:
omc_6 = [ NaN ; NaN ; NaN ];
Tc_6  = [ NaN ; NaN ; NaN ];
omc_error_6 = [ NaN ; NaN ; NaN ];
Tc_error_6  = [ NaN ; NaN ; NaN ];

%-- Image #7:
omc_7 = [ 2.109888e+00 ; 2.069188e+00 ; 3.386506e-01 ];
Tc_7  = [ -7.480469e+01 ; -9.476273e+01 ; 6.915937e+02 ];
omc_error_7 = [ 3.320926e-03 ; 2.876984e-03 ; 6.146478e-03 ];
Tc_error_7  = [ 4.758191e+00 ; 1.946374e+00 ; 6.209990e+00 ];

%-- Image #8:
omc_8 = [ 2.101847e+00 ; 1.988401e+00 ; 4.298936e-01 ];
Tc_8  = [ -1.494155e+02 ; -1.214063e+02 ; 7.877364e+02 ];
omc_error_8 = [ 3.382778e-03 ; 3.080555e-03 ; 6.301947e-03 ];
Tc_error_8  = [ 5.488659e+00 ; 2.236449e+00 ; 7.120434e+00 ];

%-- Image #9:
omc_9 = [ 2.043865e+00 ; 2.012236e+00 ; 7.946417e-01 ];
Tc_9  = [ -1.446612e+02 ; -1.334000e+02 ; 7.413966e+02 ];
omc_error_9 = [ 4.413808e-03 ; 2.950484e-03 ; 6.714056e-03 ];
Tc_error_9  = [ 5.166415e+00 ; 2.116088e+00 ; 6.817668e+00 ];

%-- Image #10:
omc_10 = [ 2.039825e+00 ; 2.041552e+00 ; 9.727017e-01 ];
Tc_10  = [ -1.045774e+02 ; -1.263456e+02 ; 7.351351e+02 ];
omc_error_10 = [ 5.236339e-03 ; 2.864538e-03 ; 6.941853e-03 ];
Tc_error_10  = [ 5.071885e+00 ; 2.088469e+00 ; 6.761336e+00 ];

%-- Image #11:
omc_11 = [ 2.031472e+00 ; 1.920410e+00 ; 5.739264e-01 ];
Tc_11  = [ -1.180339e+02 ; -1.339299e+02 ; 7.629528e+02 ];
omc_error_11 = [ 3.799540e-03 ; 3.354160e-03 ; 6.300910e-03 ];
Tc_error_11  = [ 5.295677e+00 ; 2.159725e+00 ; 6.970756e+00 ];

%-- Image #12:
omc_12 = [ 2.027367e+00 ; 1.754541e+00 ; 3.894704e-01 ];
Tc_12  = [ -1.235358e+02 ; -1.329551e+02 ; 7.326101e+02 ];
omc_error_12 = [ 3.474848e-03 ; 3.923365e-03 ; 5.913378e-03 ];
Tc_error_12  = [ 5.083767e+00 ; 2.067752e+00 ; 6.549061e+00 ];

%-- Image #13:
omc_13 = [ 2.222928e+00 ; 2.071361e+00 ; 1.097898e-01 ];
Tc_13  = [ -1.313905e+02 ; -1.095263e+02 ; 7.367698e+02 ];
omc_error_13 = [ 3.149065e-03 ; 3.055991e-03 ; 6.072987e-03 ];
Tc_error_13  = [ 5.078323e+00 ; 2.083779e+00 ; 6.641284e+00 ];

%-- Image #14:
omc_14 = [ 2.081640e+00 ; 2.130632e+00 ; 4.050758e-01 ];
Tc_14  = [ -6.150453e+01 ; -1.082261e+02 ; 6.807619e+02 ];
omc_error_14 = [ 3.379173e-03 ; 2.796096e-03 ; 6.428787e-03 ];
Tc_error_14  = [ 4.677913e+00 ; 1.914435e+00 ; 6.103901e+00 ];

%-- Image #15:
omc_15 = [ 2.030849e+00 ; 2.022706e+00 ; 5.250068e-01 ];
Tc_15  = [ -6.283848e+01 ; -1.007249e+02 ; 6.602893e+02 ];
omc_error_15 = [ 3.771065e-03 ; 3.139686e-03 ; 6.487560e-03 ];
Tc_error_15  = [ 4.536750e+00 ; 1.857214e+00 ; 5.975946e+00 ];

