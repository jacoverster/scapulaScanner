% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 2870.596839084060321 ; 2873.133345907221610 ];

%-- Principal point:
cc = [ 1722.144082142166098 ; 1138.397974064732352 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.181868559008577 ; 0.133824521407353 ; 0.002342877405215 ; 0.002482685353555 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 35.395402560193560 ; 34.510470601067745 ];

%-- Principal point uncertainty:
cc_error = [ 5.950218915793345 ; 12.182930101078558 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.007744194591757 ; 0.023756035223988 ; 0.000678060558216 ; 0.000491324649926 ; 0.000000000000000 ];

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
omc_1 = [ 2.254890e+00 ; 1.987252e+00 ; -8.444917e-02 ];
Tc_1  = [ -1.193360e+02 ; -8.222592e+01 ; 4.169687e+02 ];
omc_error_1 = [ 2.258041e-03 ; 1.933473e-03 ; 3.645962e-03 ];
Tc_error_1  = [ 8.734769e-01 ; 1.750561e+00 ; 5.128077e+00 ];

%-- Image #2:
omc_2 = [ 2.233960e+00 ; 2.027765e+00 ; -1.327364e-01 ];
Tc_2  = [ -1.153710e+02 ; -1.017504e+02 ; 4.230968e+02 ];
omc_error_2 = [ 2.088233e-03 ; 1.969565e-03 ; 3.804130e-03 ];
Tc_error_2  = [ 8.863109e-01 ; 1.767337e+00 ; 5.212646e+00 ];

%-- Image #3:
omc_3 = [ 2.232628e+00 ; 2.047281e+00 ; -2.724140e-01 ];
Tc_3  = [ -1.222874e+02 ; -1.000389e+02 ; 4.413326e+02 ];
omc_error_3 = [ 1.946467e-03 ; 2.083003e-03 ; 4.720315e-03 ];
Tc_error_3  = [ 9.191258e-01 ; 1.845750e+00 ; 5.413310e+00 ];

%-- Image #4:
omc_4 = [ 2.166146e+00 ; 1.978647e+00 ; -2.726733e-01 ];
Tc_4  = [ -1.259303e+02 ; -9.974811e+01 ; 4.571923e+02 ];
omc_error_4 = [ 2.429027e-03 ; 2.446844e-03 ; 4.376535e-03 ];
Tc_error_4  = [ 9.511002e-01 ; 1.918391e+00 ; 5.583794e+00 ];

%-- Image #5:
omc_5 = [ 2.248091e+00 ; 2.126864e+00 ; -7.208498e-02 ];
Tc_5  = [ -1.149153e+02 ; -1.081322e+02 ; 4.047697e+02 ];
omc_error_5 = [ 1.769927e-03 ; 1.726201e-03 ; 3.678778e-03 ];
Tc_error_5  = [ 8.520744e-01 ; 1.701577e+00 ; 4.965767e+00 ];

%-- Image #6:
omc_6 = [ 2.249325e+00 ; 2.096051e+00 ; -3.158246e-01 ];
Tc_6  = [ -1.248073e+02 ; -1.072879e+02 ; 4.443906e+02 ];
omc_error_6 = [ 1.737267e-03 ; 2.019043e-03 ; 5.253084e-03 ];
Tc_error_6  = [ 9.260466e-01 ; 1.857340e+00 ; 5.429628e+00 ];

%-- Image #7:
omc_7 = [ 2.225190e+00 ; 2.170128e+00 ; -1.039364e-01 ];
Tc_7  = [ -1.067164e+02 ; -1.261184e+02 ; 4.136647e+02 ];
omc_error_7 = [ 1.715599e-03 ; 1.778379e-03 ; 3.815010e-03 ];
Tc_error_7  = [ 8.724929e-01 ; 1.729567e+00 ; 5.082185e+00 ];

%-- Image #8:
omc_8 = [ 2.188770e+00 ; 2.189887e+00 ; -1.815267e-01 ];
Tc_8  = [ -1.042656e+02 ; -1.239148e+02 ; 4.266288e+02 ];
omc_error_8 = [ 1.692072e-03 ; 1.848830e-03 ; 4.236061e-03 ];
Tc_error_8  = [ 8.954787e-01 ; 1.774554e+00 ; 5.255508e+00 ];

%-- Image #9:
omc_9 = [ -2.220991e+00 ; -2.181669e+00 ; 3.233298e-01 ];
Tc_9  = [ -1.051163e+02 ; -1.213835e+02 ; 4.404259e+02 ];
omc_error_9 = [ 1.836538e-03 ; 1.625331e-03 ; 5.586843e-03 ];
Tc_error_9  = [ 9.214666e-01 ; 1.832101e+00 ; 5.370790e+00 ];

%-- Image #10:
omc_10 = [ -2.283688e+00 ; -2.113122e+00 ; 3.977984e-01 ];
Tc_10  = [ -1.112388e+02 ; -1.009443e+02 ; 4.580280e+02 ];
omc_error_10 = [ 1.910935e-03 ; 1.559235e-03 ; 6.246906e-03 ];
Tc_error_10  = [ 9.537701e-01 ; 1.916828e+00 ; 5.515076e+00 ];

%-- Image #11:
omc_11 = [ 2.162727e+00 ; 2.012686e+00 ; -3.746217e-01 ];
Tc_11  = [ -1.130563e+02 ; -9.860780e+01 ; 4.803909e+02 ];
omc_error_11 = [ 2.302847e-03 ; 2.537280e-03 ; 5.043322e-03 ];
Tc_error_11  = [ 9.969608e-01 ; 2.025458e+00 ; 5.794528e+00 ];

%-- Image #12:
omc_12 = [ 2.283959e+00 ; 2.100547e+00 ; 6.080473e-04 ];
Tc_12  = [ -1.104471e+02 ; -1.076047e+02 ; 4.061504e+02 ];
omc_error_12 = [ 1.872082e-03 ; 1.702142e-03 ; 3.743315e-03 ];
Tc_error_12  = [ 8.580969e-01 ; 1.723130e+00 ; 4.952937e+00 ];

%-- Image #13:
omc_13 = [ 2.102806e+00 ; 1.966476e+00 ; 2.772876e-02 ];
Tc_13  = [ -1.106379e+02 ; -1.067659e+02 ; 4.272953e+02 ];
omc_error_13 = [ 3.129691e-03 ; 2.427275e-03 ; 3.260431e-03 ];
Tc_error_13  = [ 8.976111e-01 ; 1.785617e+00 ; 5.274996e+00 ];

