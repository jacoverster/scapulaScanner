% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 5098.250392649367313 ; 5109.204637348343567 ];

%-- Principal point:
cc = [ 1787.941975299247815 ; 1124.440328719021181 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.061168994931001 ; 0.343178107797543 ; 0.000187938471655 ; 0.001020194471954 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 51.520224466792584 ; 50.883517428890620 ];

%-- Principal point uncertainty:
cc_error = [ 26.350156554537239 ; 28.176912735593792 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.033888691428344 ; 0.777948517467187 ; 0.001178926697101 ; 0.001508505264024 ; 0.000000000000000 ];

%-- Image size:
nx = 3456;
ny = 2304;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 11;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ -1.950581e+00 ; -1.883864e+00 ; -1.500637e-01 ];
Tc_1  = [ -1.391924e+02 ; -5.965697e+01 ; 9.907131e+02 ];
omc_error_1 = [ 3.812472e-03 ; 4.217467e-03 ; 6.127344e-03 ];
Tc_error_1  = [ 5.111679e+00 ; 5.501360e+00 ; 9.981678e+00 ];

%-- Image #2:
omc_2 = [ -1.992644e+00 ; -1.902589e+00 ; -2.025104e-01 ];
Tc_2  = [ -1.438103e+02 ; -5.789994e+01 ; 9.891905e+02 ];
omc_error_2 = [ 3.651111e-03 ; 4.241680e-03 ; 6.288849e-03 ];
Tc_error_2  = [ 5.106950e+00 ; 5.494734e+00 ; 1.006798e+01 ];

%-- Image #3:
omc_3 = [ -2.011172e+00 ; -1.917754e+00 ; -2.417818e-01 ];
Tc_3  = [ -1.462474e+02 ; -5.636113e+01 ; 9.848384e+02 ];
omc_error_3 = [ 3.542400e-03 ; 4.278290e-03 ; 6.402675e-03 ];
Tc_error_3  = [ 5.086357e+00 ; 5.471455e+00 ; 1.008239e+01 ];

%-- Image #4:
omc_4 = [ -2.043021e+00 ; -1.946607e+00 ; -1.944339e-01 ];
Tc_4  = [ -1.409753e+02 ; -5.991198e+01 ; 9.897653e+02 ];
omc_error_4 = [ 3.551618e-03 ; 4.192137e-03 ; 6.450443e-03 ];
Tc_error_4  = [ 5.111997e+00 ; 5.498175e+00 ; 1.010726e+01 ];

%-- Image #5:
omc_5 = [ -2.063536e+00 ; -1.986177e+00 ; -1.399294e-01 ];
Tc_5  = [ -1.368640e+02 ; -6.543328e+01 ; 9.953438e+02 ];
omc_error_5 = [ 3.578063e-03 ; 4.112713e-03 ; 6.548786e-03 ];
Tc_error_5  = [ 5.140270e+00 ; 5.528330e+00 ; 1.013164e+01 ];

%-- Image #6:
omc_6 = [ -1.992669e+00 ; -1.872411e+00 ; -2.288273e-01 ];
Tc_6  = [ -1.024124e+02 ; -7.961832e+01 ; 1.029324e+03 ];
omc_error_6 = [ 3.567837e-03 ; 4.190733e-03 ; 6.141286e-03 ];
Tc_error_6  = [ 5.321616e+00 ; 5.726144e+00 ; 1.053988e+01 ];

%-- Image #7:
omc_7 = [ -1.888707e+00 ; -1.826084e+00 ; -1.248567e-01 ];
Tc_7  = [ -1.265918e+02 ; -6.098312e+01 ; 9.852280e+02 ];
omc_error_7 = [ 3.971795e-03 ; 4.210947e-03 ; 5.935159e-03 ];
Tc_error_7  = [ 5.082205e+00 ; 5.469477e+00 ; 9.826817e+00 ];

%-- Image #8:
omc_8 = [ -2.114357e+00 ; -2.086708e+00 ; 4.406515e-02 ];
Tc_8  = [ -1.517276e+02 ; -4.758372e+01 ; 9.548419e+02 ];
omc_error_8 = [ 3.806958e-03 ; 3.832933e-03 ; 7.254485e-03 ];
Tc_error_8  = [ 4.919474e+00 ; 5.270172e+00 ; 9.604230e+00 ];

%-- Image #9:
omc_9 = [ -1.968520e+00 ; -1.980806e+00 ; 1.197385e-01 ];
Tc_9  = [ -1.128670e+02 ; -7.960681e+01 ; 1.016036e+03 ];
omc_error_9 = [ 4.382186e-03 ; 3.969036e-03 ; 6.027949e-03 ];
Tc_error_9  = [ 5.231514e+00 ; 5.614978e+00 ; 9.852163e+00 ];

%-- Image #10:
omc_10 = [ -1.926071e+00 ; -1.910553e+00 ; 7.423308e-02 ];
Tc_10  = [ -1.175158e+02 ; -7.549171e+01 ; 1.002365e+03 ];
omc_error_10 = [ 4.302584e-03 ; 3.987061e-03 ; 5.904148e-03 ];
Tc_error_10  = [ 5.163024e+00 ; 5.549666e+00 ; 9.726960e+00 ];

%-- Image #11:
omc_11 = [ -1.884029e+00 ; -1.853993e+00 ; -3.863291e-02 ];
Tc_11  = [ -1.239352e+02 ; -6.347513e+01 ; 9.894797e+02 ];
omc_error_11 = [ 4.115815e-03 ; 4.142740e-03 ; 5.887907e-03 ];
Tc_error_11  = [ 5.100296e+00 ; 5.488720e+00 ; 9.735097e+00 ];

