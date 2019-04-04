function [outFlight] = calcFlight(plane,climb_states, maxAltitude)
%UNTITLED13 Summary of this function goes here
%   Detailed explanation goes here


%% take off



%% Climb
climb = Climb(plane, climb_states, maxAltitude);

%% Steady Flight 

steady_flight = SteadyFlight(plane);

%% Descent

descent = 

%% Output

outFlight.climb = climb;
outFlight.time = climb_endurance + steady_flight_endurance + descent_endurance;
outFlight.SOC = ;



end

