% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 4215.393343086064306 ; 4227.384041625457940 ];

%-- Principal point:
cc = [ 1756.019034219467585 ; 1177.795234302538120 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.076253405412887 ; 0.062357434428752 ; 0.000676383208731 ; -0.002330640982479 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 29.699869217364128 ; 29.621904041826607 ];

%-- Principal point uncertainty:
cc_error = [ 16.141116723278500 ; 12.309203334110309 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.016545817656911 ; 0.178990512054178 ; 0.000735436261535 ; 0.000993033248489 ; 0.000000000000000 ];

%-- Image size:
nx = 3456;
ny = 2304;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 10;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ -2.092561e+00 ; -2.125307e+00 ; 4.280981e-02 ];
Tc_1  = [ -7.661299e+01 ; -7.222713e+01 ; 5.089904e+02 ];
omc_error_1 = [ 2.550695e-03 ; 2.753644e-03 ; 5.388543e-03 ];
Tc_error_1  = [ 1.950593e+00 ; 1.487442e+00 ; 3.625242e+00 ];

%-- Image #2:
omc_2 = [ -2.161655e+00 ; -2.225678e+00 ; 1.995560e-01 ];
Tc_2  = [ -8.450351e+01 ; -8.162875e+01 ; 5.206606e+02 ];
omc_error_2 = [ 2.803044e-03 ; 2.533218e-03 ; 5.631587e-03 ];
Tc_error_2  = [ 1.993840e+00 ; 1.513717e+00 ; 3.664160e+00 ];

%-- Image #3:
omc_3 = [ -1.895549e+00 ; -2.100130e+00 ; 2.445283e-01 ];
Tc_3  = [ -5.589416e+01 ; -7.841563e+01 ; 5.218749e+02 ];
omc_error_3 = [ 2.656804e-03 ; 2.812568e-03 ; 4.579790e-03 ];
Tc_error_3  = [ 1.999652e+00 ; 1.517541e+00 ; 3.558060e+00 ];

%-- Image #4:
omc_4 = [ -2.165421e+00 ; -2.180872e+00 ; 8.477570e-02 ];
Tc_4  = [ -8.003961e+01 ; -6.976909e+01 ; 5.033230e+02 ];
omc_error_4 = [ 2.611911e-03 ; 2.643540e-03 ; 5.693676e-03 ];
Tc_error_4  = [ 1.928742e+00 ; 1.468703e+00 ; 3.575901e+00 ];

%-- Image #5:
omc_5 = [ -2.063166e+00 ; -2.217455e+00 ; 3.689985e-02 ];
Tc_5  = [ -6.085892e+01 ; -8.983526e+01 ; 5.242509e+02 ];
omc_error_5 = [ 2.614974e-03 ; 2.924825e-03 ; 5.814636e-03 ];
Tc_error_5  = [ 2.014353e+00 ; 1.532490e+00 ; 3.722141e+00 ];

%-- Image #6:
omc_6 = [ 2.227883e+00 ; 2.103468e+00 ; 3.198466e-01 ];
Tc_6  = [ -7.671507e+01 ; -8.454201e+01 ; 4.971156e+02 ];
omc_error_6 = [ 2.846675e-03 ; 2.304579e-03 ; 5.401848e-03 ];
Tc_error_6  = [ 1.928657e+00 ; 1.453598e+00 ; 3.572398e+00 ];

%-- Image #7:
omc_7 = [ -1.889797e+00 ; -2.094859e+00 ; 2.138345e-01 ];
Tc_7  = [ -7.507825e+01 ; -9.911837e+01 ; 5.299915e+02 ];
omc_error_7 = [ 2.692457e-03 ; 2.750469e-03 ; 4.756265e-03 ];
Tc_error_7  = [ 2.037932e+00 ; 1.544743e+00 ; 3.648910e+00 ];

%-- Image #8:
omc_8 = [ -2.024872e+00 ; -2.183409e+00 ; 1.782830e-01 ];
Tc_8  = [ -5.583152e+01 ; -8.659790e+01 ; 5.340098e+02 ];
omc_error_8 = [ 2.686746e-03 ; 2.799390e-03 ; 5.369134e-03 ];
Tc_error_8  = [ 2.047469e+00 ; 1.553176e+00 ; 3.742207e+00 ];

%-- Image #9:
omc_9 = [ -1.698699e+00 ; -2.177752e+00 ; 1.175371e-01 ];
Tc_9  = [ -6.328121e+01 ; -1.452623e+02 ; 5.725577e+02 ];
omc_error_9 = [ 2.495354e-03 ; 2.968208e-03 ; 4.827598e-03 ];
Tc_error_9  = [ 2.217560e+00 ; 1.673724e+00 ; 3.989823e+00 ];

%-- Image #10:
omc_10 = [ -2.175143e+00 ; -2.202040e+00 ; 1.110068e-01 ];
Tc_10  = [ -6.093090e+01 ; -8.327573e+01 ; 5.240714e+02 ];
omc_error_10 = [ 2.724251e-03 ; 2.712125e-03 ; 5.975648e-03 ];
Tc_error_10  = [ 2.011028e+00 ; 1.525057e+00 ; 3.696542e+00 ];

