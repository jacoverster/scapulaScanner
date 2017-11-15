% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 5964.297933311380802 ; 5979.205947458641276 ];

%-- Principal point:
cc = [ 1852.897370768120027 ; 1221.824605277516866 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.038170448232175 ; 0.490859562213530 ; 0.004148342875965 ; 0.004627110649338 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 55.262854831918254 ; 55.095191923923537 ];

%-- Principal point uncertainty:
cc_error = [ 34.646795753893755 ; 29.979374550965368 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.038014011431474 ; 0.920548102808487 ; 0.001221746461061 ; 0.001594854667951 ; 0.000000000000000 ];

%-- Image size:
nx = 3456;
ny = 2304;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 13;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ -1.816093e+00 ; -1.839337e+00 ; 3.945794e-03 ];
Tc_1  = [ -1.490392e+02 ; -1.060486e+02 ; 1.042078e+03 ];
omc_error_1 = [ 4.124777e-03 ; 4.435884e-03 ; 5.607936e-03 ];
Tc_error_1  = [ 6.025796e+00 ; 5.274848e+00 ; 9.523526e+00 ];

%-- Image #2:
omc_2 = [ -1.874175e+00 ; -1.853923e+00 ; -9.016319e-02 ];
Tc_2  = [ -1.623265e+02 ; -9.886691e+01 ; 1.026997e+03 ];
omc_error_2 = [ 3.924396e-03 ; 4.496146e-03 ; 5.734469e-03 ];
Tc_error_2  = [ 5.941843e+00 ; 5.211706e+00 ; 9.562352e+00 ];

%-- Image #3:
omc_3 = [ -1.913456e+00 ; -1.860359e+00 ; -1.481564e-01 ];
Tc_3  = [ -1.717824e+02 ; -9.515764e+01 ; 1.013785e+03 ];
omc_error_3 = [ 3.802943e-03 ; 4.528834e-03 ; 5.825148e-03 ];
Tc_error_3  = [ 5.869191e+00 ; 5.152933e+00 ; 9.543352e+00 ];

%-- Image #4:
omc_4 = [ -1.946214e+00 ; -1.893011e+00 ; -2.251154e-01 ];
Tc_4  = [ -1.662071e+02 ; -9.248161e+01 ; 9.981070e+02 ];
omc_error_4 = [ 3.601157e-03 ; 4.615503e-03 ; 5.910569e-03 ];
Tc_error_4  = [ 5.787402e+00 ; 5.080089e+00 ; 9.508930e+00 ];

%-- Image #5:
omc_5 = [ -1.995108e+00 ; -1.920128e+00 ; -2.964116e-01 ];
Tc_5  = [ -1.740627e+02 ; -9.263342e+01 ; 9.924251e+02 ];
omc_error_5 = [ 3.493222e-03 ; 4.681888e-03 ; 6.047573e-03 ];
Tc_error_5  = [ 5.764367e+00 ; 5.060586e+00 ; 9.547170e+00 ];

%-- Image #6:
omc_6 = [ -2.028785e+00 ; -2.066067e+00 ; 2.922301e-02 ];
Tc_6  = [ -1.579049e+02 ; -1.215373e+02 ; 1.037709e+03 ];
omc_error_6 = [ 4.078583e-03 ; 4.011256e-03 ; 7.157853e-03 ];
Tc_error_6  = [ 6.001701e+00 ; 5.248718e+00 ; 9.663910e+00 ];

%-- Image #7:
omc_7 = [ -1.970743e+00 ; -2.032111e+00 ; 9.548488e-02 ];
Tc_7  = [ -1.586475e+02 ; -1.171948e+02 ; 1.033811e+03 ];
omc_error_7 = [ 4.324603e-03 ; 4.068217e-03 ; 6.478877e-03 ];
Tc_error_7  = [ 5.969058e+00 ; 5.216231e+00 ; 9.488920e+00 ];

%-- Image #8:
omc_8 = [ -1.880365e+00 ; -2.005656e+00 ; 1.547549e-01 ];
Tc_8  = [ -1.568217e+02 ; -1.216877e+02 ; 1.035241e+03 ];
omc_error_8 = [ 4.452296e-03 ; 4.144931e-03 ; 6.061057e-03 ];
Tc_error_8  = [ 5.975683e+00 ; 5.217539e+00 ; 9.357125e+00 ];

%-- Image #9:
omc_9 = [ -1.866351e+00 ; -1.961790e+00 ; 9.303695e-02 ];
Tc_9  = [ -1.600667e+02 ; -1.197230e+02 ; 1.029214e+03 ];
omc_error_9 = [ 4.290263e-03 ; 4.224775e-03 ; 5.920383e-03 ];
Tc_error_9  = [ 5.943568e+00 ; 5.199894e+00 ; 9.366890e+00 ];

%-- Image #10:
omc_10 = [ -1.944162e+00 ; -1.983965e+00 ; 2.471522e-02 ];
Tc_10  = [ -1.692468e+02 ; -1.106934e+02 ; 1.018177e+03 ];
omc_error_10 = [ 4.113428e-03 ; 4.186463e-03 ; 6.217089e-03 ];
Tc_error_10  = [ 5.881065e+00 ; 5.154361e+00 ; 9.412714e+00 ];

%-- Image #11:
omc_11 = [ -1.960633e+00 ; -1.923451e+00 ; -1.340272e-01 ];
Tc_11  = [ -1.712242e+02 ; -9.711122e+01 ; 9.946253e+02 ];
omc_error_11 = [ 3.762052e-03 ; 4.439954e-03 ; 6.022780e-03 ];
Tc_error_11  = [ 5.759415e+00 ; 5.056791e+00 ; 9.383686e+00 ];

%-- Image #12:
omc_12 = [ -1.898787e+00 ; -1.857329e+00 ; -6.297665e-02 ];
Tc_12  = [ -1.872278e+02 ; -8.878810e+01 ; 9.662041e+02 ];
omc_error_12 = [ 4.013130e-03 ; 4.433418e-03 ; 5.826969e-03 ];
Tc_error_12  = [ 5.580730e+00 ; 4.906169e+00 ; 9.004365e+00 ];

%-- Image #13:
omc_13 = [ -1.879371e+00 ; -1.839582e+00 ; -7.739069e-02 ];
Tc_13  = [ -1.680957e+02 ; -1.104002e+02 ; 1.012416e+03 ];
omc_error_13 = [ 3.961716e-03 ; 4.427098e-03 ; 5.713749e-03 ];
Tc_error_13  = [ 5.858067e+00 ; 5.143910e+00 ; 9.421967e+00 ];

