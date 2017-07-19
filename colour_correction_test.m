clear all, clc, close all
I = imread('test_skin_crop.jpg');
figure(10)
imshow(I)

%using im2doube
%A = [0.5515    0.0108    0.0178; 0.2443    0.6903    0.1441; 0.0989    0.1458    0.6590];
%F = [1.1464         0         0; 0   0.4283         0; 0         0    0.8636];
%O = [0.0035;0.0064;0.0050];
%with normilization
%A = [0.7901    0.0154    0.0255; 0.2884    0.8149    0.1701; 0.1162    0.1714    0.7744];
%F = [0.8825         0         0; 0    0.4662         0; 0         0    0.8333];
%O = [0.0077;0.0140;0.0109];
% without nomalization
A = [140.6352    2.7426    4.5462;62.2992  176.0273   36.7510;25.2230   37.1916  168.0489];
F = [0.0045         0         0;0    0.0017         0;0         0    0.0034];
O = [0.8956;1.6246;1.2647];
Ainv = inv(A);
Oinv = Ainv*O;

S = size(I);
COL = zeros(3,1);
%I = zeros(S(1),S(2),3);

for i = 1:S(1)
    for j = 1:S(2)
        COL(1) = (double(I(i,j,1)));
        COL(2) = (double(I(i,j,2)));
        COL(3) = (double(I(i,j,3)));
        
        rgb = rgb_crosstalk(COL,Ainv,F,Oinv);
        
        I(i,j,1) = rgb(1);
        I(i,j,2) = rgb(2);
        I(i,j,3) = rgb(3);
    end
end

figure(12)
imshow(I)

filename = 'color_corrected_cal_deB_small.png';
imwrite(I, filename)
