% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 4789.338998028101742 ; 4793.243082788055290 ];

%-- Principal point:
cc = [ 1799.576373907509151 ; 1100.596544581504304 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.057564103478425 ; 0.063831714624540 ; -0.001546025341627 ; 0.000923690122621 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 65.048899350223138 ; 66.505526515447627 ];

%-- Principal point uncertainty:
cc_error = [ 25.686630321170469 ; 11.795741919742010 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.014942147866298 ; 0.150392971868769 ; 0.000876465475473 ; 0.001063489747621 ; 0.000000000000000 ];

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
omc_1 = [ -2.214327e+00 ; -2.023404e+00 ; 1.188182e-01 ];
Tc_1  = [ -1.785162e+02 ; -6.107913e+01 ; 8.072258e+02 ];
omc_error_1 = [ 2.779598e-03 ; 2.720159e-03 ; 5.400094e-03 ];
Tc_error_1  = [ 4.273899e+00 ; 1.999953e+00 ; 1.121376e+01 ];

%-- Image #2:
omc_2 = [ -2.326354e+00 ; -2.050761e+00 ; 7.562584e-02 ];
Tc_2  = [ -1.907171e+02 ; -5.279914e+01 ; 8.182738e+02 ];
omc_error_2 = [ 2.928961e-03 ; 2.551530e-03 ; 5.975229e-03 ];
Tc_error_2  = [ 4.352611e+00 ; 2.029117e+00 ; 1.130113e+01 ];

%-- Image #3:
omc_3 = [ NaN ; NaN ; NaN ];
Tc_3  = [ NaN ; NaN ; NaN ];
omc_error_3 = [ NaN ; NaN ; NaN ];
Tc_error_3  = [ NaN ; NaN ; NaN ];

%-- Image #4:
omc_4 = [ -2.145697e+00 ; -1.984555e+00 ; 1.522814e-01 ];
Tc_4  = [ -1.919252e+02 ; -5.717468e+01 ; 7.969098e+02 ];
omc_error_4 = [ 2.831980e-03 ; 2.980813e-03 ; 5.299032e-03 ];
Tc_error_4  = [ 4.213489e+00 ; 1.978529e+00 ; 1.105021e+01 ];

%-- Image #5:
omc_5 = [ -2.124270e+00 ; -2.074642e+00 ; -1.440188e-01 ];
Tc_5  = [ -1.742836e+02 ; -5.934898e+01 ; 7.561107e+02 ];
omc_error_5 = [ 2.707111e-03 ; 3.516025e-03 ; 4.993155e-03 ];
Tc_error_5  = [ 4.044491e+00 ; 1.889996e+00 ; 1.052359e+01 ];

%-- Image #6:
omc_6 = [ NaN ; NaN ; NaN ];
Tc_6  = [ NaN ; NaN ; NaN ];
omc_error_6 = [ NaN ; NaN ; NaN ];
Tc_error_6  = [ NaN ; NaN ; NaN ];

%-- Image #7:
omc_7 = [ -2.239501e+00 ; -2.091284e+00 ; 4.119057e-01 ];
Tc_7  = [ -1.644902e+02 ; -5.883300e+01 ; 8.065513e+02 ];
omc_error_7 = [ 2.989464e-03 ; 2.156031e-03 ; 6.807821e-03 ];
Tc_error_7  = [ 4.279496e+00 ; 1.995183e+00 ; 1.101006e+01 ];

%-- Image #8:
omc_8 = [ -2.258503e+00 ; -2.046587e+00 ; 2.625062e-01 ];
Tc_8  = [ -1.726698e+02 ; -4.493817e+01 ; 7.800928e+02 ];
omc_error_8 = [ 2.732653e-03 ; 2.312522e-03 ; 6.027600e-03 ];
Tc_error_8  = [ 4.124520e+00 ; 1.929884e+00 ; 1.079954e+01 ];

%-- Image #9:
omc_9 = [ -2.325978e+00 ; -1.990241e+00 ; 1.715981e-01 ];
Tc_9  = [ -1.839922e+02 ; -2.684557e+01 ; 7.873408e+02 ];
omc_error_9 = [ 2.751316e-03 ; 2.368777e-03 ; 5.700075e-03 ];
Tc_error_9  = [ 4.164321e+00 ; 1.951009e+00 ; 1.092981e+01 ];

%-- Image #10:
omc_10 = [ -2.186820e+00 ; -2.020482e+00 ; 4.350212e-01 ];
Tc_10  = [ -1.811316e+02 ; -4.545445e+01 ; 7.849519e+02 ];
omc_error_10 = [ 3.200430e-03 ; 2.467575e-03 ; 6.349652e-03 ];
Tc_error_10  = [ 4.166693e+00 ; 1.945671e+00 ; 1.062957e+01 ];

%-- Image #11:
omc_11 = [ -2.234427e+00 ; -2.075489e+00 ; 2.879529e-01 ];
Tc_11  = [ -1.900202e+02 ; -4.707965e+01 ; 7.614938e+02 ];
omc_error_11 = [ 2.762718e-03 ; 2.295680e-03 ; 6.146787e-03 ];
Tc_error_11  = [ 4.020631e+00 ; 1.890976e+00 ; 1.052498e+01 ];

%-- Image #12:
omc_12 = [ -2.298469e+00 ; -2.118648e+00 ; 1.362092e-01 ];
Tc_12  = [ -1.893895e+02 ; -3.835669e+01 ; 7.409116e+02 ];
omc_error_12 = [ 2.715326e-03 ; 2.458763e-03 ; 5.703273e-03 ];
Tc_error_12  = [ 3.927760e+00 ; 1.840136e+00 ; 1.026359e+01 ];

