function [outCT] = calcCT(plane, states)
%calcCT calculates the propeller coefficient of thrust at steady state for
%a given angle of climb.

drag = 0.5*plane.test.rho*plane.S*calcCd(plane,states(3))*(states(1)^2);

outCT = (drag + (plane.m*9.81*sind(states(2))))/(0.5*plane.test.rho*plane.propeller.A*(states(1)^2));

end

