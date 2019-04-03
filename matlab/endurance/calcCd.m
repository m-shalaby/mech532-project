function [outCD] = calcCd(plane,alpha)
%calcCD calculates the Coefficient of drag for the airplane at a given
%angle of attack. 

outCD = interp1(plane.CD(:,1),plane.CD(:,2),alpha);

end

