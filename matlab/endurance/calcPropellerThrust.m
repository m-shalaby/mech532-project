function [outThrust] = calcPropellerThrust(plane,CT)
%calc Propeller Thrust calculates the thrust produced by the propeller
%based on CT and V.

outThrust = (plane.propeller.n^2)*plane.test.rho*(plane.propeller.D^4)*CT;

end

