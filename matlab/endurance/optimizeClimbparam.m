function [outClimbParam] = optimizeClimbparam(plane)
%optimizeClimbparam finds the best operating parameters for maximising
%climb endurance.

x0 = [10; 10; -1];
f = @(climb_states,plane)ClimbEnergy(climb_states,plane);
ClimbParam = fminsearch(@(climb_states) f(climb_states,plane),x0);

outClimbParam = ClimbParam;

end

