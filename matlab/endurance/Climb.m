function [outClimb] = Climb(plane,climb_states, maxAltidude)
%Climb calculates climb flight 


%time
time = maxAltidude / (climb_states(1)*sind(climb_states(2)));
%power
thrust = 0.5*plane.rho*plane.S*plane.CD(plane,climb_states(3))*(climb_states(2)^2);
power = thrust * climb_states(1) / plane.propeller.eta;



%altitude


%SOC

time,power,altitude,SOC


end

