%mlStructured light method - this method seems to be simpler and provide better
%calibration...testing needed
% Extract projector-camera color correspondences.
addpath('/Users/jacoverster/Desktop/Test_color_calib/light_off')

%Ainv_original =
%    1.8297   -0.0189   -0.0454
%   -0.6188    1.5252   -0.3168
%   -0.1377   -0.3347    1.5943
   
C{1} = imread('red.jpeg');
C{2} = imread('green.jpeg');
C{3} = imread('blue.jpeg');

   cam_colors = []; proj_colors = []; projValue = 255;
   for j = 1:3
      crop_C = C{j};
      crop_C = double(reshape(crop_C,[],3,1)');
      crop_P = zeros(size(crop_C));
      cam_colors = [cam_colors crop_C];
      if j == 1
         crop_P(1,:) = projValue; %Original code modified to account for 1 camera only
      elseif j == 2
         crop_P(2,:) = projValue;
      else
         crop_P(3,:) = projValue;
      end
      proj_colors = [proj_colors crop_P];
   end
    inv_color_calib_cam = inv(cam_colors/proj_colors);
%    figure(11); 
%       plot([cam_colors(:,1:1e3:end); proj_colors(:,1:1e3:end)]'); grid on;
%    figure(12); drawnow;
%       plot([inv_color_calib_cam*cam_colors(:,1:1e3:end); ...
%          proj_colors(:,1:1e3:end)]'); grid on; drawnow;
%    
     Ainv = inv_color_calib_cam
%      CamImg = imread('test_skin.JPG');
%      Cam = double(reshape(CamImg,[],3,1)');
%      ColCamCor = Ainv*Cam;
%       figure(12)
%       plot([ColCamCor(:,1:1e3:end)]')
%      figure(13)
%      plot([Cam(:,1:1e3:end)]')
     
     
%Do colour correction with this new Ainv value
I = im2double(imread('test_skin_crop.jpg'));
Iorig = I;
%figure, imshow(I)

%S = size(I);
COL = zeros(3,1);
S = size(I);
%Define variable
bounds = [];

%{
%Initiate box selection
figure(10); clf;
imagesc(I); axis image off;
title('Select the bounding box'); drawnow;
[x,y] = ginput(2);
bounds = round([min(x) max(x) min(y) max(y)]);
hold on;
plot(bounds([1 2 2 1 1]),bounds([3 3 4 4 3]),'r.-'); 
hold off;
close
%}
for i = 1:S(1);%bounds(3):bounds(4)%
    for j = 1:S(2);%bounds(1):bounds(2)
        COL(1) = I(i,j,1);
        COL(2) = I(i,j,2);
        COL(3) = I(i,j,3);
        
        rgb = Ainv*COL;
        
        for k = 1:3
            if rgb(k) <= 0
                rgb(k) = 0;
            elseif rgb(k) >= 1
                rgb(k) = 1;
            end
        end
        
        I(i,j,1) = rgb(1);
        I(i,j,2) = rgb(2);
        I(i,j,3) = rgb(3);
    end
end

figure, imshow(I)
figure, imshow(Iorig)

% Iflat = double(reshape(I,[],3,1)');
% figure(15)
%      plot([Iflat(:,1:1e3:end)]') 

filename = 'color_corrected_test_skin_crop(skin albedo).png';
imwrite(I, filename)