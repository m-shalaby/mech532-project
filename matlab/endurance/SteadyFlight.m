function [outSteadyFlight] = SteadyFlight(plane,deltaQ)
%SteadyFlight calculates the time and capacity used to travel a distance at
%20 m/s.

%speed
v = 20;

%capacity
CL = (plane.m*9.81)/(0.5*plane.test.rho*plane.S*(v^2));
alpha = calcAlpha(plane,CL);
CT = calcClimbCT(plane, [v,0,alpha]);
eta = calcEta(plane,CT);
drag = 0.5*plane.test.rho*plane.S*calcCd(plane,alpha)*(v^2);
power = drag*v/(eta*plane.motor.eff);
sflight.distanceA = 0.5*deltaQ*v/power;
sflight.distanceB = 0.5*deltaQ*v/power;
sflight.distance = sflight.distanceA+sflight.distanceB;

%time
sflight.time = (sflight.distanceA+sflight.distanceA)/v;
%output
outSteadyFlight = sflight;
end

