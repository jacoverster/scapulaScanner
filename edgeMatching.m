function edgeMatching(imagename, orientation, savefile)
% This is the main edge matching algorithm
%
%Inputs: current_deB_I.mat (can be created manually from this script) and
%cleaned_up_image_(capture1.JPG).mat that is saved from imageCleanup.m
%
%Output: "matched_cam_edges" and "matched_proj_edges" are the final answers
%where each detected edge pixel in the camera image is mathced to a
%projected plane in the projector image. "matched_cam_edges" contains NaN
%for theses unmathced pixels.
%
%Created by: Jaco Verster (versterrie@gmail.com)

%Clear the workspace variables and close everything
%clc, clear , close all

%imagename = '2017_04_20Jaco2.JPG';

%Select calibration image based on portrait/landscape setup
if orientation == 'P'
    deBruijnImagename = 'debruijn_image_800x600x7.png'; %portrait
elseif orientation == 'L'
    deBruijnImagename = 'debruijn_image_600x800x7.png'; %landscape
else
    disp('error selecting calibration image')
end

disp('+++ edgeMatching initialized...')

%% Load images into memory, separate colour channels and run edge detection
disp('+ Detecting edges...')
%The part below can be commented out if current_deB_I.mat is up to date
%{ 
%the projected image
deBruijnImagename = 'debruijn_image_600x800x7.png';
Iproj = im2double(imread(deBruijnImagename)); 

%Seperate colour channels for projected image (only the first row is needed 
%beacause all rows should be identical)
Rproj = Iproj(1,:,1);
Gproj = Iproj(1,:,2);
Bproj = Iproj(1,:,3);

%Size the image
S_proj = size(Iproj); %[row col] 

%detect edges using detect_that_edge.m
edges_proj = edgeDetection(Iproj);

%Store deBruijn image information for fututure reference
save([deBruijnImagename,'.mat'],'edges_proj','Iproj','Rproj','Gproj','Bproj','S_proj')
%}

%load projector image data - NOTE: this must be commented out if the
%current_deB_I.mat file is out of date
load([deBruijnImagename,'.mat'])

%load the camera image
load(['cleaned_up_image_(',imagename,').mat']) %data from imageCleanup.m
Icam = Icrop;

%Seperate colour channels for camera image
Rcam = Icam(:,:,1);
Gcam = Icam(:,:,2);
Bcam = Icam(:,:,3);

%Size the image
S_cam = size(Icam); %[row col] 

%detect edges using detect_that_edge.m
edges_cam = edgeDetection(Icam);

%% Get edge gradient values for the camera image and count the nr of edges
%compute 1-D gradient for each colour band
grad_cam_R = gradient(Rcam);
grad_cam_G = gradient(Gcam);
grad_cam_B = gradient(Bcam);

%Scan through the camera image & create a edge location matrix 
for i = 1:S_cam(1)
    counter = 0;
    for j = 2:S_cam(2)-1
        %compile the edge matrix with associated gradient values
        if edges_cam(i,j) == 1
            counter = counter + 1;
            edge_grad_cam_R(i,counter) = max(grad_cam_R(i,j-1:j+1));
            edge_grad_cam_G(i,counter) = max(grad_cam_G(i,j-1:j+1));
            edge_grad_cam_B(i,counter) = max(grad_cam_B(i,j-1:j+1));
            %max function above is used to select the highest of 3 values
            %around the detected edge - this is to account for a small
            %offset in the R, G and B peak locations that is due
            %to the fact that the R, G, B detectors are not in exactly the
            %same location on the camera
            
            %create a edge location matrix for the camera
            loc_cam_edges(i,counter) = j;
            nr_of_cam_edges(i) = counter;
        end
    end
end

%% Determine the location of the detected edges inside the deBruijn pattern
disp('+ Determining edge location inside deBruin pattern...')
%Determine the average distance between edges for loc_cam_edges in the
%edge_matching script

%Convert all zero values in loc_cam_edges to NaN for ease of computation 
loc_cam_edges(loc_cam_edges==0) = NaN;

%Calculate edge distance
a = diff(loc_cam_edges,1,2); %a(row,1) => loc_cam_edges(row,1->2);

%calculate the mean edge distance
b = permute(a,[2 1]);
mean_edge_dist = tsnanmean(b)';

%max number of detected camera edges
max_edges = max(nr_of_cam_edges);

%Manipulate loc_cam_edges to place undetected edges in the correct location
%and to remove false positives
for row = 1404:S_cam(1)
    skipped_cols = find(a(row,:) > 1.5*mean_edge_dist(row));
    if isempty(skipped_cols) == 0 
        count = 1;
        for s = 1:length(skipped_cols)
            working_col = skipped_cols(s)+count;
            move = loc_cam_edges(row,working_col:max_edges-1);
            loc_cam_edges(row,working_col) = nan;
            loc_cam_edges(row,working_col+1:max_edges) = move;
            count = count+1;
        end
    end 
end

%Convert all zero values in loc_cam_edges to NaN again 
loc_cam_edges(loc_cam_edges==0) = NaN;

%re-calculate edge distances, mean and min edge distance per row
a2 = diff(loc_cam_edges,1,2);
b2 = permute(a2,[2 1]);
mean_edge_dist2 = tsnanmean(b2)';
min_edge_dist = min(b2)';

%Pattern used in the deBruijn image generator: deBruijnImage.m
pattern = [1,2,5,4,3,5,4,3,4,3,0,1,2,5,3,5,4,3,4,1,4,3,4,3,0,2,5,4,3,0,...
    3,4,3,5,4,1,2,5,3,4,5,4,3,5,3,5,4,3,5,3,0,1,2,1,4,1,2,5,3,0,3,4,3,0,...
    1,0,1,2,0,1,4,3,4,5,3,5,4,3,0,2,0,1,2,0,3,5,4,3,0,3,0,1,0,1,0,2,5,3,...
    4,1,4,3,5,4,5,3,4,1,2,0,3,4,1,0,1,4,3,5,3,5,3,4,1,0,2,0,1,0,2,0,2,5,...
    3,5,2,0,1,0,3,4,5,4,1,4,1,0,1,0,3,5,2,5,3,0,3,5,4,1,4,5,2,5,2,5,2,1,...
    2,0,1,4,5,4,5,3,5,3,4,5,3,5,2,5,2,1,4,1,2,0,2,0,3,4,5,2,1,0,1,4,5,3,...
    0,1,4,5,2,1,2,0,3,0,3,5,3,5,3,5,2,1,0,2,0,3,5,3,0,2,0,2,1,4,5,2,1,4,...
    1,4,5,3,0,3,0,3,0];

%Find the first set of 5 consecutive detected edges so that we can
%determine the x-loc in the deBruijn pattern.

conseqEdge = zeros(S_cam(1),7); %allocate memory for variable
%%%%%%%%%%%%%%%%%%%conseqEdge = zeros(1,7); %do the first row only

for row = 1:S_cam(1)
    col = 1;
    while col <= (size(a2,2)-4) % changed from (S_cam(2)-4)
        dif = diff(a2(row,col:(col+4)));
        val = a2(row,col);
        val2 = isnan(dif);
        val3 = abs(max(dif)-min(dif));
        if val <= mean_edge_dist2(row)+4 &&...%check upper limit
                val >= mean_edge_dist2(row)-4 &&... %check lower limit 
                loc_cam_edges(row,col) > mean_edge_dist2(row)/1.8 &&...
                any(val2) == 0 &&...
                val3 <= min_edge_dist(row);        
                %check that first edge is far enough from the edge of Icam
                %and that there are no NaN values (val2)
                %and that the edges are not too far apart (val3)
            %Save the consecutive edge data as follows:
            %column 1 = edge number
            conseqEdge(row,1) = col;
            %column 2 = median value of edge distance (in pixels)
            conseqEdge(row,2) = mean_edge_dist2(row);
            %column 3:7 = the edge pixel numbers in camera_crop image...
            %(remember to add the "bounds" values! ==> [col + bounds(1)-1])
            conseqEdge(row,3:7) = loc_cam_edges(row,col:(col+4));
            col = S_cam(2);
        end
        col = col+1;
    end
end

%Extract the RGB values from the camera image on either side of each edge
%detected above
RGB = cell(S_cam(1),6);
%%%%%%%%%%%%%%%%%%%RGB = cell(1,6);
counter = 0;
for row = 1:S_cam(1)
    if conseqEdge(row,1) ~= 0
        RGB{row,1}(1:3) = Icam(row,round(conseqEdge(row,3)-...
            conseqEdge(row,2)/2),:);
        RGB{row,2}(1:3) = Icam(row,round(conseqEdge(row,4)-...
            conseqEdge(row,2)/2),:);
        RGB{row,3}(1:3) = Icam(row,round(conseqEdge(row,5)-...
            conseqEdge(row,2)/2),:);
        RGB{row,4}(1:3) = Icam(row,round(conseqEdge(row,6)-...
            conseqEdge(row,2)/2),:);
        RGB{row,5}(1:3) = Icam(row,round(conseqEdge(row,7)-...
            conseqEdge(row,2)/2),:);
        RGB{row,6}(1:3) = Icam(row,round(conseqEdge(row,7)+...
            conseqEdge(row,2)/2),:);
    else
        counter = counter+1;
    end
end

%Identify correct colour and name colour 0 to 5 according to the following
%convention - this is the sam convention used for the deBruijn pattern
colM =  [1 1 0; %yellow = 3
        1 0 1;  %magenta = 4
        0 1 1;  %cyan = 5
        1 0 0;  %red = 2
        0 1 0;  %green = 1
        0 0 1]; %blue = 0
    
RGB_pattern = nan(S_cam(1),6); %allocate memory
%%%%%%%%%%%%%%%%%%%RGB_pattern = nan(1,6);
col_threshold = 0.3;  %%%THIS THRESHOLD VALUE IS VERY IMPORTANT
for row = 1:S_cam(1)
    for i = 1:6
        %Extract colour information from cell and apply thresholding
        A = RGB{row,i};
        col_max = max(A); %records the maximum value across colour channels
        if isempty(A) == 0
            for j = 1:3
                if A(j) > col_threshold*col_max
                    RGB{row,i}(j) = 1;
                else
                    RGB{row,i}(j) = 0;
                end
            end
            %Match colour and rename
            if RGB{row,i} == colM(1,:)
                RGB_pattern(row,i) = 3;
            elseif RGB{row,i} == colM(2,:)
                RGB_pattern(row,i) = 4;
            elseif RGB{row,i} == colM(3,:)
                RGB_pattern(row,i) = 5;
            elseif RGB{row,i} == colM(4,:)
                RGB_pattern(row,i) = 2;
            elseif RGB{row,i} == colM(5,:)
                RGB_pattern(row,i) = 1;
            elseif RGB{row,i} == colM(6,:)
                RGB_pattern(row,i) = 0;
            end
        end
    end
end

%Search for the above patterns in the deBruijn image
loc_in_deBruijn = nan(S_cam(1),1); %allocate memory
%%%%%%%%%%%%%%%%%%%loc_in_deBruijn = [];
nA = numel(pattern); %calculate deBruijn pattern length
np = 6; %search pattern length
%Search the big pattern for the small pattern match
for row = 1:S_cam(1)
    p = RGB_pattern(row,:); 
    buffer = ~any(spdiags(repmat(pattern(:), 1, np), 0:np-1, nA, nA) - ...
               spdiags(repmat(p, nA, 1), 0:np-1, nA, nA), 2);
    loc = find(full(buffer(1:nA-np+1)));
    if loc > 0
        loc_in_deBruijn(row) = loc(1); %This records the first stripe nr
    end
end

%% Get edge gradient values for the projector image and count nr of edges

%compute 1-D gradient for each colour band 
%'/0.5' is used to get values of -1 and 1 for projected image
grad_proj_R = gradient(Rproj)/0.5;  
grad_proj_G = gradient(Gproj)/0.5;
grad_proj_B = gradient(Bproj)/0.5;

%mark the number of edges to match for the projected image
nr_of_proj_edges = max_edges;

%create an edge location array for the projector
loc_proj_edges = find(edges_proj(1,:) == 1); 

%allocate memory for matched projector edges
matched_proj_edges = NaN([S_cam(1) nr_of_proj_edges],'double');
edge_grad_proj_R = NaN([S_cam(1) nr_of_proj_edges],'double');
edge_grad_proj_G = NaN([S_cam(1) nr_of_proj_edges],'double');
edge_grad_proj_B = NaN([S_cam(1) nr_of_proj_edges],'double');

%Initialize  unmatched_edges variable
unmatched_edges = 0;
skipped_rows = [];

%compile the edge matrix with associated gradient values
for i = 1:S_cam(1)
    %first check if loc_in_deBruijn exists, if not skip row and make note
    if isnan(loc_in_deBruijn(i)) == 0 
        %calculate the first term according to the mathced deB pattern
        matched_loc_in_deB = loc_in_deBruijn(i)+1-conseqEdge(i,1);

        %store matched projector edges starting from calculated match up to
        %max_edges
        from = matched_loc_in_deB;
        to = min(length(loc_proj_edges),...
            matched_loc_in_deB + nr_of_proj_edges - 1);
        nr_of_matched_edges(i) = to - from + 1;
        
        matched_proj_edges(i,1:nr_of_matched_edges(i)) = loc_proj_edges(from:to);

        %compile the edge matrix
        edge_grad_proj_R(i,1:nr_of_matched_edges(i)) = ...
            grad_proj_R(matched_proj_edges(i,1:nr_of_matched_edges(i)));
        edge_grad_proj_G(i,1:nr_of_matched_edges(i)) = ...
            grad_proj_G(matched_proj_edges(i,1:nr_of_matched_edges(i)));
        edge_grad_proj_B(i,1:nr_of_matched_edges(i)) = ...
            grad_proj_B(matched_proj_edges(i,1:nr_of_matched_edges(i)));
    else
        unmatched_edges = unmatched_edges + nr_of_cam_edges(i);
        skipped_rows = [skipped_rows; i];
    end
end
disp(['NOTE: ',num2str(length(skipped_rows)),...
    ' rows skipped because no loc_in_deBruijn found, see "skipped_rows"'])

%% Match projector and camera edges
disp('+ Matching projector and camera edges...')
%allocate memory for variables
matched_cam_edges = NaN([S_cam(1) nr_of_proj_edges],'double');
 
%scan through all the detected camera edges and compute the matching score
%remove skipped rows from scan
A = 1:S_cam(1); %all rows
A(skipped_rows) = []; %remove skipped rows

%This is where the edge matching process happens
for row = A
    %allocate memory for score
    score = zeros(max(nr_of_cam_edges(row))+3,nr_of_proj_edges+3); 
    %Construct the score matrix for each row
    for ec = 1:nr_of_cam_edges(row) %length(cam_edge_grad_R(2,:))
        for ep = 1:nr_of_matched_edges(row)
            %Compute match score matrix for each row
            score(ec,ep) = min([...
        consistency(edge_grad_proj_R(row,ep),edge_grad_cam_R(row,ec)),...
        consistency(edge_grad_proj_G(row,ep),edge_grad_cam_G(row,ec)),...
        consistency(edge_grad_proj_B(row,ep),edge_grad_cam_B(row,ec))]);
        end
    end
    
    %{
    %determine the starting location for the optimal path
    %NOTE: this functionality is no longer needed due to the way
    %loc_cam_edges is constructed - start should always be [1 1]. 
    [row_1_max,c] = max(score(1,1:4));
    [col_1_max,r] = max(score(1:3,1));
    if row_1_max == col_1_max
        start = [1,1];
        edges_matched = 1;
    elseif row_1_max > col_1_max %&& score(2,c+1) > score(r+1,2)
        start = [1,c];
        edges_matched = 2;
    elseif row_1_max < col_1_max %&& score(2,c+1) < score(r+1,2)
        start = [r,1];
        edges_matched = 1;
    else
    disp('ERROR!')
    end
    %}
    
    %Now calculate optimal path with a set threshold
    threshold = 0.001;
    
    %This is the starting position
    start = [1,1]; 
    i = start(1); 
    j = start(2);
    
    %Initialize edge matching and match first edge
    edges_matched = 1;
    matched_cam_edges(row,edges_matched) = loc_cam_edges(row,i); 
    
    %Scan through the score matrix and do edge matching
    while i < nr_of_cam_edges(row) && j < nr_of_proj_edges
        if score(i+1,j+1) > threshold
            score(i+1,j+2)=0; score(i+1,j+3)=0; 
            score(i+2,j+1)=0; score(i+3,j+1)=0;
            i=i+1;
            j=j+1;
            edges_matched = edges_matched + 1;
            matched_cam_edges(row,edges_matched) = ...
                loc_cam_edges(row,edges_matched);
        elseif score(i+1,j+2) > threshold 
            score(i+1,j+3)=0; score(i+2,j+1)=0; score(i+3,j+1)=0;
            i=i+1;
            j=j+2;
            edges_matched = edges_matched + 2;
            unmatched_edges = unmatched_edges+1;
            matched_cam_edges(row,edges_matched) = ...
                loc_cam_edges(row,edges_matched); 
        elseif score(i+2,j+1) > threshold
            score(i+1,j+3)=0; score(i+3,j+1)=0;
            i=i+2;
            j=j+1;
            edges_matched = edges_matched + 1;
            matched_cam_edges(row,edges_matched) = ...
                loc_cam_edges(row,edges_matched);
        elseif score(i+1,j+3) > threshold && score(i+2,j+4) > threshold
            score(i+3,j+1)=0;
            i=i+1;
            j=j+3;
            edges_matched = edges_matched + 3;
            unmatched_edges = unmatched_edges+2;
            matched_cam_edges(row,edges_matched) = ...
                loc_cam_edges(row,edges_matched);
        elseif score(i+3,j+1) > threshold && score(i+4,j+2) > threshold
            i=i+3;
            j=j+1;
            edges_matched = edges_matched + 1;
            matched_cam_edges(row,edges_matched) = ...
                loc_cam_edges(row,edges_matched);
        else
            i=i+1;
            j=j+1;
            edges_matched = edges_matched + 1;
            matched_cam_edges(row,edges_matched) = NaN;
            unmatched_edges = unmatched_edges+1;
            %Print out unmatched edge locations
            display(num2str([row j]),'Unmatched edge at [row,col]')
        end
    end   
    %display(['row ',num2str(row),' done']) %To track progress
end

%% Verify matching
%
disp('+ Plotting edge matching for final visual verification...')
%display the percentage of edge pixels in the camera that are unmatched
Percentage_unmatched = 100*unmatched_edges/numel(matched_cam_edges)

%Plot a few matched locations on both proj and cam images to visually
%verify good matching
cam_win = 25;
proj_win = 10;
marker1 = 0.25;
marker2 = 0.75;

plotRow_1 = round(min(S_cam(1),S_proj(1))*marker1);
plotRow_2 = round(min(S_cam(1),S_proj(1))*marker2);

plotColCam_1 = matched_cam_edges(plotRow_1,round(max_edges*marker1));
plotColCam_2 = matched_cam_edges(plotRow_1,round(max_edges*marker2));
plotColCam_3 = matched_cam_edges(plotRow_2,round(max_edges*marker1));
plotColCam_4 = matched_cam_edges(plotRow_2,round(max_edges*marker2));
plotColProj_1 = matched_proj_edges(plotRow_1,round(max_edges*marker1));
plotColProj_2 = matched_proj_edges(plotRow_1,round(max_edges*marker2));
plotColProj_3 = matched_proj_edges(plotRow_2,round(max_edges*marker1));
plotColProj_4 = matched_proj_edges(plotRow_2,round(max_edges*marker2));

Cam_1 = Icam((plotRow_1-cam_win):(plotRow_1+cam_win),...
    (plotColCam_1-cam_win):(plotColCam_1+cam_win),:);
Cam_2 = Icam((plotRow_1-cam_win):(plotRow_1+cam_win),...
    (plotColCam_2-cam_win):(plotColCam_2+cam_win),:);
Cam_3 = Icam((plotRow_2-cam_win):(plotRow_2+cam_win),...
    (plotColCam_3-cam_win):(plotColCam_3+cam_win),:);
Cam_4 = Icam((plotRow_2-cam_win):(plotRow_2+cam_win),...
    (plotColCam_4-cam_win):(plotColCam_4+cam_win),:);

Proj_1 = Iproj((plotRow_1-proj_win):(plotRow_1+proj_win),...
    (plotColProj_1-proj_win):(plotColProj_1+proj_win),:);
Proj_2 = Iproj((plotRow_1-proj_win):(plotRow_1+proj_win),...
    (plotColProj_2-proj_win):(plotColProj_2+proj_win),:);
Proj_3 = Iproj((plotRow_2-proj_win):(plotRow_2+proj_win),...
    (plotColProj_3-proj_win):(plotColProj_3+proj_win),:);
Proj_4 = Iproj((plotRow_2-proj_win):(plotRow_2+proj_win),...
    (plotColProj_4-proj_win):(plotColProj_4+proj_win),:);

%Plot matched image sections
figure('Name','Matched camera and projector edges compared visually')
subplot(2,4,1),imshow(Cam_1); title('Cam_1')
subplot(2,4,2),imshow(Cam_2); title('Cam_2')
subplot(2,4,3),imshow(Cam_3); title('Cam_3')
subplot(2,4,4),imshow(Cam_4); title('Cam_4')
subplot(2,4,5),imshow(Proj_1); title('Proj_1')
subplot(2,4,6),imshow(Proj_2); title('Proj_2')
subplot(2,4,7),imshow(Proj_3); title('Proj_3')
subplot(2,4,8),imshow(Proj_4); title('Proj_4')
%}
%% Show matched edges 
Iedges = Icam;
for i = 1:S_cam(1)
    for j = 1:max_edges
        col_val = matched_cam_edges(i,j);
        if isnan(col_val) == 0
            Iedges(i,col_val,1)=255;
            Iedges(i,col_val,2)=0;
            Iedges(i,col_val,3)=0;
        end
    end
end
figure('Name','Matched edges shown on image'), imshow(Iedges)

%% Save
disp('+ Saving data...')
%The relevant data is stored in matched_edges.mat
%savefile = input...
    %('Do you want to save the matched edges? [1 = yes, other = no]: ','s');
if savefile == 1
    save(['matched_edges_(',imagename,').mat'],'matched_cam_edges',...
        'matched_proj_edges','Rcam','Gcam','Bcam')
    display('Results SAVED.')
else
    display('Results were NOT saved.')
end

disp('++ edgeMatching done!')