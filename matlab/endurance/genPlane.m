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
% plane.motor.n = 1;

%battery parameters
plane.batt.Vnom = 14.8;     %nominal battery voltage [V]
plane.batt.totalQ = 7920;    %total battery capacity [As]
plane.batt.safetyQ = 0.05*plane.batt.totalQ;


%aircraft parameters
if strcmp(wingConfig,'1')
    load('DesignIteration1.mat');
    %Performance 
    plane.CD(:,1) = DesignIteration1(:,1);
    plane.CD(:,2) = DesignIteration1(:,6);
    plane.CL(:,1) = DesignIteration1(:,1);
    plane.CL(:,2) = DesignIteration1(:,3);
    %structure
    plane.m = 2.441;
    plane.S = 0.4068;

elseif strcmp(wingConfig,'2')
    load('DesignIteration2.mat');
    %Performance 
    plane.CD(:,1) = DesignIteration2(:,1);
    plane.CD(:,2) = DesignIteration2(:,6);
    plane.CL(:,1) = DesignIteration2(:,1);
    plane.CL(:,2) = DesignIteration2(:,3);
    %structure
    plane.m = 3.0;
    plane.S = 0.5;
elseif strcmp(wingConfig,'3')
    load('DesignIteration3.mat');
    %Performance 
    plane.CD(:,1) = DesignIteration3(:,1);
    plane.CD(:,2) = DesignIteration3(:,6);
    plane.CL(:,1) = DesignIteration3(:,1);
    plane.CL(:,2) = DesignIteration3(:,3);
    %structure
    plane.m = 2.441;
    plane.S = 0.406;
    
elseif strcmp(wingConfig,'4')
    load('DesignIteration3.mat');
    %Performance 
    plane.CD(:,1) = DesignIteration3(:,1);
    plane.CD(:,2) = DesignIteration3(:,6);
    plane.CL(:,1) = DesignIteration3(:,1);
    plane.CL(:,2) = DesignIteration3(:,3);
    %structure
    plane.m = 1.6;
    plane.S = 0.26;

else 
    disp('Please enter a valid wing configuration');
end
outPlane = plane;
end

