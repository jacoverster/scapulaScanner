%Considering a full white illuminated image, this is one method of removing
%shadow pixels and making them for exclusion from futher calculations.

clc,clear all, close all
I = imread('cleaned_up_image_(test_skin_2.JPG).png');
I2 = im2double(I);
S = size(I);

GRAY = rgb2gray(I);
figure(1)
imshow (GRAY)

%Normalize the image according to grayscale values and remove dark pixels
%according to a pre-selected threshold value
GRAY_d = double(GRAY);
pn = GRAY_d; 
MAX = max(max(GRAY_d));
MIN = min(min(GRAY_d));
DARK = zeros(S(1),S(2));
threshold = 0.1;

for i = 1:S(1)
    for j = 1:S(2)
        pn(i,j) = (GRAY_d(i,j) - MIN)/(MAX - MIN);
        if pn(i,j) < threshold
           pn(i,j) = NaN;
           DARK(i,j) = 1;
           I2(i,j,:) = NaN;
        else
            pn(i,j) = pn(i,j);
       end
    end
end

figure(2)
imshow(pn)

for i = 1:S(1)-2
    for j = 1:S(2)-2
        dFmax_thin(i+1,j+1) = -I(i+1,j) + 2*I(i+1,j+1) - I(i+1,j+2);
    end
end

figure(3)
imshow(DARK)