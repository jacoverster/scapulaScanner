%This script converts a black and white checkered image to a red, green or 
%blue colour

%Choose colour (note if == 1 then the image will contain that colour)
red = 1;
green = 0;
blue = 0;

%Load image and separate the colour channels
image_basename = 'chess600x800';
fileType = '.png';
I = imread(strcat(image_basename,fileType));
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);

ImSize = size(R);

[row,col] = find(I < 200);

if red == 1 && green == 0 && blue == 0
    R(R<200) = 255;
    G(G<200) = 0;
    B(B<200) = 0;
    newColour = 'r';
elseif green == 1 && red == 0 && blue == 0
    R(R<200) = 0;
    G(G<200) = 255;
    B(B<200) = 0;
    newColour = 'g';
elseif blue == 1 && red == 0 && green == 0
    R(R<200) = 0;
    G(G<200) = 0;
    B(B<200) = 255;
    newColour = 'b';
end

I(:,:,1) = R;
I(:,:,2) = G;
I(:,:,3) = B;
        
imshow(I)
imwrite(I, [image_basename,'_',newColour,'.png']);