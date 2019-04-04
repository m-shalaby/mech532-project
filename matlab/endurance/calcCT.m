function [outCT] = calcCT(plane,v)
%This function calculates the propeller thrust coefficient for a given
%speed at 6000 rpm.

J = v / (plane.propeller.n*plane.propeller.D);

if J < min(plane.propeller.data(:,1))
    outCT = plane.propeller.staticCT;
else
    outCT = interp1(plane.propeller.data(:,1),plane.propeller.data(:,2),J);
end

end

