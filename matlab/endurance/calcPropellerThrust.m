function [outThrust] = calcPropellerThrust(plane,V,CT)
%calc Propeller Thrust calculates the thrust produced by the propeller
%based on CT and V.

outThrust = 0.5*plane.test.rho*plane.S*(V^2)*CT;

end

