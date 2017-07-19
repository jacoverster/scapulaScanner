function deB_I = debruijn_image(col,row,savefile) 
%This function creates a colxrow de Bruijn image  using 7 colours and a pre-determined pixel-width for each colour band. 
%savefile is binary 1(yes) or 0(no).
%It is dependant on the debruijn_generator function.

bandW = 7; %an average pixel width of 7 is used for each colour band

%number of required bands is computed, to a allowed max = 125 and min = 27.
val = ceil(col/bandW);

if val <= 5^3
    n = 5;
%elseif val <= 5^3 - commented out because black was removed n = 6 was
%dropped to ensure quick sequence generation.
%    n = 5;
elseif val <= 4^3
    n = 4;
else
    n = 3;
end

%Generate the de Bruijn sequence using the debruijn_generator function
deBseq = debruijn_sequence(n,3); %using the modified debruijn_generator function

%Create an empty image array
deB_I = zeros(row,col,3);

%Create colour array using 7 colours, green was emitted due to colour
%cross-talk mentioned by Zhang et al.
colM =  [1 1 0;   %yellow
        1 0 1;   %magenta
        0 1 1;   %cyan
        1 0 0;   %red
        0 1 0;   %green
        0 0 1];   %blue
        %0 0 0];  %black was removed to ensure a more even intensity
        %distribution across the image.

%{
%Perform the XOR operation
deBcol = zeros(n^3,3);
colpattern = zeros(n^3,3);

for i = 1:125
    deBcol(i,:) = colM(deBseq(i),:);
end

colpattern(1,:) = deBcol(1,:);

i = 1;
j = 1;
while j < 124
    
    for j = j:(j+2)
        if sum(xor(colpattern(i,:),deBcol(j,:))) == 2
             colpattern(i+1,:) = xor(colpattern(i,:),deBcol(j,:));
        end
    end
    
    colpattern(i+1,:) = xor(colpattern(i,:),deBcol(j,:));
    j = j+1;
    i = i+1;
end


%Fill de Bruijn image with a colour value
z_step = bandW - 1;
for x = 1:row
    for y = bandW:bandW:col
        for z = -(z_step:-1:0)
            deB_I(x,y+z,1) = colpattern(y/bandW,1); %colM(deBseq(y/bandW),1);
            deB_I(x,y+z,2) = colpattern(y/bandW,2); %colM(deBseq(y/bandW),2);
            deB_I(x,y+z,3) = colpattern(y/bandW,3); %colM(deBseq(y/bandW),3);
        end
    end
end
%}
deB_I2 = zeros(row,col,3);
z_step = bandW - 1;
for x = 1:row
    for y = bandW:bandW:col
        for z = -(z_step:-1:0)
            deB_I2(x,y+z,1) = colM(deBseq(y/bandW),1);
            deB_I2(x,y+z,2) = colM(deBseq(y/bandW),2);
            deB_I2(x,y+z,3) = colM(deBseq(y/bandW),3);
        end
    end
end

%show the image to check if results are as expected
figure, imshow(deB_I);
figure, imshow(deB_I2);

if ~exist('savefile','var')
    % third parameter does not exist, so default it to something
    savefile = 0;
end

if savefile == 1
    %save the image
    filename = ['debruijn_image_',num2str(col),'x',num2str(row),'.png'];
    imwrite(deB_I, filename) 
else
    %do nothing
end

