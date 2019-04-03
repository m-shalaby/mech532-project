%Endurance Analysis Main

clc
clear all


%% setup plane 
wingID = '2208';
plane = genPlane(wingID);

%endurance flight parameters
total_climb = 100;
%climb mapping sweeps
map_param.v = 1:0.5:20;             %Velocity 
map_param.theta = 1:0.25:45;        %theta
map_param.alpha = -5:0.1:10;        %alpha

%% -------------------Climb Optimization------------------------------

[climb_states,map] = optimizeClimbparam(plane, total_climb, map_param);


%% ------------------Endurance Calculation----------------------------










