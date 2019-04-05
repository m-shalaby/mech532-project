%Endurance Analysis Main - Mech 532

clc
clear all

%% ------------------------INPUT (Setup plane & test)----------------------

%set wing ID
wingID = '2512';

%flight mission
total_climb = 100;

%% ----------------------Generate Plane------------------------------------
%plane configuration
plane = genPlane(wingID);
%endurance flight parameters
%climb mapping sweeps
map_param.v = 1:0.5:15;             %Velocity 
map_param.theta = 1:0.5:15;        %theta
map_param.alpha = -3:0.1:10;        %alpha

%% -------------------Climb Optimization-----------------------------------

% [climb_states,map] = optimizeClimbparam(plane, total_climb, map_param);
climb_states = [9.5; 12; -0.5];

%% ------------------Endurance Calculation---------------------------------

flight = calcFlight(plane,climb_states)

%% ------------------------------------------------------------------------





