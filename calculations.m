%%INPUTS
%external conditions

g = 9.81;
rho = 1.225; %assume constant


%aircraft properties

m = 2.32;
% J = ;
S_wing = 2*0.18;



%% LEVEL FLIGHT

%Level Flight conditions
V_lf = 20;
alt_lf = 100;

%Results

L_lf = m*g;
CL_lf = L_lf/(0.5*rho*V_lf^2*S_wing)



%% BANKED TURN

%Banked Turn conditions

phi = pi/4;

%Results

N = 1/cos(phi);
L_bt = m*g/cos(phi)
V = sqrt(2*L_bt/(rho*S_wing*CL_lf))



%% CLIMB



