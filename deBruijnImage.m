%function deB_I = deBruijnImage(col,row,colPixels,savefile)
%This function creates a col x row de Bruijn image  using 6 colours 
%and a specified pixel-width for each colour band. A deBruijn pattern
%with k = 3 (the effective number of colours is 3 because of the XOR == 2
%requirement which means that each colour can effectively only be followed 
%by two other colours. n = 5 is used to give enough stripes.  
%A maximum of 243 (3^5) colour stripes can be used
%
%Variables:
%col/row = number of columns/rows
%colPixels = pixel width of each colour stripe
%Savefile is binary 1(yes) or 0(no)
%
%Created by: Jaco Verster (versterrie@gmail.com)
 
%Check stripe limit
val = ceil(col/colPixels);
if val >= 244
    disp(['ERROR: number of requested stripes (col/colPixels) is '...
        'too high! Lower col or increase colPixels'])
end

%specify resolution
%col = 70;
%row = 20;
%colPixels = 13;

%create memory for the image
deB_I = zeros(row,col,3); 

%Create colour array using 6 colours (black and white was removed)
colM =  [1 1 0;  %yellow
        1 0 1;   %magenta
        0 1 1;   %cyan
        1 0 0;   %red
        0 1 0;   %green
        0 0 1];  %blue

%XOR operation for the specified deBruijn pattern. 
debruijn = [0,0,0,0,0,1,0,0,0,0,2,0,0,0,1,1,0,0,0,1,2,0,0,0,2,1,0,0,0,...
    2,2,0,0,1,0,1,0,0,1,0,2,0,0,1,1,1,0,0,1,1,2,0,0,1,2,1,0,0,1,2,2,0,...
    0,2,0,1,0,0,2,0,2,0,0,2,1,1,0,0,2,1,2,0,0,2,2,1,0,0,2,2,2,0,1,0,1,...
    1,0,1,0,1,2,0,1,0,2,1,0,1,0,2,2,0,1,1,0,2,0,1,1,1,1,0,1,1,1,2,0,1,...
    1,2,1,0,1,1,2,2,0,1,2,0,2,0,1,2,1,1,0,1,2,1,2,0,1,2,2,1,0,1,2,2,2,...
    0,2,0,2,1,0,2,0,2,2,0,2,1,1,1,0,2,1,1,2,0,2,1,2,1,0,2,1,2,2,0,2,2,...
    1,1,0,2,2,1,2,0,2,2,2,1,0,2,2,2,2,1,1,1,1,1,2,1,1,1,2,2,1,1,2,1,2,...
    1,1,2,2,2,1,2,1,2,2,1,2,2,2,2,2];
pattern = zeros(1,length(debruijn));
pattern(1) = 1;
for i = 2:length(debruijn)
	if pattern(i-1) == 0
		if debruijn(i) == 0
			pattern(i) = 1;
        elseif debruijn(i) == 1
			pattern(i) = 2;
        elseif debruijn(i) == 2
            pattern(i) = 3;
        end
			
    elseif pattern(i-1) == 1
        if debruijn(i) == 0
            pattern(i) = 2;
        elseif debruijn(i) == 1
            pattern(i) = 0;
        elseif debruijn(i) == 2
            pattern(i) = 4;
        end
			
    elseif pattern(i-1) == 2
        if debruijn(i) == 0
            pattern(i) = 5;
        elseif debruijn(i) == 1
            pattern(i) = 1;
        elseif debruijn(i) == 2
            pattern(i) = 0;
        end
			
    elseif pattern(i-1) == 3
        if debruijn(i) == 0
            pattern(i) = 4;
        elseif debruijn(i) == 1
            pattern(i) = 5;
        elseif debruijn(i) == 2
            pattern(i) = 0;
        end
			
    elseif pattern(i-1) == 4
        if debruijn(i) == 0
            pattern(i) = 3;
        elseif debruijn(i) == 1
            pattern(i) = 1;
        elseif debruijn(i) == 2
            pattern(i) = 5;
        end
			
    elseif pattern(i-1) == 5
        if debruijn(i) == 0
            pattern(i) = 4;
        elseif debruijn(i) == 1
            pattern(i) = 3;
        elseif debruijn(i) == 2
            pattern(i) = 2;
        end
    end
end

%Fill in the colours
stripeColors = zeros(length(debruijn),3);
for i = 1:length(debruijn)
    if pattern(i) == 0
        stripeColors(i,1) = 0;
        stripeColors(i,2) = 0; 
        stripeColors(i,3) = 1;

    elseif pattern(i) == 1
        stripeColors(i,1) = 0;
        stripeColors(i,2) = 1; 
        stripeColors(i,3) = 0;

    elseif pattern(i) == 2
        stripeColors(i,1) = 1;
        stripeColors(i,2) = 0; 
        stripeColors(i,3) = 0;

    elseif pattern(i) == 3
        stripeColors(i,1) = 1;
        stripeColors(i,2) = 1; 
        stripeColors(i,3) = 0;

    elseif pattern(i) == 4
        stripeColors(i,1) = 1;
        stripeColors(i,2) = 0; 
        stripeColors(i,3) = 1;

    elseif pattern(i) == 5
        stripeColors(i,1) = 0;
        stripeColors(i,2) = 1; 
        stripeColors(i,3) = 1;
    end
end

%Create the image values
z_step = colPixels - 1;
for x = 1:row
    for y = colPixels:colPixels:col
        for z = -(z_step:-1:0)
            deB_I(x,y+z,1) = stripeColors(y/colPixels,1)*255;
            deB_I(x,y+z,2) = stripeColors(y/colPixels,2)*255;
            deB_I(x,y+z,3) = stripeColors(y/colPixels,3)*255;
        end
    end
end

figure, imshow(deB_I)

if ~exist('savefile','var')
    % third parameter does not exist, so default it to something
    savefile = 0;
end

if savefile == 1
    %save the image
    filename = ['debruijn_image_',num2str(row),'x',num2str(col),'x',...
        num2str(colPixels),'.png'];
    imwrite(deB_I, filename) 
else
    %do nothing
end
