function [outSteadyFlight] = SteadyFlight(plane,total_distance)
%SteadyFlight calculates the time and capacity used to travel a distance at
%20 m/s.

%speed
v = 20;
%time
sflight.time = total_distance/v;
%capacity
CL = (plane.m*9.81)/(0.5*plane.test.rho*plane.S*(v^2));
alpha = calcAlpha(plane,CL);
CT = calcClimbCT(plane, [v,0,alpha]);
eta = calcEta(plane,CT);
drag = 0.5*plane.test.rho*plane.S*calcCd(plane,alpha)*(v^2);
sflight.deltaQ = drag*v*sflight.time/eta;
%output
outSteadyFlight = sflight;
end

