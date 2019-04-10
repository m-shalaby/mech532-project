%Endurance Analysis Main - Mech 532

clc
clear all

%% ------------------------INPUT(Setup plane & test)-----------------------

%set wing ID
wingID = '4';

%flight mission
total_climb = 100;

%% ----------------------Generate Plane------------------------------------
%plane configuration
plane = genPlane(wingID);
%endurance flight parameters
%climb mapping sweeps
map_param.v = 2:1:20;             %Velocity 
map_param.theta = 1:0.5:20;        %theta
map_param.alpha = -3.25:0.25:10;        %alpha

%% -------------------Climb Optimization-----------------------------------

[climb_states,map] = optimizeClimbparam(plane, map_param);
% climb_states = [9.5; 12; -0.5];

%% ------------------Endurance Calculation---------------------------------

flight = calcFlight(plane,climb_states) %#ok<NOPTS>

%% ------------------------------------------------------------------------





