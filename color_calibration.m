clc, clear all, close all


%Import calibration images - these need to be aquired during the setup and
%calibration stage, save them with the following filenames:
R = im2double(imread('cal_r.jpg'));    %Red colour image projection
G = im2double(imread('cal_g.jpg'));    %Green colour image projection
B = im2double(imread('cal_b.jpg'));    %Blue colour image projection
W = im2double(imread('cal_w.jpg'));    %White image projection
K = im2double(imread('cal_k.jpg'));    %Black image projection

%Normalize each image
%R = (I_R-min(min(min(I_R))))/(max(max(max(I_R)))-min(min(min(I_R))));
%G = (I_G-min(min(min(I_G))))/(max(max(max(I_G)))-min(min(min(I_G))));
%B = (I_B-min(min(min(I_B))))/(max(max(max(I_B)))-min(min(min(I_B))));
%W = (I_W-min(min(min(I_W))))/(max(max(max(I_W)))-min(min(min(I_W))));
%K = (I_K-min(min(min(I_K))))/(max(max(max(I_K)))-min(min(min(I_K))));

%Construct the calibration matrices:A, P and O according to Caspi et al. 1998 
%Define variables:A
A = zeros(3);               %color crosstalk matrix
O = zeros(3,1);             %ambient camera readings
Sw = zeros(3,1);            %what the camera sees under full illumination
F = zeros(3);

%Construct the average colour values into the matrices
for i = 1:3
    A(1,i) = mean2(R(:,:,i));
    A(2,i) = mean2(G(:,:,i));
    A(3,i) = mean2(B(:,:,i));
    O(i) = mean2(K(:,:,i));
    Sw(i) = mean2(W(:,:,i));
end

%Calculate the albedo matrix variables
Ainv = inv(A);
Oi = Ainv*O;
Si = Ainv*Sw;

for j = 1:3
    F(j,j) = (Si(j) - Oi(j))/255; %projected colors under full illumination = [1; 1; 1]    
end

%check if matrix multiplication was done correctly - this should be the
%same as Sw
Swcheck = Sw - (A*F*[255; 255; 255]+O)

%Test calibration
Cnew = Sw; %newly generated fake camera observation
P = zeros(3,1); %projected values to be calculated

%Calculate the projected values P
Ci = Ainv*Cnew;

for j = 1:3
    P(j) = (Ci(j) - Oi(j))/F(j,j);
end

A
F
O