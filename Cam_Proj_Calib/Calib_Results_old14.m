% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 3000.770149255678007 ; 3012.949380460429893 ];

%-- Principal point:
cc = [ 1667.331973782273963 ; 1137.407137821898687 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.133877016374300 ; -0.222412653779779 ; -0.005258134090697 ; -0.002837876766896 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 31.124743008451944 ; 29.681590352224283 ];

%-- Principal point uncertainty:
cc_error = [ 39.092190440852164 ; 33.551276748385810 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.058288050820265 ; 0.795659997679341 ; 0.002571174236568 ; 0.002817748783834 ; 0.000000000000000 ];

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
omc_1 = [ 1.785931e+00 ; 1.779126e+00 ; -4.230357e-01 ];
Tc_1  = [ -5.506073e+01 ; -3.606132e+01 ; 8.337726e+02 ];
omc_error_1 = [ 7.410341e-03 ; 9.739384e-03 ; 1.446443e-02 ];
Tc_error_1  = [ 1.086149e+01 ; 9.217864e+00 ; 8.192412e+00 ];

%-- Image #2:
omc_2 = [ 2.060570e+00 ; 2.024294e+00 ; -1.086227e-01 ];
Tc_2  = [ -5.769346e+01 ; -4.735379e+01 ; 8.008329e+02 ];
omc_error_2 = [ 7.671074e-03 ; 7.964261e-03 ; 1.873191e-02 ];
Tc_error_2  = [ 1.044494e+01 ; 8.860174e+00 ; 8.008303e+00 ];

%-- Image #3:
omc_3 = [ 1.821557e+00 ; 1.844859e+00 ; -2.134670e-01 ];
Tc_3  = [ -5.436391e+01 ; -7.450760e+01 ; 7.762613e+02 ];
omc_error_3 = [ 7.745172e-03 ; 9.443780e-03 ; 1.498986e-02 ];
Tc_error_3  = [ 1.012808e+01 ; 8.545770e+00 ; 7.754138e+00 ];

%-- Image #4:
omc_4 = [ 1.734928e+00 ; 1.815163e+00 ; -1.282368e-01 ];
Tc_4  = [ -4.618398e+01 ; -7.479147e+01 ; 7.722916e+02 ];
omc_error_4 = [ 8.219712e-03 ; 9.590631e-03 ; 1.451367e-02 ];
Tc_error_4  = [ 1.007620e+01 ; 8.514346e+00 ; 7.764026e+00 ];

%-- Image #5:
omc_5 = [ 1.595989e+00 ; 1.763101e+00 ; -5.662721e-03 ];
Tc_5  = [ -3.640044e+01 ; -7.937957e+01 ; 7.704955e+02 ];
omc_error_5 = [ 8.818862e-03 ; 9.958609e-03 ; 1.372591e-02 ];
Tc_error_5  = [ 1.004959e+01 ; 8.508709e+00 ; 7.850611e+00 ];

%-- Image #6:
omc_6 = [ 1.838733e+00 ; 1.637555e+00 ; -5.816733e-01 ];
Tc_6  = [ -5.998326e+01 ; -1.916820e+01 ; 8.143445e+02 ];
omc_error_6 = [ 7.575594e-03 ; 9.776601e-03 ; 1.449838e-02 ];
Tc_error_6  = [ 1.060697e+01 ; 9.019912e+00 ; 7.838306e+00 ];

%-- Image #7:
omc_7 = [ 1.880444e+00 ; 1.516713e+00 ; -7.066734e-01 ];
Tc_7  = [ -9.045986e+01 ; -4.339143e+01 ; 8.203805e+02 ];
omc_error_7 = [ 7.828604e-03 ; 1.009971e-02 ; 1.488384e-02 ];
Tc_error_7  = [ 1.068387e+01 ; 9.063283e+00 ; 7.854176e+00 ];

%-- Image #8:
omc_8 = [ 1.454224e+00 ; 1.696410e+00 ; -2.967685e-02 ];
Tc_8  = [ -6.811878e+01 ; -8.083645e+01 ; 7.844058e+02 ];
omc_error_8 = [ 8.771843e-03 ; 1.046379e-02 ; 1.279502e-02 ];
Tc_error_8  = [ 1.024955e+01 ; 8.668874e+00 ; 7.972628e+00 ];

%-- Image #9:
omc_9 = [ 1.674787e+00 ; 1.834574e+00 ; -1.092212e-01 ];
Tc_9  = [ -7.434085e+01 ; -5.490455e+01 ; 7.933328e+02 ];
omc_error_9 = [ 8.097938e-03 ; 9.583103e-03 ; 1.406066e-02 ];
Tc_error_9  = [ 1.036126e+01 ; 8.779379e+00 ; 7.956652e+00 ];

%-- Image #10:
omc_10 = [ 1.619840e+00 ; 1.882624e+00 ; 1.719403e-03 ];
Tc_10  = [ -3.330285e+01 ; -6.070581e+01 ; 7.757999e+02 ];
omc_error_10 = [ 8.553623e-03 ; 9.593916e-03 ; 1.427679e-02 ];
Tc_error_10  = [ 1.010861e+01 ; 8.589066e+00 ; 7.900786e+00 ];

%-- Image #11:
omc_11 = [ 1.628795e+00 ; 1.884312e+00 ; 1.028046e-01 ];
Tc_11  = [ -2.647196e+01 ; -6.726332e+01 ; 7.599385e+02 ];
omc_error_11 = [ 8.970566e-03 ; 9.494843e-03 ; 1.441100e-02 ];
Tc_error_11  = [ 9.899855e+00 ; 8.417847e+00 ; 7.809951e+00 ];

%-- Image #12:
omc_12 = [ 1.998282e+00 ; 2.004857e+00 ; -1.508424e-01 ];
Tc_12  = [ -6.763807e+01 ; -2.342564e+01 ; 8.218021e+02 ];
omc_error_12 = [ 7.576035e-03 ; 8.219179e-03 ; 1.710692e-02 ];
Tc_error_12  = [ 1.072315e+01 ; 9.110133e+00 ; 8.185844e+00 ];

