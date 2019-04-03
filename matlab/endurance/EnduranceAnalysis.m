%Endurance Analysis Main

clc
clear all

%% setup plane 
wingID = '2208';
plane = genPlane(wingID);

%endurance flight parameters
total_climb = 100;
%climb mapping sweeps
map_param.v = 1:0.5:15;             %Velocity 
map_param.theta = 1:0.5:15;        %theta
map_param.alpha = -3:0.1:10;        %alpha

%% -------------------Climb Optimization------------------------------

% [climb_states,map] = optimizeClimbparam(plane, total_climb, map_param);

climb_states = [9.5; 12; -0.5];

%% ------------------Endurance Calculation----------------------------

maxAltitude = 100;
flight = calcEndurance(plane,climb_states, maxAltitude);








