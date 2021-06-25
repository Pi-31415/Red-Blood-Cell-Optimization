r = 2.5;
R = 3;
B = pi/4;

MaxTheta = 2*pi;

% Plots the torus
funx = @(u,v) (R+ r.* cos(u)).*cos(v);
funy = @(u,v) (R+ r.* cos(u)).*sin(v);
funz = @(u,v) r.* sin(u);
fsurf(funx,funy,funz,[-(pi-B) (pi-B) 0 MaxTheta]);

hold on;



% Plots the top and botttom paraboloids
a = sqrt(2*(R-r.*cos(B))*tan(B));
h = (r.*sin(B)) - (((R-r.*cos(B)).^2)/(a.^2));

%Generate the Polar angle vector containing information about sector location and angle
Theta = [0:0.05*pi:MaxTheta];  
%Generate the Radius vector
Radius = [0:0.1:(R-r*cos(B))];
%Create a grid from angle and Radius
[ThetaG,RG] = meshgrid(Theta,Radius);
%Create X,Y matrices calculated on grid.
X = RG.*cos(ThetaG);
Y = RG.*sin(ThetaG);
%Calculate the function
Z = ((X.^2 + Y.^2)/(a.^2))+h;
%Surf plot top
surf(X,Y,Z);

Z = -((X.^2 + Y.^2)/(a.^2))-h;
%Surf plot
surf(X,Y,Z);


axis([-(R+r) (R+r) -(R+r) (R+r) -(R+r) (R+r)]);
camlight

