% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 5019.987127623975539 ; 5021.476811043072303 ];

%-- Principal point:
cc = [ 2165.756824767301168 ; 1248.683415297001829 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.015456218321403 ; -0.072482997734670 ; 0.007461907604254 ; 0.021594289966996 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 111.104562847954014 ; 72.017354900741879 ];

%-- Principal point uncertainty:
cc_error = [ 73.826384103398155 ; 177.829726153026826 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.028738407765147 ; 0.129415613770400 ; 0.002873020206599 ; 0.004773277584617 ; 0.000000000000000 ];

%-- Image size:
nx = 3456;
ny = 2304;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 15;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ -1.738480e+00 ; -1.696755e+00 ; -6.734773e-01 ];
Tc_1  = [ -2.453831e+02 ; -1.157851e+02 ; 6.969511e+02 ];
omc_error_1 = [ 1.747384e-02 ; 1.453132e-02 ; 1.920684e-02 ];
Tc_error_1  = [ 1.033272e+01 ; 2.701746e+01 ; 1.510546e+01 ];

%-- Image #2:
omc_2 = [ -1.759875e+00 ; -1.695450e+00 ; -6.775735e-01 ];
Tc_2  = [ -1.912382e+02 ; -9.839419e+01 ; 6.807974e+02 ];
omc_error_2 = [ 1.683407e-02 ; 1.454984e-02 ; 1.920128e-02 ];
Tc_error_2  = [ 1.010692e+01 ; 2.607232e+01 ; 1.465441e+01 ];

%-- Image #3:
omc_3 = [ -1.735125e+00 ; -1.780761e+00 ; -6.298053e-01 ];
Tc_3  = [ -2.445623e+02 ; -3.552119e+01 ; 7.075503e+02 ];
omc_error_3 = [ 1.654490e-02 ; 1.440872e-02 ; 1.912060e-02 ];
Tc_error_3  = [ 1.035828e+01 ; 2.605595e+01 ; 1.519568e+01 ];

%-- Image #4:
omc_4 = [ -1.751887e+00 ; -1.793959e+00 ; -6.356855e-01 ];
Tc_4  = [ -1.444656e+02 ; -3.440424e+01 ; 7.037836e+02 ];
omc_error_4 = [ 1.536798e-02 ; 1.441267e-02 ; 1.914430e-02 ];
Tc_error_4  = [ 1.035286e+01 ; 2.572158e+01 ; 1.499167e+01 ];

%-- Image #5:
omc_5 = [ -1.551675e+00 ; -1.678251e+00 ; -5.716223e-01 ];
Tc_5  = [ -1.387968e+02 ; -8.794491e+01 ; 6.342867e+02 ];
omc_error_5 = [ 2.235167e-02 ; 1.481357e-02 ; 1.854888e-02 ];
Tc_error_5  = [ 9.304269e+00 ; 2.397843e+01 ; 1.226853e+01 ];

%-- Image #6:
omc_6 = [ -1.572807e+00 ; -1.788151e+00 ; -4.604429e-01 ];
Tc_6  = [ -1.247005e+02 ; -7.725765e+01 ; 6.348102e+02 ];
omc_error_6 = [ 2.165485e-02 ; 1.437050e-02 ; 1.779348e-02 ];
Tc_error_6  = [ 9.265607e+00 ; 2.372921e+01 ; 1.163953e+01 ];

%-- Image #7:
omc_7 = [ -1.439490e+00 ; -1.667411e+00 ; -5.272222e-01 ];
Tc_7  = [ -1.240802e+02 ; -7.091636e+01 ; 6.221436e+02 ];
omc_error_7 = [ 2.501652e-02 ; 1.502212e-02 ; 1.862097e-02 ];
Tc_error_7  = [ 9.055686e+00 ; 2.318052e+01 ; 1.108824e+01 ];

%-- Image #8:
omc_8 = [ -1.652704e+00 ; -1.807704e+00 ; -3.541523e-01 ];
Tc_8  = [ -1.723162e+02 ; -6.821708e+01 ; 6.591598e+02 ];
omc_error_8 = [ 2.147939e-02 ; 1.340275e-02 ; 1.760136e-02 ];
Tc_error_8  = [ 9.523816e+00 ; 2.448563e+01 ; 1.184321e+01 ];

%-- Image #9:
omc_9 = [ -1.847561e+00 ; -1.629492e+00 ; -7.464569e-01 ];
Tc_9  = [ -1.530357e+02 ; -6.606255e+01 ; 7.039400e+02 ];
omc_error_9 = [ 1.536238e-02 ; 1.503629e-02 ; 2.053666e-02 ];
Tc_error_9  = [ 1.044033e+01 ; 2.631761e+01 ; 1.542704e+01 ];

%-- Image #10:
omc_10 = [ -1.770350e+00 ; -1.670705e+00 ; -5.905877e-01 ];
Tc_10  = [ -1.648587e+02 ; -6.640356e+01 ; 6.933025e+02 ];
omc_error_10 = [ 1.786023e-02 ; 1.391975e-02 ; 1.841739e-02 ];
Tc_error_10  = [ 1.021365e+01 ; 2.589925e+01 ; 1.452765e+01 ];

%-- Image #11:
omc_11 = [ -1.800491e+00 ; -1.755619e+00 ; -4.736840e-01 ];
Tc_11  = [ -2.611978e+02 ; -4.444202e+01 ; 6.931683e+02 ];
omc_error_11 = [ 1.755470e-02 ; 1.282344e-02 ; 1.816135e-02 ];
Tc_error_11  = [ 1.005830e+01 ; 2.567317e+01 ; 1.441356e+01 ];

%-- Image #12:
omc_12 = [ -1.942268e+00 ; -1.734139e+00 ; -6.956139e-01 ];
Tc_12  = [ -2.683180e+02 ; -2.402579e+01 ; 6.835614e+02 ];
omc_error_12 = [ 1.291007e-02 ; 1.374392e-02 ; 2.041738e-02 ];
Tc_error_12  = [ 1.010256e+01 ; 2.509259e+01 ; 1.526478e+01 ];

%-- Image #13:
omc_13 = [ -1.875437e+00 ; -1.829992e+00 ; -7.036193e-01 ];
Tc_13  = [ -1.259507e+02 ; -2.247058e+01 ; 6.921226e+02 ];
omc_error_13 = [ 1.129097e-02 ; 1.409761e-02 ; 2.075988e-02 ];
Tc_error_13  = [ 1.020333e+01 ; 2.509021e+01 ; 1.516622e+01 ];

%-- Image #14:
omc_14 = [ -1.661553e+00 ; -1.786089e+00 ; -5.430307e-01 ];
Tc_14  = [ -1.392322e+02 ; -1.858541e+01 ; 6.872425e+02 ];
omc_error_14 = [ 1.869452e-02 ; 1.448528e-02 ; 1.831940e-02 ];
Tc_error_14  = [ 1.003536e+01 ; 2.484385e+01 ; 1.375991e+01 ];

%-- Image #15:
omc_15 = [ -1.644633e+00 ; -1.825408e+00 ; -4.349182e-01 ];
Tc_15  = [ -1.573371e+02 ; -4.233336e+01 ; 7.132280e+02 ];
omc_error_15 = [ 1.991517e-02 ; 1.397846e-02 ; 1.776239e-02 ];
Tc_error_15  = [ 1.036079e+01 ; 2.609754e+01 ; 1.340820e+01 ];

