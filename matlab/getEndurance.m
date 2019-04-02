% running example:
%       getEndurance(14.8, 2.2, 1.2137, 20, 0.36, 0.01, 0.2, 0.8, 1, 1.3)
function [E] = getEndurance(V, C, rho, Ue, S, C_D0, k, eta, Rt, n)
% Input:
%   V: voltage across motor         [V]         typical: 14.8 V
%   C: battery capcitance           [Ah]        typical: 2.2 Ah
%   rho: density at level flight    [kg/m^3]    typical: 1.2137 kg/m^3
%   Ue: velocity at level flight    [m/s]       typical: 20 m/s
%   S:  wing area                   [m^2]       typical:       
%   C_D0: zero-lift drag            []          typical: 0.004 + C_D0_w
%   k: k in C_D = C_D0 + k C_L^2    []          typical: 
%   eta: Total efficiency (motor, propeller, etc) [decimal] typical: 0.80
%   Rt: battery hour rating (typically 1 h)     [h] typical: 1 h
%   n: A discharge parameterdependent on the battery type and temperature
%   (typically 1.3 for LiPo battries) typical: 1.3


E = Rt^(n-1) *(eta*V*C/(0.5*rho*Ue^3*S*C_D0+(V^2*k/(0.5*rho*Ue*S))))^n;

