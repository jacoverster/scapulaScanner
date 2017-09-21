% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 5090.903643036002904 ; 5098.906315138363425 ];

%-- Principal point:
cc = [ 1818.538741510130649 ; 1234.348376432191117 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.082636245099548 ; 0.408061410623645 ; 0.004355667979766 ; 0.002869395801842 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 30.239815677392802 ; 31.669789351660700 ];

%-- Principal point uncertainty:
cc_error = [ 21.786821886561153 ; 13.811506646575220 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.020320096311429 ; 0.314793777168346 ; 0.000767497297357 ; 0.000938175230259 ; 0.000000000000000 ];

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
omc_1 = [ -2.043702e+00 ; -2.061413e+00 ; 4.198438e-02 ];
Tc_1  = [ -1.477550e+02 ; -7.950481e+01 ; 8.770700e+02 ];
omc_error_1 = [ 2.322795e-03 ; 2.627663e-03 ; 4.503110e-03 ];
Tc_error_1  = [ 3.715450e+00 ; 2.391505e+00 ; 5.410292e+00 ];

%-- Image #2:
omc_2 = [ -1.827954e+00 ; -1.812216e+00 ; -3.675840e-03 ];
Tc_2  = [ -1.643231e+02 ; -7.566472e+01 ; 8.566394e+02 ];
omc_error_2 = [ 2.334626e-03 ; 3.112471e-03 ; 3.766083e-03 ];
Tc_error_2  = [ 3.621184e+00 ; 2.348487e+00 ; 5.288114e+00 ];

%-- Image #3:
omc_3 = [ -2.023047e+00 ; -1.981887e+00 ; -1.360727e-01 ];
Tc_3  = [ -1.857882e+02 ; -7.861060e+01 ; 8.559218e+02 ];
omc_error_3 = [ 2.274663e-03 ; 2.991153e-03 ; 4.187094e-03 ];
Tc_error_3  = [ 3.638785e+00 ; 2.355267e+00 ; 5.319595e+00 ];

%-- Image #4:
omc_4 = [ -2.044221e+00 ; -1.970166e+00 ; -5.024839e-02 ];
Tc_4  = [ -1.876705e+02 ; -7.333253e+01 ; 8.656060e+02 ];
omc_error_4 = [ 2.331122e-03 ; 2.804712e-03 ; 4.261972e-03 ];
Tc_error_4  = [ 3.666634e+00 ; 2.375067e+00 ; 5.368634e+00 ];

%-- Image #5:
omc_5 = [ -2.067891e+00 ; -2.009626e+00 ; -2.288949e-03 ];
Tc_5  = [ -1.845748e+02 ; -7.629614e+01 ; 8.696782e+02 ];
omc_error_5 = [ 2.347585e-03 ; 2.643461e-03 ; 4.468125e-03 ];
Tc_error_5  = [ 3.680105e+00 ; 2.381622e+00 ; 5.381639e+00 ];

%-- Image #6:
omc_6 = [ -2.099501e+00 ; -2.047827e+00 ; 7.150983e-02 ];
Tc_6  = [ -1.820365e+02 ; -7.955923e+01 ; 8.796416e+02 ];
omc_error_6 = [ 2.405658e-03 ; 2.430452e-03 ; 4.739253e-03 ];
Tc_error_6  = [ 3.714739e+00 ; 2.400457e+00 ; 5.437657e+00 ];

%-- Image #7:
omc_7 = [ -1.904962e+00 ; -1.988505e+00 ; 2.282892e-01 ];
Tc_7  = [ -1.715484e+02 ; -8.297077e+01 ; 8.787622e+02 ];
omc_error_7 = [ 2.616101e-03 ; 2.671168e-03 ; 4.071298e-03 ];
Tc_error_7  = [ 3.697023e+00 ; 2.396494e+00 ; 5.350270e+00 ];

%-- Image #8:
omc_8 = [ -1.859093e+00 ; -1.955894e+00 ; 3.018601e-01 ];
Tc_8  = [ -1.715683e+02 ; -8.685557e+01 ; 8.964804e+02 ];
omc_error_8 = [ 2.722314e-03 ; 2.705459e-03 ; 4.047521e-03 ];
Tc_error_8  = [ 3.773425e+00 ; 2.443976e+00 ; 5.402241e+00 ];

%-- Image #9:
omc_9 = [ -1.804221e+00 ; -1.817977e+00 ; 1.530248e-01 ];
Tc_9  = [ -1.795771e+02 ; -8.246088e+01 ; 8.795678e+02 ];
omc_error_9 = [ 2.541333e-03 ; 3.013815e-03 ; 3.814488e-03 ];
Tc_error_9  = [ 3.706676e+00 ; 2.408834e+00 ; 5.352967e+00 ];

%-- Image #10:
omc_10 = [ -1.929317e+00 ; -1.896750e+00 ; -3.604037e-02 ];
Tc_10  = [ -1.703202e+02 ; -6.577367e+01 ; 8.255072e+02 ];
omc_error_10 = [ 2.293183e-03 ; 2.994983e-03 ; 3.889469e-03 ];
Tc_error_10  = [ 3.489134e+00 ; 2.263591e+00 ; 5.126696e+00 ];

%-- Image #11:
omc_11 = [ -1.978879e+00 ; -1.915337e+00 ; -7.475602e-02 ];
Tc_11  = [ -1.938163e+02 ; -6.425714e+01 ; 8.297888e+02 ];
omc_error_11 = [ 2.298936e-03 ; 2.976956e-03 ; 4.015458e-03 ];
Tc_error_11  = [ 3.509194e+00 ; 2.280508e+00 ; 5.170299e+00 ];

%-- Image #12:
omc_12 = [ -2.001062e+00 ; -1.974199e+00 ; 1.447887e-02 ];
Tc_12  = [ -1.836643e+02 ; -6.915409e+01 ; 8.475927e+02 ];
omc_error_12 = [ 2.350603e-03 ; 2.766583e-03 ; 4.148591e-03 ];
Tc_error_12  = [ 3.578006e+00 ; 2.321718e+00 ; 5.250273e+00 ];

%-- Image #13:
omc_13 = [ -1.861073e+00 ; -1.892645e+00 ; 1.963333e-01 ];
Tc_13  = [ -1.384733e+02 ; -6.258389e+01 ; 8.940342e+02 ];
omc_error_13 = [ 2.557583e-03 ; 2.853190e-03 ; 3.838783e-03 ];
Tc_error_13  = [ 3.774142e+00 ; 2.436436e+00 ; 5.404797e+00 ];

