function [outFlight] = calcFlight(plane,climb_states, maxAltitude)
%UNTITLED13 Summary of this function goes here
%   Detailed explanation goes here

%% Take off
takeoff = Takeoff(plane,climb_states(1));

%% Climb
initQ = takeoff.Q(length(takeoff.Q));
climb = Climb(plane, climb_states, maxAltitude, initQ);

%% Steady Flight A
initQ = climb.endQ;
steady_flightA = SteadyFlight(plane,distance, initQ);

%% Banked Turn
initQ = steady_flight.endQ;
banked_turn = BankedTurn(plane,R);

%% Steady Flight B
initQ = banked_turn.endQ;
steady_flightB = SteadyFlight(plane,distance, initQ);

%% Descent
descent = DescentFlight(plane, v, altitude);

%% Output


end
