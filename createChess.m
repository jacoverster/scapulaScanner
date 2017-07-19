clear, clc, close all

I = zeros(600,800,3);

for y = 91:180:600
    for x = 1:180:800
        I(y:(y+89),x:(x+89),:) = 255;
    end
end

for y = 1:180:600
    for x = 91:180:800
        I(y:(y+89),x:(x+89),:) = 255;
    end
end

I = I(1:600,1:800,:);

imshow(I)
imwrite(I, 'chess600x800.png');