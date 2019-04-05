function [outClimbEnergy] = ClimbEnergy(climb_states,plane)
%This function calculates the total energy used for the climb

climb = Climb(plane,climb_states);
outClimbEnergy = climb.deltaQ;
end

