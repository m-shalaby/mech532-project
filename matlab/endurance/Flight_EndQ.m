function [outEndQ] = Flight_EndQ(x, plane, climb_states)
%Flight_final_Q calculates the battery capacity at the end of the flight.

flight = calcFlight(plane,climb_states, maxAltitude, x);

outEndQ = flight.Qend;

end

