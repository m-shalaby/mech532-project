function [outDescent] = Descent(plane,altitude)
%Descent calculates the descent flight.

v = plane.test.v;
alpha_glide = calcAlphaGliding(plane);
CL = calcCL(plane,alpha_glide);
CD = calcCd(plane,alpha_glide);

descent.glide_path_angle = acos((0.5*plane.test.rho*plane.S*CL*(v^2))/(plane.m*9.81));

% descent.vs = v*cosd(descent.glide_path_angle);
descent.vs = (((2*plane.m*9.81)/(plane.test.rho*plane.S))^0.5)*(CD/((CL^2)+(CD^2)));
descent.glide_path_angle = rad2deg(CD/((CL^2+CD^2)^0.5));
descent.v = descent.vs/(sind(descent.glide_path_angle));
descent.vg = cosd(descent.glide_path_angle)*descent.v;
descent.time = altitude/descent.vs;
descent.distance = descent.vg*descent.time;
%output
outDescent = descent;

end

