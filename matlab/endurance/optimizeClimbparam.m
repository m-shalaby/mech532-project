function [outClimbParam,outMapEnergy] = optimizeClimbparam(plane, map_param)
%optimizeClimbparam finds the best operating parameters for maximising
%climb endurance.

%map climb energy to operating parameters
mapEnergy = zeros(length(map_param.v),length(map_param.theta),length(map_param.alpha));
for l = 1:length(map_param.v)
    for m = 1:length(map_param.theta)
        for n = 1:length(map_param.alpha)
            climb_states = [map_param.v(l), map_param.theta(m), map_param.alpha(n)];
            climb = Climb(plane,climb_states);
            if climb.flag == 1
                mapEnergy(l,m,n) = 1E9;
                continue
            else
            mapEnergy(l,m,n) = climb.deltaQ;
            end
        end
    end
end

%find climbing states for minimum energy
[~,I] = min(mapEnergy(:));
[I,J,K] = ind2sub(size(mapEnergy),I);
climb_v = map_param.v(I);
climb_theta = map_param.theta(J);
climb_alpha = map_param.alpha(K);

%output
outClimbParam = [climb_v;climb_theta;climb_alpha];
outMapEnergy = mapEnergy;
end






