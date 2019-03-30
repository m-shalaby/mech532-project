%% MECH 533 Project

% This script is for building the airfoil database, using XFOIL results.

% Author: Felix C.Lamy

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear all


%% Test Structure
test.airfoil = 'NACA21015';
test.reynolds_number = (100000:180000:1000000);
test.mach = 0.1;
test.alpha = (-5:0.2:25);
i = 1;

%% sweep through airfoil geometries

%loop through airfoils
    afoil_geo = char(test.airfoil);
    %loop through Reynolds numbers
    for m = 1:length(test.reynolds_number)
        reynold_number = test.reynolds_number(m);
                        
            %run xfoil
            [pol foil] = xfoil(afoil_geo,test.alpha,reynold_number,test.mach,'ppar n 100','oper iter 600');
           
            %convert to character array
            Re = sprintf('Re%d', reynold_number);
            
            %generate database
            data.(afoil_geo).(Re).foil = foil;
            data.(afoil_geo).(Re).pol = pol;
            
        
    end
