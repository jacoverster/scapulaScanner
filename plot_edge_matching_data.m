row = 82;
range_proj = 1:2;
range_cam = 1:2;

figure('Name','Camera'), hold
plot(edge_grad_cam_R(row,1:3),'r')
plot(edge_grad_cam_G(row,1:3),'g')
plot(edge_grad_cam_B(row,1:3),'b')

figure('Name','Projector'), hold
plot(edge_grad_proj_R(row,1:3),'r')
plot(edge_grad_proj_G(row,1:3),'g')
plot(edge_grad_proj_B(row,1:3),'b')

% figure, hold
% plot(Rcam(row,:),'r')
% plot(Gcam(row,:),'g')
% plot(Bcam(row,:),'b')

% figure, hold
% plot(Rproj(row,:)*0.9,'r')
% plot(Gproj(row,:)*0.8,'g')
% plot(Bproj(row,:),'b')

%Iuc = imread('cal_deB_small.jpg'); %camera image not corrected for colour
%Ruc = double(Iuc(:,:,1));
%Guc = double(Iuc(:,:,2));
%Buc = double(Iuc(:,:,3));
%RucN = (Ruc-min(min(Ruc)))/(max(max(Ruc))-min(min(Ruc)));
%GucN = (Guc-min(min(Guc)))/(max(max(Guc))-min(min(Guc)));
%BucN = (Buc-min(min(Buc)))/(max(max(Buc))-min(min(Buc)));

%figure, hold
%plot(RucN(10,:),'r')
%plot(GucN(10,:),'g')
%plot(BucN(10,:),'b')