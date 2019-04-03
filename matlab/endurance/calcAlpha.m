function [outAlpha] = calcAlpha(plane,CL)
%calcCD calculates the Coefficient of drag for the airplane at a given
%angle of attack. 

outAlpha = interp1(plane.CL(:,2),plane.CL(:,1),CL);

end