% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 4876.159731886594273 ; 4882.798566330196081 ];

%-- Principal point:
cc = [ 1716.838830252305343 ; 1331.708589795980515 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.059642337553581 ; 0.064991418794824 ; 0.008674908508709 ; -0.001796380088591 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 41.144707828697562 ; 44.779626353643565 ];

%-- Principal point uncertainty:
cc_error = [ 33.695463017287260 ; 14.003801047385275 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.017122338263725 ; 0.191620205791686 ; 0.000970188497153 ; 0.001154261990405 ; 0.000000000000000 ];

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
omc_1 = [ 2.030841e+00 ; 2.022964e+00 ; 5.237143e-01 ];
Tc_1  = [ -6.246753e+01 ; -1.002435e+02 ; 6.584569e+02 ];
omc_error_1 = [ 3.849784e-03 ; 3.202256e-03 ; 6.614678e-03 ];
Tc_error_1  = [ 4.615252e+00 ; 1.888263e+00 ; 6.090515e+00 ];

%-- Image #2:
omc_2 = [ 2.081598e+00 ; 2.130788e+00 ; 4.037377e-01 ];
Tc_2  = [ -6.112181e+01 ; -1.077336e+02 ; 6.789327e+02 ];
omc_error_2 = [ 3.449534e-03 ; 2.852336e-03 ; 6.554793e-03 ];
Tc_error_2  = [ 4.759276e+00 ; 1.946632e+00 ; 6.221665e+00 ];

%-- Image #3:
omc_3 = [ 2.165977e+00 ; 2.196662e+00 ; 4.876002e-01 ];
Tc_3  = [ -5.591159e+01 ; -9.690286e+01 ; 6.889971e+02 ];
omc_error_3 = [ 3.618230e-03 ; 2.380773e-03 ; 7.630478e-03 ];
Tc_error_3  = [ 4.817707e+00 ; 1.971991e+00 ; 6.113838e+00 ];

%-- Image #4:
omc_4 = [ -2.148969e+00 ; -2.250750e+00 ; -3.522155e-01 ];
Tc_4  = [ -1.071920e+02 ; -1.122718e+02 ; 7.064209e+02 ];
omc_error_4 = [ 2.504596e-03 ; 2.966462e-03 ; 7.390331e-03 ];
Tc_error_4  = [ 4.971277e+00 ; 2.038169e+00 ; 6.220001e+00 ];

%-- Image #5:
omc_5 = [ 2.129559e+00 ; 2.172419e+00 ; 4.973857e-01 ];
Tc_5  = [ -9.395641e+01 ; -1.112760e+02 ; 6.948557e+02 ];
omc_error_5 = [ 3.525771e-03 ; 2.512922e-03 ; 7.262225e-03 ];
Tc_error_5  = [ 4.890448e+00 ; 1.999618e+00 ; 6.262391e+00 ];

%-- Image #6:
omc_6 = [ 2.223002e+00 ; 2.071543e+00 ; 1.095184e-01 ];
Tc_6  = [ -1.309696e+02 ; -1.089779e+02 ; 7.347697e+02 ];
omc_error_6 = [ 3.211183e-03 ; 3.111876e-03 ; 6.193680e-03 ];
Tc_error_6  = [ 5.166762e+00 ; 2.118852e+00 ; 6.770315e+00 ];

%-- Image #7:
omc_7 = [ 2.109945e+00 ; 2.069423e+00 ; 3.374513e-01 ];
Tc_7  = [ -7.441711e+01 ; -9.425331e+01 ; 6.897663e+02 ];
omc_error_7 = [ 3.390021e-03 ; 2.933717e-03 ; 6.267867e-03 ];
Tc_error_7  = [ 4.841202e+00 ; 1.979188e+00 ; 6.330036e+00 ];

%-- Image #8:
omc_8 = [ 2.101845e+00 ; 1.988610e+00 ; 4.286087e-01 ];
Tc_8  = [ -1.489755e+02 ; -1.208320e+02 ; 7.856015e+02 ];
omc_error_8 = [ 3.452851e-03 ; 3.142499e-03 ; 6.425424e-03 ];
Tc_error_8  = [ 5.584212e+00 ; 2.274048e+00 ; 7.257661e+00 ];

%-- Image #9:
omc_9 = [ 2.044014e+00 ; 2.012552e+00 ; 7.934156e-01 ];
Tc_9  = [ -1.442453e+02 ; -1.328522e+02 ; 7.393018e+02 ];
omc_error_9 = [ 4.505776e-03 ; 3.009378e-03 ; 6.848149e-03 ];
Tc_error_9  = [ 5.255587e+00 ; 2.151433e+00 ; 6.948224e+00 ];

%-- Image #10:
omc_10 = [ 2.040528e+00 ; 2.041847e+00 ; 9.720911e-01 ];
Tc_10  = [ -1.041753e+02 ; -1.257576e+02 ; 7.331104e+02 ];
omc_error_10 = [ 5.348124e-03 ; 2.918792e-03 ; 7.083906e-03 ];
Tc_error_10  = [ 5.159559e+00 ; 2.123482e+00 ; 6.891405e+00 ];

%-- Image #11:
omc_11 = [ 2.031507e+00 ; 1.920707e+00 ; 5.726642e-01 ];
Tc_11  = [ -1.176078e+02 ; -1.333725e+02 ; 7.608535e+02 ];
omc_error_11 = [ 3.878832e-03 ; 3.421084e-03 ; 6.424623e-03 ];
Tc_error_11  = [ 5.387533e+00 ; 2.195906e+00 ; 7.104811e+00 ];

%-- Image #12:
omc_12 = [ 2.027286e+00 ; 1.754835e+00 ; 3.883249e-01 ];
Tc_12  = [ -1.231234e+02 ; -1.324217e+02 ; 7.306229e+02 ];
omc_error_12 = [ 3.549011e-03 ; 4.003486e-03 ; 6.027348e-03 ];
Tc_error_12  = [ 5.172230e+00 ; 2.102523e+00 ; 6.674549e+00 ];

