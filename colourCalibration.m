%mlStructured light method - this method seems to be simpler and provide better
%calibration...testing needed

% Extract projector-camera color correspondences.

%Specify the path and filenames for the R, G & B images
addpath('/Users/jacoverster/Desktop/Test_color_calib/light_off')

C{1} = imread('red.jpg');
C{2} = imread('green.jpg');
C{3} = imread('blue.jpg');

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

Ainv = inv(cam_colors/proj_colors);

save(['colour_calibration.mat'], 'Ainv')
