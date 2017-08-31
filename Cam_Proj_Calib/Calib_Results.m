% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 4479.538169450476744 ; 4490.490397321253113 ];

%-- Principal point:
cc = [ 1779.165388866011426 ; 1113.469234998891125 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.092744523216108 ; 0.264451144312545 ; -0.000310996367269 ; 0.001132415071789 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 37.359597641349708 ; 35.696410398174940 ];

%-- Principal point uncertainty:
cc_error = [ 19.559700453016958 ; 22.682852371989597 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.017184051829629 ; 0.257472804875798 ; 0.000749365492209 ; 0.000907411122689 ; 0.000000000000000 ];

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
omc_1 = [ -1.967600e+00 ; -1.861024e+00 ; 6.817891e-02 ];
Tc_1  = [ -1.629309e+02 ; -7.035775e+01 ; 8.145280e+02 ];
omc_error_1 = [ 3.903672e-03 ; 3.248637e-03 ; 3.946313e-03 ];
Tc_error_1  = [ 3.492854e+00 ; 4.156623e+00 ; 6.541194e+00 ];

%-- Image #2:
omc_2 = [ -1.921493e+00 ; -1.826464e+00 ; 1.251286e-01 ];
Tc_2  = [ -1.591397e+02 ; -6.977335e+01 ; 8.222506e+02 ];
omc_error_2 = [ 4.155383e-03 ; 3.250426e-03 ; 3.806122e-03 ];
Tc_error_2  = [ 3.521917e+00 ; 4.190288e+00 ; 6.469279e+00 ];

%-- Image #3:
omc_3 = [ -2.076169e+00 ; -1.913530e+00 ; -1.353290e-01 ];
Tc_3  = [ -1.702485e+02 ; -5.679128e+01 ; 7.814875e+02 ];
omc_error_3 = [ 3.003912e-03 ; 3.380592e-03 ; 4.478972e-03 ];
Tc_error_3  = [ 3.385175e+00 ; 4.007309e+00 ; 6.635198e+00 ];

%-- Image #4:
omc_4 = [ -1.885184e+00 ; -1.741493e+00 ; 5.277787e-02 ];
Tc_4  = [ -1.380956e+02 ; -7.255367e+01 ; 8.451784e+02 ];
omc_error_4 = [ 4.023219e-03 ; 3.348119e-03 ; 3.718696e-03 ];
Tc_error_4  = [ 3.638351e+00 ; 4.320759e+00 ; 6.694418e+00 ];

%-- Image #5:
omc_5 = [ -1.961275e+00 ; -1.799668e+00 ; -3.607674e-02 ];
Tc_5  = [ -1.520736e+02 ; -7.655507e+01 ; 8.326802e+02 ];
omc_error_5 = [ 3.652860e-03 ; 3.387517e-03 ; 3.846138e-03 ];
Tc_error_5  = [ 3.590199e+00 ; 4.272884e+00 ; 6.812545e+00 ];

%-- Image #6:
omc_6 = [ -1.966827e+00 ; -1.811800e+00 ; -9.637768e-02 ];
Tc_6  = [ -1.804355e+02 ; -4.857563e+01 ; 7.694330e+02 ];
omc_error_6 = [ 3.479264e-03 ; 3.508277e-03 ; 3.948996e-03 ];
Tc_error_6  = [ 3.312975e+00 ; 3.940308e+00 ; 6.385108e+00 ];

%-- Image #7:
omc_7 = [ -1.975373e+00 ; -1.799313e+00 ; -1.341207e-01 ];
Tc_7  = [ -9.555010e+01 ; -8.335110e+01 ; 9.020539e+02 ];
omc_error_7 = [ 3.291520e-03 ; 3.491082e-03 ; 3.818300e-03 ];
Tc_error_7  = [ 3.920948e+00 ; 4.643717e+00 ; 7.561870e+00 ];

%-- Image #8:
omc_8 = [ -1.948359e+00 ; -1.855162e+00 ; 5.279698e-02 ];
Tc_8  = [ -8.093870e+01 ; -9.695742e+01 ; 9.175443e+02 ];
omc_error_8 = [ 3.881668e-03 ; 3.346018e-03 ; 3.756559e-03 ];
Tc_error_8  = [ 3.973504e+00 ; 4.689272e+00 ; 7.362844e+00 ];

%-- Image #9:
omc_9 = [ -1.941250e+00 ; -1.794811e+00 ; -2.314940e-02 ];
Tc_9  = [ -7.402420e+01 ; -9.706382e+01 ; 9.186293e+02 ];
omc_error_9 = [ 3.660278e-03 ; 3.370756e-03 ; 3.675951e-03 ];
Tc_error_9  = [ 3.989654e+00 ; 4.715099e+00 ; 7.477382e+00 ];

%-- Image #10:
omc_10 = [ -1.947550e+00 ; -1.787159e+00 ; -4.707478e-03 ];
Tc_10  = [ -7.934475e+01 ; -9.704544e+01 ; 9.226518e+02 ];
omc_error_10 = [ 3.727199e-03 ; 3.341537e-03 ; 3.681738e-03 ];
Tc_error_10  = [ 4.003798e+00 ; 4.731687e+00 ; 7.477960e+00 ];

%-- Image #11:
omc_11 = [ -1.930356e+00 ; -1.769588e+00 ; -1.273079e-02 ];
Tc_11  = [ -1.404659e+02 ; -6.986276e+01 ; 8.309985e+02 ];
omc_error_11 = [ 3.781131e-03 ; 3.393859e-03 ; 3.761939e-03 ];
Tc_error_11  = [ 3.582582e+00 ; 4.255826e+00 ; 6.726076e+00 ];

