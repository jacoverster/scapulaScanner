% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 6370.738123367351363 ; 6388.635551946603300 ];

%-- Principal point:
cc = [ 1834.356593560297370 ; 1244.106500499274716 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.021919689268708 ; 0.338251593148457 ; 0.005464360175737 ; 0.004078692278197 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 57.224961594954983 ; 55.852375049312755 ];

%-- Principal point uncertainty:
cc_error = [ 35.445890338737811 ; 29.031398639303369 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.034072762389311 ; 0.586016714315992 ; 0.001338082745503 ; 0.001833428578997 ; 0.000000000000000 ];

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
omc_1 = [ -1.911865e+00 ; -1.979939e+00 ; -9.308431e-02 ];
Tc_1  = [ -1.870380e+02 ; -1.087497e+02 ; 1.026445e+03 ];
omc_error_1 = [ 3.599543e-03 ; 4.203752e-03 ; 6.307743e-03 ];
Tc_error_1  = [ 5.712352e+00 ; 4.717252e+00 ; 9.294589e+00 ];

%-- Image #2:
omc_2 = [ -1.925831e+00 ; -2.038388e+00 ; -3.336426e-02 ];
Tc_2  = [ -1.799444e+02 ; -1.141551e+02 ; 1.036116e+03 ];
omc_error_2 = [ 3.708253e-03 ; 4.155614e-03 ; 6.512402e-03 ];
Tc_error_2  = [ 5.766422e+00 ; 4.754025e+00 ; 9.317685e+00 ];

%-- Image #3:
omc_3 = [ -2.002206e+00 ; -1.979754e+00 ; -1.521410e-01 ];
Tc_3  = [ -1.952059e+02 ; -1.039086e+02 ; 1.022467e+03 ];
omc_error_3 = [ 3.500878e-03 ; 4.091735e-03 ; 6.518062e-03 ];
Tc_error_3  = [ 5.692718e+00 ; 4.706219e+00 ; 9.387196e+00 ];

%-- Image #4:
omc_4 = [ -2.034954e+00 ; -2.071409e+00 ; 6.155289e-02 ];
Tc_4  = [ -1.970212e+02 ; -1.124384e+02 ; 1.022568e+03 ];
omc_error_4 = [ 4.025668e-03 ; 3.891785e-03 ; 7.194342e-03 ];
Tc_error_4  = [ 5.689842e+00 ; 4.682470e+00 ; 9.177225e+00 ];

%-- Image #5:
omc_5 = [ -2.096837e+00 ; -1.958855e+00 ; -4.642047e-01 ];
Tc_5  = [ -1.972784e+02 ; -9.172338e+01 ; 9.732837e+02 ];
omc_error_5 = [ 2.984418e-03 ; 4.223398e-03 ; 6.633585e-03 ];
Tc_error_5  = [ 5.440723e+00 ; 4.491794e+00 ; 9.162174e+00 ];

%-- Image #6:
omc_6 = [ -2.250539e+00 ; -2.106179e+00 ; -2.644643e-01 ];
Tc_6  = [ -1.942302e+02 ; -8.637511e+01 ; 9.737148e+02 ];
omc_error_6 = [ 3.705192e-03 ; 3.962295e-03 ; 7.585516e-03 ];
Tc_error_6  = [ 5.459585e+00 ; 4.484833e+00 ; 8.854205e+00 ];

%-- Image #7:
omc_7 = [ -2.150904e+00 ; -2.110607e+00 ; -9.211793e-02 ];
Tc_7  = [ -1.947611e+02 ; -1.037755e+02 ; 9.921590e+02 ];
omc_error_7 = [ 3.666141e-03 ; 3.829170e-03 ; 7.973904e-03 ];
Tc_error_7  = [ 5.532095e+00 ; 4.562760e+00 ; 9.168624e+00 ];

%-- Image #8:
omc_8 = [ -2.101511e+00 ; -2.097656e+00 ; -1.187448e-02 ];
Tc_8  = [ -1.946328e+02 ; -1.059281e+02 ; 9.959571e+02 ];
omc_error_8 = [ 3.788023e-03 ; 3.812378e-03 ; 7.659597e-03 ];
Tc_error_8  = [ 5.542898e+00 ; 4.567531e+00 ; 9.104833e+00 ];

%-- Image #9:
omc_9 = [ -2.056275e+00 ; -2.080117e+00 ; 7.525320e-02 ];
Tc_9  = [ -1.925167e+02 ; -1.094881e+02 ; 1.013933e+03 ];
omc_error_9 = [ 4.067792e-03 ; 3.864893e-03 ; 7.332051e-03 ];
Tc_error_9  = [ 5.641352e+00 ; 4.638362e+00 ; 9.092888e+00 ];

%-- Image #10:
omc_10 = [ -1.926674e+00 ; -2.019846e+00 ; 2.546930e-01 ];
Tc_10  = [ -1.868521e+02 ; -1.162029e+02 ; 1.040366e+03 ];
omc_error_10 = [ 4.476528e-03 ; 3.923759e-03 ; 6.617559e-03 ];
Tc_error_10  = [ 5.799483e+00 ; 4.746792e+00 ; 8.913781e+00 ];

%-- Image #11:
omc_11 = [ -1.886123e+00 ; -1.966568e+00 ; 1.632465e-01 ];
Tc_11  = [ -1.890514e+02 ; -1.160056e+02 ; 1.027816e+03 ];
omc_error_11 = [ 4.217289e-03 ; 4.021358e-03 ; 6.334510e-03 ];
Tc_error_11  = [ 5.725962e+00 ; 4.701182e+00 ; 8.915989e+00 ];

%-- Image #12:
omc_12 = [ -1.867772e+00 ; -1.843827e+00 ; -7.529211e-02 ];
Tc_12  = [ -2.071339e+02 ; -1.013099e+02 ; 9.946581e+02 ];
omc_error_12 = [ 3.749083e-03 ; 4.226690e-03 ; 6.022601e-03 ];
Tc_error_12  = [ 5.534692e+00 ; 4.576949e+00 ; 8.962898e+00 ];

%-- Image #13:
omc_13 = [ -1.921910e+00 ; -1.876181e+00 ; -1.522895e-01 ];
Tc_13  = [ -2.052843e+02 ; -9.925020e+01 ; 9.892838e+02 ];
omc_error_13 = [ 3.570240e-03 ; 4.200170e-03 ; 6.149537e-03 ];
Tc_error_13  = [ 5.505000e+00 ; 4.556628e+00 ; 9.042157e+00 ];

