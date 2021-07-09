
max = 10;
step = 0.1;
B = pi/4;

[R,r] = meshgrid(0:step:max,0:step:max);

Vt = (pi .* R .* (r.^2)) .* (  2.*pi  -  2.*B   + sin(2*B)  );

Vp =  4.*pi .* ( ((R - r.* cos(B)).^(3))./(8.*tan(B))  +    (r.*sin(B) + ((r.*cos(B) - R)./(2.*tan(B)))).*( ((R-r.*cos(B)).^(2))/2) );


At = (2.*pi - 2.*B) .* r .* 2 .* pi .* R;

Ap = 4.*pi .*   ((((((R-r.*cos(B)).*tan(B)).^(2))+ ((R-r.*cos(B)).^(2))).^(3/2)) - (((R-r.*cos(B)) .* tan(B)).^(3)))./ (3.* (R-r.*cos(B) * tan(B)) )  ;


Z = (Vt+Vp)./(At+Ap);

% Z = (At+Ap);



 surf(R,r,Z)

% contour(R,r,Z)

xlabel('R') 
ylabel('r') 
zlabel('Surface Area to Volume Ratio')

