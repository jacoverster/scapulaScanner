%% initialize
   clear;close all;clc;
   I = imread('zhang.png');
   I2 = rgb2gray(I);%I2 gray image 
   I3=I2;
   figure(1);
   image(I);
   axis image;
   N=size(I);
   %Notice our stripe is vertical, so we check every column to detect edges.
   R=I(:,:,1);
   G=I(:,:,2);
   B=I(:,:,3);
   %% edge detection
   %threshold
   TS=10;
   for i=1:N(1)  %row
      for j=2:N(2) 
          Defference=abs(R(i,j)-R(i,j-1))+abs(G(i,j)-G(i,j-1))+abs(B(i,j)-B(i,j-1));
        if(Defference>TS)
            I2(i,j-1)=255;           
        end        
         if((i<510)&&(i>498))
             I2(i,j-1)=255;
         end
      end
   end
   %% get a part of the image and show its RGB content in a graph.
   set(1,'color',[1 1 1]);
   title(['input 2 points?get a rectangular, show its RGB curve' num2str(1)]);
   % Use ginput to select corner points of a rectangular
   % region by pointing and clicking the mouse twice
   p = ginput(2); 
   % Get the x and y corner coordinates as integers
   sp(1) = min(floor(p(1)), floor(p(2))); %xmin
   sp(2) = min(floor(p(3)), floor(p(4))); %ymin
   sp(3) = max(ceil(p(1)), ceil(p(2)));   %xmax
   sp(4) = max(ceil(p(3)), ceil(p(4)));   %ymax
% Index into the original image to create the new image
MM = I(sp(2):sp(4), sp(1): sp(3),:);
% Display the subsetted image with appropriate axis ratio
figure(2); 
subplot(3,3,1);image(MM); axis image;title('the image extract');
hold on;
WW=40;
COnes=ones(WW);
CZeros=zeros(WW);
Mycolor=[0 0 0;0 0 1;0 1 0; 0 1 1; 1 0 0;1 0 1;1  1 0;1 1 1];
for i=1:8
    subplot(3,3,i+1);
    image(cat(3,Mycolor(i,1)*COnes,Mycolor(i,2)*COnes,Mycolor(i,3)*COnes));
    title(num2str(Mycolor(i,1))+num2str(Mycolor(i,2))+num2str(Mycolor(i,3)));
end
N=size(MM);
RowMax=min(8,N(1));
ColumnMax=min(900,N(2));
x=1:ColumnMax;
figure(3);
for i=1:RowMax 
    subplot(RowMax,1,i);
    y1=MM(i,1:ColumnMax,1);
    y2=MM(i,1:ColumnMax,2);
  y3=MM(i,1:ColumnMax,3);
  plot(x,y1,'r');
  hold on;
  plot(x,y2,'g');
  hold on;
  plot(x,y3,'b');
end
%% show the edge detection result in gray mode,edge is showed in red line.
  I4=cat(3,I2,I3,I3);
  figure(4);
  imshow(I4);