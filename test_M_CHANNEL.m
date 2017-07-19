%test the application of an M-channel as per the article by Pages:
%"Optimised de Bruijn patterns for one-shot shape acquisition"
clc, clear all, close all

%load the camera image
load('cleaned_up_image_(test_skin.JPG).mat') %data from imageCleanup.m
I = Icrop;
stripewidth = 16;

%separate colour channels
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);

%create empty variables
S = size(I); %[row col]
EDGE1 = zeros(S(1),S(2));
EDGE2 = zeros(S(1),S(2));
GRADmx = [];

%Create the M-channel information
%Definition: M(r,c) = max(R(i),G(i),B(i))
M = zeros(S(1),S(2));
for row = 1:S(1)
    for col = 1:S(2)
        M(row,col) = max([R(row,col),G(row,col),B(row,col)]);
    end
end


%Scan through each row and find local maxima
for i = 1:S(1)
    %compute the 1D gradient for each color channel
    grad_R = gradient(R(i,:));
    grad_G = gradient(G(i,:));
    grad_B = gradient(B(i,:));
    grad_M = gradient(M(i,:));
    
    %compute the sum of the squares of all thre channesl
    GRAD1 = grad_R.^2 + grad_G.^2 + grad_B.^2;
    GRAD2 = grad_R.^2 + grad_G.^2 + grad_B.^2 + grad_M.^2;
    
    %detect local maximas
    %PEAK = peakdet(GRAD,delta); %was updated to Matlab's built in findpeaks
    %function on 02/02/2017 to minimize external functions - function is
    %slightly faster than findpeaks for low values of delta

    [pks1, locs1] = findpeaks(GRAD1,'MinPeakDistance',stripewidth-5);
    [pks2, locs2] = findpeaks(GRAD2,'MinPeakDistance',stripewidth-5);
    
    PEAK1 = [locs1(:), pks1(:)];
    PEAK2 = [locs2(:), pks2(:)];
    
    if prod(size(PEAK1)) ~= 0
        PEAK_l1 = length(PEAK1(:,1)); %mark how many peaks were detected
        PEAK1_min(i) = min(PEAK1(:,2)); %make note of the minimum peak detected
        dPEAK1 = diff(PEAK1); %calculate PEAK gradient to view edge distance in pixels

        %write all peak values to EDGE 
        for k = 1:PEAK_l1
            EDGE1(i,PEAK1(k,1)) = 1;
        end
    end
    
    if prod(size(PEAK2)) ~= 0
        PEAK_l2 = length(PEAK2(:,1)); %mark how many peaks were detected
        PEAK2_min(i) = min(PEAK2(:,2)); %make note of the minimum peak detected
        dPEAK2 = diff(PEAK2); %calculate PEAK gradient to view edge distance in pixels

        %write all peak values to EDGE 
        for k = 1:PEAK_l2
            EDGE2(i,PEAK2(k,1)) = 1;
        end
    end
    %clear all for next iteration
    clear PEAK, clear dPEAK, clear GRAD, clear grad_R, clear grad_G, clear grad_B;
end

%Plot figures
figure(1), imshow(EDGE1) %plot data without M-channel in figure 1
figure(2), imshow(EDGE2) %plot data with M-channel in figure 2

%plot all channel gradients for the first row
grad_R = gradient(R(1,:));
grad_G = gradient(G(1,:));
grad_B = gradient(B(1,:));
grad_M = gradient(M(1,:));

figure(3), hold
plot(grad_R(1,:),'r')
plot(grad_G(1,:),'g')
plot(grad_B(1,:),'b')
plot(grad_M(1,:),'k')
hold off

%Conclusion: data without m-channel theory looks smoother overall, I choose
%not to make use of it.