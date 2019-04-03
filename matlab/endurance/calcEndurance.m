function [outFlight] = calcEndurance(plane,climb_states, maxAltitude)
%UNTITLED13 Summary of this function goes here
%   Detailed explanation goes here


%% Climb
climb = Climb(plane, climb_states, maxAltitude);

%% Steady Flight 

steady_flight = SteadyFlight(plane);

%% Descent

descent = 

%% Output

outFlight.time = climb_endurance + steady_flight_endurance + descent_endurance;
outFlight.SOC = ;

end

