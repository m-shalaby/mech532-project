function [outSteadyFlight] = SteadyFlight(plane,deltaQ)
%SteadyFlight calculates the time and capacity used to travel a distance at
%20 m/s.

%speed
v = plane.test.v;

%capacity
sflight.CL = (plane.m*9.81)/(0.5*plane.test.rho*plane.S*(v^2));
sflight.alpha = calcAlpha(plane,sflight.CL);
sflight.CT = calcClimbCT(plane, [v,0,sflight.alpha]);
sflight.thrust = calcPropellerThrust(plane,sflight.CT);
sflight.eta = calcEta(plane,sflight.CT);
sflight.power = sflight.thrust*v/(sflight.eta*plane.motor.eff);
sflight.distanceA = 0.5*deltaQ*v*plane.batt.Vnom/sflight.power;
sflight.distanceB = 0.5*deltaQ*v*plane.batt.Vnom/sflight.power;
sflight.distance = sflight.distanceA+sflight.distanceB;
sflight.deltaQ = deltaQ;
%time
sflight.time = (sflight.distance)/v;
%output
outSteadyFlight = sflight;
end

