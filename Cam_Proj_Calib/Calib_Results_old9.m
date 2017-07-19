% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 4596.810347271196406 ; 4599.834224942206674 ];

%-- Principal point:
cc = [ 1832.765327449259530 ; 1040.047934290896364 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.074712424605203 ; 0.050178357874509 ; -0.005828890937608 ; 0.004467258204166 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 18.317895182612165 ; 18.919041717699326 ];

%-- Principal point uncertainty:
cc_error = [ 29.129253135130426 ; 19.355542736375867 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.019042703552279 ; 0.214489749848934 ; 0.001129376059416 ; 0.001277430063132 ; 0.000000000000000 ];

%-- Image size:
nx = 3456;
ny = 2304;


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
omc_1 = [ -1.846067e+00 ; -2.076665e+00 ; 1.178145e+00 ];
Tc_1  = [ -1.368191e+02 ; -7.152651e+01 ; 8.845942e+02 ];
omc_error_1 = [ 5.931766e-03 ; 3.094219e-03 ; 6.189422e-03 ];
Tc_error_1  = [ 5.472229e+00 ; 3.725631e+00 ; 3.373510e+00 ];

%-- Image #2:
omc_2 = [ -1.805049e+00 ; -2.003178e+00 ; 1.247468e+00 ];
Tc_2  = [ -1.314476e+02 ; -6.333170e+01 ; 8.931556e+02 ];
omc_error_2 = [ 6.141413e-03 ; 3.180221e-03 ; 5.980042e-03 ];
Tc_error_2  = [ 5.527939e+00 ; 3.764525e+00 ; 3.352178e+00 ];

%-- Image #3:
omc_3 = [ -1.870568e+00 ; -1.890086e+00 ; 9.139088e-01 ];
Tc_3  = [ -1.364592e+02 ; -6.214564e+01 ; 8.590762e+02 ];
omc_error_3 = [ 5.018967e-03 ; 3.299410e-03 ; 5.889020e-03 ];
Tc_error_3  = [ 5.262860e+00 ; 3.632813e+00 ; 3.481171e+00 ];

%-- Image #4:
omc_4 = [ -1.854904e+00 ; -1.706856e+00 ; 9.873454e-01 ];
Tc_4  = [ -1.388720e+02 ; -6.583801e+01 ; 8.659108e+02 ];
omc_error_4 = [ 5.367144e-03 ; 3.318961e-03 ; 5.685991e-03 ];
Tc_error_4  = [ 5.307997e+00 ; 3.662568e+00 ; 3.441550e+00 ];

%-- Image #5:
omc_5 = [ -1.804455e+00 ; -1.778418e+00 ; 9.961544e-01 ];
Tc_5  = [ -1.350987e+02 ; -6.052044e+01 ; 8.674473e+02 ];
omc_error_5 = [ 5.331742e-03 ; 3.411323e-03 ; 5.622484e-03 ];
Tc_error_5  = [ 5.320517e+00 ; 3.668339e+00 ; 3.444108e+00 ];

%-- Image #6:
omc_6 = [ -1.792982e+00 ; -1.985859e+00 ; 1.269190e+00 ];
Tc_6  = [ -1.193186e+02 ; -5.918769e+01 ; 8.809469e+02 ];
omc_error_6 = [ 6.181571e-03 ; 3.190242e-03 ; 5.909403e-03 ];
Tc_error_6  = [ 5.459974e+00 ; 3.709493e+00 ; 3.275718e+00 ];

%-- Image #7:
omc_7 = [ 1.907434e+00 ; 2.228176e+00 ; -1.077336e+00 ];
Tc_7  = [ -1.055679e+02 ; -8.501030e+01 ; 8.402326e+02 ];
omc_error_7 = [ 2.761437e-03 ; 4.678809e-03 ; 7.392301e-03 ];
Tc_error_7  = [ 5.237281e+00 ; 3.503224e+00 ; 3.246181e+00 ];

%-- Image #8:
omc_8 = [ 1.924638e+00 ; 2.291627e+00 ; -8.563181e-01 ];
Tc_8  = [ -1.716497e+02 ; -1.133633e+02 ; 8.057755e+02 ];
omc_error_8 = [ 2.685075e-03 ; 4.689100e-03 ; 7.284114e-03 ];
Tc_error_8  = [ 4.979273e+00 ; 3.378807e+00 ; 3.294085e+00 ];

