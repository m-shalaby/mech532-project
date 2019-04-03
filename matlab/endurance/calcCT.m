function [outCT] = calcCT(plane, states)
%calcCT calculates the propeller coefficient of thrust required at steady state for
%a given speed, climb angle and angle of attack.

drag = 0.5*plane.test.rho*plane.S*calcCd(plane,states(3))*(states(1)^2);

outCT = (drag + (plane.m*9.81*sind(states(2))))/((plane.propeller.n^2)*plane.test.rho*(plane.propeller.D^4));

end

