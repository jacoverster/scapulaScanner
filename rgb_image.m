function I = rgb_image(col,row,red,green,blue,savefile) 
%This function creates an RGB configured image
%For example I = rgb_image(1024,768,0,0,255,1) will create a blue only image and save the file
%savefile is binary 1(yes) or 0(no).

%Create an empty image array
I = zeros(row,col,3);

for i = 1:row
    for j = 1:col
        I(i,j,1) = red;
        I(i,j,2) = green;
        I(i,j,3) = blue;
    end
end

%show the image to check if results are as expected
figure(10)
imshow(I);

if ~exist('savefile','var')
    % third parameter does not exist, so default it to something
    savefile = 0;
end

if savefile == 1
    %save the image
    filename = ['rgb[',num2str(red),',',num2str(green),',',num2str(blue),']',num2str(col),'x',num2str(row),'.png'];
    imwrite(I, filename) 
else
    %do nothing
end