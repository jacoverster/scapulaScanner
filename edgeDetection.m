function noiseless_EDGE = edgeDetection(I)
%This is the main edge detection algorithm used 
%Input: Image (.JPG)
%Output: EDGE2 variable with detected edges and 2 images plotted to show
%the results visually
%
%Created by: Jaco Verster (versterrie@gmail.com)

%Manual override
%imagename = 'canoncrop.jpg'; 
%I = im2double(imread(imagename));
%figure, imshow(I)

R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);

%create empty variables
S = size(I); %[row col]
EDGE = zeros(S(1),S(2));
GRADmx = [];

%Scan through each row and find local maxima using findpeaks.m
for i = 1:S(1)
    %compute the 1D gradient for each color channel
    grad_R = gradient(R(i,:));
    grad_G = gradient(G(i,:));
    grad_B = gradient(B(i,:));
    
    %compute the sum of the squares of all thre channels
    GRAD = grad_R.^2 + grad_G.^2 + grad_B.^2;
    GRADmx(i,:) = GRAD; %store the gradient calculation
    
    %detecting local maximas with PEAK = peakdet(GRAD,delta); was updated
    %to Matlab's built in findpeaks function on 02/02/2017 to minimize
    %external functions - function is slightly faster than findpeaks for
    %low values of delta

    %Peak detection is done here
    %[pks, locs] = findpeaks(GRAD,'MinPeakDistance',stripewidth-5,...
    %    'MinPeakProminence',0.001); 
    [pks, locs] = findpeaks(GRAD,'MinPeakProminence',0.001,...
        'MinPeakDistance',10); 
    
    PEAK = [locs(:), pks(:)];
    
    if prod(size(PEAK)) ~= 0
        %mark how many peaks were detected
        PEAK_l = length(PEAK(:,1)); 
        %make note of the minimum peak detected
        PEAK_min(i) = min(PEAK(:,2)); 
        %calculate PEAK gradient to view edge distance in pixels
        dPEAK = diff(PEAK); 

        %write all peak values to EDGE 
        for k = 1:PEAK_l
            EDGE(i,PEAK(k,1)) = 1;
        end
        %{       
        %compare two local maximas that are too close and erase the smaller
        for k = 1:PEAK_l-1
            if dPEAK(k) < stripewidth-1
               [loc_max,index] = max(PEAK(k:k+1,2)); 
               EDGE(i,PEAK(k,1)) = 0;
               EDGE(i,PEAK(k+1,1)) = 0;
               EDGE(i,PEAK(k-1+index,1)) = 1;
               PEAK(k+2-index,2) = 0;
            end
        end

        %Mark rows for which all the edges are not detected and show how many
        %edges were detected
        if PEAK_l < expected_edges && PEAK_l > 0
            rows_with_less_edges = rows_with_less_edges + 1;
            WARNINGS(i) = PEAK_l;
        elseif PEAK_l > expected_edges
            rows_with_more_edges = rows_with_more_edges + 1;
            WARNINGS(i) = PEAK_l;
        end
        %}
    end
    
    %clear key variables for next iteration
    clear PEAK, clear dPEAK, clear GRAD 
    clear grad_R, clear grad_G, clear grad_B;
end

%Clean up the edge data by removing isolated pixels from EDGE data: only
%allow pixels that are connected to 10 or more other pixels
noiseless_EDGE = bwareaopen(EDGE,10); 
%{
%CC = bwconncomp(EDGE2); %count number of connected objects

%display edge detection information 
%rows_with_more_edges 
%rows_with_less_edges 
%display(imagename)
%number_of_detected_objects = CC.NumObjects

%Plot local maximas in the middel of the image to confirm good PEAK
%detection
%figure, plot(GRADmx(round(S(1)/2),:),'k')
%}

%before isolated pixel removal
%figure, imshow(EDGE) 

%after isolated pixel removal
%figure('Name','Detected edges'), imshow(noiseless_EDGE)

%Show detected edges 
Iedges = I;
for i=1:S(1)
    for j=1:S(2)
        if noiseless_EDGE(i,j) == 1
            Iedges(i,j,1)=255; Iedges(i,j,2)=0; Iedges(i,j,3)=0;
        end
    end
end

figure('Name','Detected edges shown on image'), imshow(Iedges)



