%% LOAD EXTERNAL FILES
    airfoil_areas = load('../../airfoil analysis/area_analysis/airfoil_areas.mat');

%% EXTERNAL CONDITIONS
    g = 9.81;
    rho = 1.225; %assume constant
    mu = 1.81E-5;

%% WING SECTION
    % Inputs:
        
        
    % Constants:
        b_wing = 2;
        
%% Horizontal Stabilizer
    % Inputs:
        airfoil = 'NACA0009';
        c_hStabilizer_0 = 0.12;
        c_hStabilizer_1 = 0.10;
        b_hStabilizer   = 0.60;
        
    % Constants:
        
    % Calculations:
        airfoil_area_hStabilizer = airfoil_areas.(airfoil);
        %volume = ; WILL USE TRAPEZOIDAL RULE
        %m_hStabilizer = 
        
%% FIN


%% MISCELLANEOUS
    % Input:

%% TOTAL
% aircraft properties
    m = 2;
    % J = ;

% calculations
    c_wing = m/(6*b_wing)  % based on wing loading
    S_wing = b_wing * c_wing   % assuming rectangular wing

