function [outFlight] = calcFlight(plane,climb_states)
%calcFlight simulates the flight with a given climb states and steady
%flight distance.

%% Take off
flight.takeoff = Takeoff(plane,climb_states(1));

%% Climb
flight.climb = Climb(plane, climb_states);

%% 180 deg Banked Turn
radius = 150;
flight.banked_turn = BankedTurn(plane,radius);

%% Steady Flight
flight.steady_flight.deltaQ_SF = plane.batt.totalQ - plane.batt.safetyQ - flight.takeoff.deltaQ - flight.climb.deltaQ - flight.banked_turn.deltaQ ;
flight.steady_flight = SteadyFlight(plane,flight.steady_flight.deltaQ_SF);

%% Descent
flight.descent = Descent(plane, plane.test.maxAltitude);

%% flight metrics
flight.time = flight.climb.time + flight.banked_turn.time + flight.steady_flight.time + flight.descent.time;
flight.distance = flight.climb.distance + flight.banked_turn.distance + flight.steady_flight.distance + flight.descent.distance;

%% Output
outFlight = flight; 
end

