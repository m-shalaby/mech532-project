function [outClimbParam, outMapEnergy] = optimizeClimbparam(plane, total_climb, map_param)
%optimizeClimbparam finds the best operating parameters for maximising
%climb endurance.

%map climb energy to operating parameters

mapEnergy = zeros(length(map_param.v),length(map_param.theta),length(map_param.alpha));

for l = 1:length(map_param.v)
    for m = 1:length(map_param.theta)
       
        minCL = (plane.m*9.81)/(cosd(map_param.theta(m))*0.5*plane.test.rho*plane.S*((map_param.v(l))^2));
        if minCL > max(plane.CL(:,2))
            minalpha = 100;
        else
        minalpha = calcAlpha(plane,minCL);
        end
        v = map_param.v(l);
        for n = 1:length(map_param.alpha)
           
            if map_param.alpha(n) < minalpha
                mapEnergy(l,m,n) = 1E9;
                continue
            else
            mapEnergy(l,m,n) = calcEnergyClimb(plane, map_param.v(l), map_param.theta(m), map_param.alpha(n), total_climb);
            end
        end
    end
end

[~,I] = min(mapEnergy(:));

[I,J,K] = ind2sub(size(mapEnergy),I);

climb_v = map_param.v(I);
climb_theta = map_param.theta(J);
climb_alpha = map_param.alpha(K);

outClimbParam = [climb_v;climb_theta;climb_alpha];
outMapEnergy = mapEnergy;
end
