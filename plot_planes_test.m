%[x y] = meshgrid(-1000:10:1000); % Generate x and y data
x = 330:530;
y = -230:-30;

[X,Y] = meshgrid(x,y);

for i = 1:1
    A = wPlaneCol(i,1);
    B = wPlaneCol(i,2);
    C = wPlaneCol(i,3);
    D = wPlaneCol(i,4);
    Z = -1/C*(A*X + B*Y + D); % Solve for z data
    
    A2 = wPlaneRow(i,1);
    B2 = wPlaneRow(i,2);
    C2 = wPlaneRow(i,3);
    D2 = wPlaneRow(i,4);
    Z2 = -1/C2*(A2*X + B2*Y + D2); % Solve for z data
    
    figure(10)
    xlabel('X_c'); ylabel('Z_c'); zlabel('Y_c');
    surf(X,Y,Z) %Plot the surface
    surf(X,Y,Z2)
    hold on

end

%plot the line and plane intersection (make sure of dimensions)
figure(11), hold on
xlabel('X_c'); ylabel('Z_c'); zlabel('Y_c');
v = vertices;
surf(v(:,:,1),v(:,:,2),v(:,:,3),'r')
surf(X,Y,Z) %Plot the surface