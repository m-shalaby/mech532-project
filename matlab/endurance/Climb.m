function [outClimb] = Climb(plane,climb_states, maxAltidude)
%Climb calculates climb flight 

%Calcualte required thrust to climb
CT = calcCT(plane,climb_states);
if CT > max(plane.propeller.data(:,2)) || CT < min(plane.propeller.data(:,2))
    disp('Propeller cannot produce enough thrust');
    return
else
    climb.thrust = calcPropellerThrust(plane,climb_states(1),CT);
    climb.power = thrust * climb_states(1) / calcEta(plane,CT); 
    climb.time = maxAltidude / (climb_states(1)*sind(climb_states(2)));
    climb.totalEnergy = power*time/plane.motor.eff;
    climb.SOC = (plane.batt.totalQ - (totalEnergy/plane.batt.Vnom))/plane.batt.totalQ;
    %output
    outClimb = climb;
end

