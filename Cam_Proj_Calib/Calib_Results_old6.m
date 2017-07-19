% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 1701.080063733924362 ; 1699.651641205206261 ];

%-- Principal point:
cc = [ 981.270457864587343 ; 638.753302434411694 ];

%-- Skew coefficient:
alpha_c = 0.001781063528526;

%-- Distortion coefficients:
kc = [ -0.176169624697247 ; 0.191833060074903 ; -0.000006791365478 ; 0.001888827105457 ; -0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 42.963288420003856 ; 40.532068665448463 ];

%-- Principal point uncertainty:
cc_error = [ 25.272001877264980 ; 29.461824653164815 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.003803640488161;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.027759632284773 ; 0.233129382229100 ; 0.002797494076846 ; 0.002349416656226 ; 0.000000000000000 ];

%-- Image size:
nx = 1920;
ny = 1280;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 8;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 1;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ 1.910102e+00 ; 1.760959e+00 ; 1.164960e-01 ];
Tc_1  = [ -1.418282e+02 ; -1.149664e+02 ; 5.732910e+02 ];
omc_error_1 = [ 1.470452e-02 ; 8.278537e-03 ; 6.696083e-03 ];
Tc_error_1  = [ 8.301510e+00 ; 9.673004e+00 ; 1.508670e+01 ];

%-- Image #2:
omc_2 = [ 2.218809e+00 ; 1.921713e+00 ; -9.551259e-02 ];
Tc_2  = [ -1.366450e+02 ; -9.979362e+01 ; 5.592436e+02 ];
omc_error_2 = [ 5.453700e-03 ; 3.874502e-03 ; 7.558408e-03 ];
Tc_error_2  = [ 8.148660e+00 ; 9.450169e+00 ; 1.470118e+01 ];

%-- Image #3:
omc_3 = [ 2.118830e+00 ; 1.878976e+00 ; -9.740027e-02 ];
Tc_3  = [ -1.358463e+02 ; -9.967309e+01 ; 5.719687e+02 ];
omc_error_3 = [ 8.284511e-03 ; 5.739562e-03 ; 6.737724e-03 ];
Tc_error_3  = [ 8.342781e+00 ; 9.669968e+00 ; 1.502241e+01 ];

%-- Image #4:
omc_4 = [ 2.167740e+00 ; 1.923721e+00 ; -1.651803e-01 ];
Tc_4  = [ -1.374495e+02 ; -9.974748e+01 ; 5.708607e+02 ];
omc_error_4 = [ 6.517791e-03 ; 5.205198e-03 ; 8.426737e-03 ];
Tc_error_4  = [ 8.272992e+00 ; 9.655761e+00 ; 1.496528e+01 ];

%-- Image #5:
omc_5 = [ 2.087685e+00 ; 1.886260e+00 ; -5.385826e-02 ];
Tc_5  = [ -1.288846e+02 ; -1.092006e+02 ; 5.730366e+02 ];
omc_error_5 = [ 8.972873e-03 ; 5.806559e-03 ; 6.575712e-03 ];
Tc_error_5  = [ 8.329775e+00 ; 9.663044e+00 ; 1.504293e+01 ];

%-- Image #6:
omc_6 = [ 1.875547e+00 ; 1.820867e+00 ; 1.303596e-01 ];
Tc_6  = [ -1.261993e+02 ; -1.374240e+02 ; 5.809463e+02 ];
omc_error_6 = [ 1.469806e-02 ; 8.369945e-03 ; 6.791891e-03 ];
Tc_error_6  = [ 8.301349e+00 ; 9.762859e+00 ; 1.523453e+01 ];

%-- Image #7:
omc_7 = [ 1.877577e+00 ; 1.802700e+00 ; 5.480411e-02 ];
Tc_7  = [ -1.307319e+02 ; -1.346526e+02 ; 5.923825e+02 ];
omc_error_7 = [ 1.396587e-02 ; 8.770322e-03 ; 6.399960e-03 ];
Tc_error_7  = [ 8.518577e+00 ; 9.941272e+00 ; 1.558720e+01 ];

%-- Image #8:
omc_8 = [ 1.863114e+00 ; 1.772433e+00 ; -8.241784e-02 ];
Tc_8  = [ -1.350772e+02 ; -1.287757e+02 ; 6.103603e+02 ];
omc_error_8 = [ 1.305443e-02 ; 9.954671e-03 ; 6.088228e-03 ];
Tc_error_8  = [ 8.832491e+00 ; 1.026002e+01 ; 1.598191e+01 ];

