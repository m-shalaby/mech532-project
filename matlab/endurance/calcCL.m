function [outCL] = calcCL(plane,alpha)
%calcCD calculates the Coefficient of drag for the airplane at a given
%angle of attack. 

outCL = interp1(plane.CL(:,1),plane.CL(:,2),alpha);

end