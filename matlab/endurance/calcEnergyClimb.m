function [outEnergyClimb] = calcEnergyClimb(plane, V, theta, alpha, total_climb)
%calcEnergyClimb calculates the total energy used for the place to 

outEnergyClimb = 0.5*plane.test.rho*plane.S*(V^2)*calcCd(plane,alpha)*total_climb / sind(theta);

end

