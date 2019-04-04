function [outFlight] = calcFlight(plane,climb_states, maxAltitude)
%UNTITLED13 Summary of this function goes here
%   Detailed explanation goes here

%% Take off
takeoff = Takeoff(plane,climb_states(1));

%% Climb
climb = Climb(plane, climb_states, maxAltitude);

%% Steady Flight
steady_flight = SteadyFlight(plane, Q);

%% Banked Turn


%% Descent


%% Output


end

