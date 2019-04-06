%% LOAD EXTERNAL FILES
    airfoil_areas = load('../../airfoil analysis/area_analysis/airfoil_areas.mat');

%% EXTERNAL CONDITIONS
    g = 9.81;
    rho = 1.225; %assume constant
    mu = 1.81E-5;

%% WING SECTION
    % Inputs:
        airfoil_wing = 'NACA2512';
        airfoil_area_wing = airfoil_areas.(airfoil_wing);
        
    % Constants:
        b_wing = 2;
        
%% Horizontal Stabilizer
    % Inputs:
        airfoil_hStabilizer = 'NACA0009';
        c_hStabilizer_0 = 0.12;
        c_hStabilizer_1 = 0.10;
        b_hStabilizer   = 0.60;
        iter_step = 10^-4;
        
    % Constants:
        
    % Calculations:
        airfoil_area_hStabilizer = airfoil_areas.(airfoil_hStabilizer);
        
        %trapezoidal rule to calculate volume
        volume = 0;
        iter = c_hStabilizer_1:(c_hStabilizer_0-c_hStabilizer_1)/b_hStabilizer*(2*iter_step):c_hStabilizer_0;
        for i=1:1:b_hStabilizer/(2*iter_step)
            airfoil_area_hStabilizer_iter0 = iter(i)*airfoil_area_hStabilizer;
            airfoil_area_hStabilizer_iter1 = iter(i+1)*airfoil_area_hStabilizer;
            area_mean = (airfoil_area_hStabilizer_iter0+airfoil_area_hStabilizer_iter1)/2;
            volume = volume + area_mean*iter_step;
        end 
        volume = volume*2;
        
        m_hStabilizer = volume * 30
        
%% FIN
    % Inputs:
        airfoil_fin = 'NACA0009';
        c_fin_0 = 0.18;
        c_fin_1 = 0.10;
        b_fin   = 0.25;
        iter_step_fin = 10^-4;
        
    % Constants:
        
    % Calculations:
        airfoil_area_fin = airfoil_areas.(airfoil_fin);
        
        %trapezoidal rule to calculate volume
        volume = 0;
        iter = c_fin_1:(c_fin_0-c_fin_1)/b_fin*(2*iter_step_fin):c_fin_0;
        for i=1:1:b_fin/(2*iter_step_fin)
            airfoil_area_fin_iter0 = iter(i)*airfoil_area_fin;
            airfoil_area_fin_iter1 = iter(i+1)*airfoil_area_fin;
            area_mean = (airfoil_area_fin_iter0+airfoil_area_fin_iter1)/2;
            volume = volume + area_mean*iter_step_fin;
        end 
        % volume = volume*2;
        
        m_fin = volume * 30

%% MISCELLANEOUS
    % Input:
    m_payload = 1;
    m_fuselage = 0.184/2;
    m_battery = 0.265;
    m_motor = 0.215;
    m_wheels = 0.05;

%% TOTAL
% aircraft properties
    % J = ;

% calculations
    m_total_minuswing = m_hStabilizer + m_fin + m_payload + m_fuselage + m_battery + m_motor + m_wheels;

    c_wing = m_total_minuswing/((6-airfoil_area_wing*30)*b_wing)  % based on wing loading
    S_wing = b_wing * c_wing;   % assuming rectangular wing
    
    m_wing = airfoil_area_wing*c_wing*b_wing*30
    
    m_total = m_total_minuswing + m_wing

    
