%% MECH 532 Project

% This script is for building the airfoil database, using XFOIL results.

% Author: Felix C.Lamy

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear all

%% Test Structure
test.airfoil = ["NACA21015","NACA21016"] ;
test.reynolds_number = 100000;
test.mach = 0.1;
test.alpha = (-5:0.2:15);
i = 1;

%% sweep through airfoil geometries

%loop through airfoils

for a = 1:length(test.airfoil)
    afoil_geo = char(test.airfoil(a));
    %loop through Reynolds numbers
    reynold_number = test.reynolds_number;

    %run xfoil
    [pol foil] = xfoil(afoil_geo,test.alpha,reynold_number,test.mach,'ppar n 100','oper iter 600');

    %convert to character array
    Re = sprintf('Re%d', reynold_number);

    %generate database
    data.(afoil_geo).(Re).foil = foil;
    data.(afoil_geo).(Re).pol = pol;
end
            

%% plot 

% Plot CL vs Alpha
subplot(2,2,1)
plot(data.NACA21015.Re100000.pol.alpha, data.NACA21015.Re100000.pol.CL, 'Linewidth', 1.2);
grid on;
xlabel('Angle of Attack [deg]');
ylabel('CL');
ylim([-1 1.75]);
title('CL vs alpha');

% Plot CM vs Alpha
subplot(2,2,2);
plot(data.NACA21015.Re100000.pol.alpha, data.NACA21015.Re100000.pol.Cm, 'Linewidth', 1.2);
grid on;
legend('Re100000','Re280000','Re460000','Re640000','Re820000','Re1000000');
xlabel('Angle of Attack [deg]');
ylabel('Cm');
title('Moment coefficient vs Angle of Attack');


% Plot CL/CD vs Alpha
subplot(2,2,3);
plot(data.NACA21015.Re100000.pol.alpha, data.NACA21015.Re100000.pol.CL./data.NACA21015.Re100000.pol.CD, 'Linewidth', 1.2);
grid on;
xlabel('Angle of Attack [deg]');
ylabel('L/D');
title('Cl/CD vs alpha');
ylim([-50 90]);

% Plot CL vs CD
subplot(2,2,4);
plot(data.NACA21015.Re100000.pol.CD, data.NACA21015.Re100000.pol.CL, 'Linewidth', 1.2);
grid on;
legend('Re100000','Re280000','Re460000','Re640000','Re820000','Re1000000','Location','southeast' );
xlabel('CD');
ylabel('CL');
title('Cl vs CD');
ylim([-0.75 1.75]);

set(gcf, 'Position', [70, 80, 1000, 650])
        

