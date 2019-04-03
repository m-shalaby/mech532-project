function [outEnergyClimb] = calcEnergyClimb(plane, V, theta, alpha, total_climb)
%calcEnergyClimb calculates the total energy used for the place to 

thrust = (0.5*plane.test.rho*plane.S*calcCd(plane,alpha)*(V^2)) + (9.81*plane.m*(sind(theta)));

outEnergyClimb = thrust*total_climb / sind(theta);

end

