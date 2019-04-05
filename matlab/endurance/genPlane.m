function [outPlane] = genPlane(wingConfig)
%genPlane generates a plan structure with all parameters for a given wing
%configuration.

%test parameters
plane.test.rho = 1.225;
plane.test.mu = 0.2;
plane.test.maxAltitude = 100;
plane.test.v = 20;

%propeller paprameters
load('apce11x7.mat');
plane.propeller.data = apce11x7;
plane.propeller.D = 0.2794;         %[m]
plane.propeller.n = 100;            %6000[rev/s]
plane.propeller.staticCT = 0.11;

%motor parameters
plane.motor.eff = 0.9;
plane.motor.n = 1;

%battery parameters
plane.batt.Vnom = 14.8;     %nominal battery voltage [V]
plane.batt.totalQ = 7920;    %total battery capacity [As]
plane.batt.safetyQ = 0.05*plane.batt.totalQ;


%aircraft parameters
if strcmp(wingConfig,'2208')
    load('plane2208.mat');
    %Performance 
    plane.CD(:,1) = plane2208(:,1);
    plane.CD(:,2) = plane2208(:,6);
    plane.CL(:,1) = plane2208(:,1);
    plane.CL(:,2) = plane2208(:,3);
    %structure
    plane.m = 2.2;
    plane.S = 0.36;

elseif strcmp(wingConfig,'2512')
    load('plane2512.mat');
    %Performance 
    plane.CD(:,1) = plane2512(:,1);
    plane.CD(:,2) = plane2512(:,6);
    plane.CL(:,1) = plane2512(:,1);
    plane.CL(:,2) = plane2512(:,3);
    %structure
    plane.m = 2.2;
    plane.S = 0.36;

else 
    disp('Please enter a valid wing configuration');
end
outPlane = plane;
end

