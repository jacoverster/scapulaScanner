%This script separates the blue and red channels for easy camera-projector
%calibration

%Go to images location
images_loc = '/Users/jacoverster/Desktop/Test_scan_data/2017_09_12/';

nr_of_images = 13;
image_basename = 'canon';
fileType = '.JPG';

disp('Writing images...')
for i = 1:nr_of_images
    cd(images_loc)
    I = imread(strcat(image_basename,num2str(i),fileType));
    R = I(:,:,1);
    B = I(:,:,3);
    cd '/Users/jacoverster/Desktop/Test_scan_data/2017_09_12/camCal'
    imwrite(R, [image_basename,num2str(i),'.jpg']);
    
    cd '/Users/jacoverster/Desktop/Test_scan_data/2017_09_12/projCal'
    imwrite(B, [image_basename,num2str(i),'.jpg']);
    disp(['Image ',num2str(i),' of ',num2str(nr_of_images),' done.'])
end

cd '/Users/jacoverster/Documents/MATLAB'
    