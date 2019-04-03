function [outEta] = calcEta(plane,CT)
%Calculate propeller efficiency based on propeller Coeffient of thrust

if CT > max(plane.propeller.data(:,2)) || CT < min(plane.propeller.data(:,2))
    disp('CT outside of range');
    return
else
    outEta = interp1(plane.propeller.data(:,2),plane.propeller.data(:,4),CT);
end
end

