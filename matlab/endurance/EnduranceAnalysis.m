%Endurance Analysis Main

clc
clear all

%% ------------------------Setup plane-------------------------------------

wingID = '2208';

plane = genPlane(wingID);
%endurance flight parameters
total_climb = 100;
%climb mapping sweeps
map_param.v = 1:0.5:15;             %Velocity 
map_param.theta = 1:0.5:15;        %theta
map_param.alpha = -3:0.1:10;        %alpha

%% -------------------Climb Optimization-----------------------------------

% [climb_states,map] = optimizeClimbparam(plane, total_climb, map_param);

climb_states = [9.5; 12; -0.5];


%% -------------------Steady Flight Optimization---------------------------

fun = @(x,plane, climb_states)Flight_finalQ(x,plane,climb_states);
x0 = 2000;
distance = fminsearch(fun,x0);

%% ------------------Endurance Calculation---------------------------------

maxAltitude = 100;
flight = calcFlight(plane,climb_states, distance);

%% ------------------Flight Analysis --------------------------------------

total_endurance = flight.total_time;






