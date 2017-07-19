function imageCleanup(imagename, savefile)
%This function applies colour correction and non-linear means filtering to
%the input image is defined as "imagename" and savefile is either on (1) or
%off (0).
%
%Created by: Jaco Verster (versterrie@gmail.com)

%Manual override
%imagename = 'capture1.JPG';
%savefile = 0;

%Load the image into memory
I = im2double(imread(imagename));

disp('+++ imageCleanup initialized...')

%% %%%%%Select bounding box%%%%%
disp('+ Select bounding box...')

bounds = []; 
figure, imagesc(I); 
axis image off;
title('Select the bounding box'); drawnow;
[x,y] = ginput(2);
bounds = round([min(x) max(x) min(y) max(y)]);
hold on;
plot(bounds([1 2 2 1 1]),bounds([3 3 4 4 3]),'r.-'); 
hold off;
pause(1);
close

%Save cropped image to new variable
A = imcrop(I, ...
    [bounds(1) bounds(3) (bounds(2)-bounds(1)) (bounds(4)-bounds(3))]);

%% %%%%%Colour correction%%%%%
disp('+ Applying colour correction...')

%%%RED calibration
%select a image section with 3 red section
boundsR = []; 
figure, imagesc(A); 
axis image off;
title('Crop to image section with RED clearly visible'); drawnow;
[x,y] = ginput(2);
boundsR = round([min(x) max(x) min(y) max(y)]);
hold on;
plot(boundsR([1 2 2 1 1]),boundsR([3 3 4 4 3]),'r.-'); 
hold off;
pause(1);
close

%Save cropped image to new variable
R_zoom = imcrop(A, ...
    [boundsR(1) boundsR(3) (boundsR(2)-boundsR(1)) (boundsR(4)-boundsR(3))]);

%select a clear red section
boundsR = []; 
figure, imagesc(R_zoom); 
axis image off;
title('Select a section representative of RED '); drawnow;
[x,y] = ginput(2);
boundsR = round([min(x) max(x) min(y) max(y)]);
hold on;
plot(boundsR([1 2 2 1 1]),boundsR([3 3 4 4 3]),'r.-'); 
hold off;
pause(1);
close

%Save cropped image to new variable
C{1} = imcrop(R_zoom, ...
    [boundsR(1) boundsR(3) (boundsR(2)-boundsR(1)) (boundsR(4)-boundsR(3))]);

%%%GREEN calibration image
%select a image section with 3 green section
boundsG = []; 
figure, imagesc(A); 
axis image off;
title('Crop to image section with GREEN clearly visible'); drawnow;
[x,y] = ginput(2);
boundsG = round([min(x) max(x) min(y) max(y)]);
hold on;
plot(boundsG([1 2 2 1 1]),boundsG([3 3 4 4 3]),'r.-'); 
hold off;
pause(1);
close

%Save cropped image to new variable
G_zoom = imcrop(A, ...
    [boundsG(1) boundsG(3) (boundsG(2)-boundsG(1)) (boundsG(4)-boundsG(3))]);

%select a clear red section
boundsG = []; 
figure, imagesc(G_zoom); 
axis image off;
title('Select a section representative of GREEN'); drawnow;
[x,y] = ginput(2);
boundsG = round([min(x) max(x) min(y) max(y)]);
hold on;
plot(boundsG([1 2 2 1 1]),boundsG([3 3 4 4 3]),'r.-'); 
hold off;
pause(1);
close

%Save cropped image to new variable
C{2} = imcrop(G_zoom, ...
    [boundsG(1) boundsG(3) (boundsG(2)-boundsG(1)) (boundsG(4)-boundsG(3))]);

%%%RED calibration image
%select a image section with 3 red section
boundsB = []; 
figure, imagesc(A); 
axis image off;
title('Crop to image section with BLUE clearly visible'); drawnow;
[x,y] = ginput(2);
boundsB = round([min(x) max(x) min(y) max(y)]);
hold on;
plot(boundsB([1 2 2 1 1]),boundsB([3 3 4 4 3]),'r.-'); 
hold off;
pause(1);
close

%Save cropped image to new variable
B_zoom = imcrop(A, ...
    [boundsB(1) boundsB(3) (boundsB(2)-boundsB(1)) (boundsB(4)-boundsB(3))]);

%select a clear red section
boundsB = []; 
figure, imagesc(B_zoom); 
axis image off;
title('Select a section representative of BLUE'); drawnow;
[x,y] = ginput(2);
boundsB = round([min(x) max(x) min(y) max(y)]);
hold on;
plot(boundsB([1 2 2 1 1]),boundsB([3 3 4 4 3]),'r.-'); 
hold off;
pause(1);
close

%Save cropped image to new variable
C{3} = imcrop(B_zoom, ...
    [boundsB(1) boundsB(3) (boundsB(2)-boundsB(1)) (boundsB(4)-boundsB(3))]);

%Calculate Ainv colour albedo matrix
cam_colors = []; proj_colors = []; projValue = 1;
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

%Apply colour correction with this new Ainv value
%Allocate memory 
COL = zeros(3,1);

%Apply colour correction to cropped image section only
for i = bounds(3):bounds(4)
    for j = bounds(1):bounds(2)
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

%Save colour corrected image data
B = imcrop(I, ...
    [bounds(1) bounds(3) (bounds(2)-bounds(1)) (bounds(4)-bounds(3))]);

%% %%%%%Noise filtering%%%%%
disp('+ Applying Non-linear means filter...')

%Crop out the bounded section for filtering and convert to 'double'
C = imcrop(I, ...
    [bounds(1) bounds(3) (bounds(2)-bounds(1)) (bounds(4)-bounds(3))]);

%Load path where noise filtering function is stored
addpath(['/Users/jacoverster/Documents/My Documents/BME/SLS Software/'...
    'Matlab toolboxes/toolbox_nlmeans_version2']);

%Noise filtering function settings
Options.kernelratio = 4;
Options.windowratio = 4;
Options.verbose = true;
Options.filterstrength = 0.1;

%Filter operation
J = NLMF(C,Options);

%Write cropped and filtered data back into image
for y = bounds(1):bounds(2)
    for x = bounds(3):bounds(4)
        I(x,y,:) = J(x-bounds(3)+1,y-bounds(1)+1,:);  
    end
end

%% %%%%%Remove dark pixels%%%%%
threshold = 0.05;
disp(['+ Removing dark pixels (with threshold = '...
    ,num2str(threshold),')...'])

%Allocate memory for variables
S = size(I);
DARK = zeros(S(1),S(2));
GRAY = rgb2gray(I);
GRAY_d = double(GRAY); 
MAX = max(max(GRAY_d));
MIN = min(min(GRAY_d));

for j = bounds(1):bounds(2)
    for i = bounds(3):bounds(4)
        pn = (GRAY_d(i,j) - MIN)/(MAX - MIN);
        if pn < threshold
           DARK(i,j) = 1;
           I(i,j,:) = NaN;
       end
    end
end

%% %%%%%Display results%%%%%
disp('+ Displaying results...')
figure,
subplot(2,2,1),imshow(A); title('Original image')
subplot(2,2,2),imshow(B); title('Colour corrected image')
subplot(2,2,3),imshow(J); title('Non-linear means filtered image')
subplot(2,2,4),imshow(DARK(bounds(3):bounds(4),bounds(1):bounds(2)));...
    title('Dark pixels that were removed')

%% %%%%%Save data%%%%%
disp('+ Saving data...')
if ~exist('savefile','var')
    % second parameter does not exist, so default it to something
    savefile = 0;
end

if savefile == 1
    %save the image as a .png file
    imwrite(I, ['cleaned_up_image_(',imagename,').png']);
    %save the image, cropped image and bounds data in a .mat file
    Icrop = imcrop(I, ...
        [bounds(1) bounds(3) (bounds(2)-bounds(1)) (bounds(4)-bounds(3))]);
    save(['cleaned_up_image_(',imagename,').mat'], 'I', 'Icrop','bounds');
else
    %do nothing
end

disp('++ imageCleanup Done!')
  