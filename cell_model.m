r = 2.5;
R = 3;
B = pi/3;

MaxTheta = 2*pi;


% Plots the torus
funx = @(u,v) (R+ r.* cos(u)).*cos(v);
funy = @(u,v) (R+ r.* cos(u)).*sin(v);
funz = @(u,v) r.* sin(u);

torus = fsurf(funx,funy,funz,[(B-pi) (pi-B) 0 MaxTheta]);
alpha(torus,1.0)
hold on;


% Plots the top and botttom paraboloids
a = sqrt(2*(R-r.*cos(B))*tan(B));

h = (r.*sin(B)) + (((r.*cos(B)) - R)/(2.*tan(B)));

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
partop = surf(X,Y,Z);


Z = -((X.^2 + Y.^2)/(a.^2))-h;
%Surf plot
 parbottom = surf(X,Y,Z);



% Plots the cylinder
funx = @(u,v) (R-r.*cos(B)).* cos(u);
funy = @(u,v) (R-r.*cos(B)).* sin(u);
funz = @(u,v) v;

cylinder = fsurf(funx,funy,funz,[0 MaxTheta 0 r.*sin(B)]);

hold on;


xlabel('x') 
ylabel('y') 
zlabel('z')

axis([-(R+r) (R+r) -(R+r) (R+r) -(R+r) (R+r)]);
% camlight

