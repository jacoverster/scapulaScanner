ptCloud = pcread('pointCloud_170411deB-P2_flat.ply')

v = ptCloud.Location;

%plot(v(:,3))
%pos 5031-5174, neg - 5305
a = v(:,3);