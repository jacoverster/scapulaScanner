function pixels = selectPixels(image,nr_of_selections)

x = zeros(nr_of_selections,1);
y = x;

for i = 1:nr_of_selections
    %select a image section
    boundsR = []; 
    figure, imagesc(image); 
    axis image off;
    title('Crop to image section'); drawnow;
    [x1,y1] = ginput(2);
    boundsR = round([min(x1) max(x1) min(y1) max(y1)]);
    hold on;
    plot(boundsR([1 2 2 1 1]),boundsR([3 3 4 4 3]),'r.-'); 
    hold off;
    pause(1);
    close

    %Save cropped image to new variable
    R_zoom = imcrop(image, ...
        [boundsR(1) boundsR(3) (boundsR(2)-boundsR(1)) (boundsR(4)-boundsR(3))]);

    %select a pixel
    figure, imagesc(R_zoom); 
    axis image off;
    title('Select a pixel'); drawnow;
    [x2,y2] = ginput(1); 
    hold off;
    pause(1);
    close
    
    x(i) = min(x1)+x2;
    y(i) = min(y1)+y2;
end

pixels = [round(x) round(y)];
