function [outClimb] = Climb(plane,climb_states, maxAltidude)
%Climb calculates climb flight 

%Calcualte minimum thrust to climb and minimum CL
minCT = calcCT(plane,climb_states)
minCL = (plane.m*9.81)/(cosd(climb_states(2))*0.5*plane.test.rho*plane.S*((climb_states(1))^2))
% minalpha = calcAlpha(plane,minCL);

%compare minimum CT and CL to aircraft capabilities
if minCT > max(plane.propeller.data(:,2)) || minCT < min(plane.propeller.data(:,2))
%     disp('Propeller cannot produce enough thrust');
    climb.flag = 1;
elseif minCL > max(plane.CL(:,2))
%     disp('Plane cannot produce enough lift');
    climb.flag = 1;
else
    %climb is possible, calculate output
    thrust = calcPropellerThrust(plane,minCT);
    power = thrust * climb_states(1) / calcEta(plane,minCT); 
    time = maxAltidude / (climb_states(1)*sind(climb_states(2)));
    totalEnergy = power*time/plane.motor.eff;
    SOC = (plane.batt.totalQ - (totalEnergy/plane.batt.Vnom))/plane.batt.totalQ;
    %output
    climb.thrust = thrust;
    climb.power = power;
    climb.time = time;
    climb.totalEnergy = totalEnergy;
    climb.SOC = SOC;
    climb.flag = 0;
end

outClimb = climb;
end

