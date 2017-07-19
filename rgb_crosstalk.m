function rgb = rgb_crosstalk(RGB,Ainv,F,Oinv)
%Applies a colour correctio from Caspi et al. 1998 in attempt to decrease
%crosstalk between R G B parts of the cameraCCD.
%RGB is the input signal as percieved by the camera
%Col is the colours with crosstalk removed
%
%Variables:
% Ain is the inverse of the 3x3 camera colour matrix
% F is the 3x3 diagonal matrix with the albedo variables
% Oi is the inverse of the 3x1 ambient  colour
% RGB should be a 3x1 matrix with [R; G; B] and rgb output will be in the
% similar format

%Run the color_calibration.m script to obtain the  required variables

%Ainv = inv(A);
Cinv = Ainv*RGB;
%Oi = Ainv*O;

rgb = zeros(3,1);
for j = 1:3
    rgb(j) = (Cinv(j) - Oinv(j))/F(j,j);
    if rgb(j) <= 164
        rgb(j) = 0;A
    elseif rgb(j) >= 255
        rgb(j) = 255;
    end
end
