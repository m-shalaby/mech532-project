%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MECH 533 
% Felix Couturier-Lamy 260617874

% Assignment 4 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear all


%% load data

load('airfoil_data.mat');


%% calculate airfoil metrics


[airfoil_list, airfoil_metrics] = select_airfoils(data, 0.24, 0.26, 10);

airfoil_metrics(airfoil_metrics>5) = 0;

%% Airfoil Performance Subplot


font_size = 15;
line_size = 15;
line_width = 1.2;

airfoilA = char(airfoil_list(1));
airfoilB = char(airfoil_list(2));
airfoilC = char(airfoil_list(3));
airfoilD = char(airfoil_list(4));
airfoilE = char(airfoil_list(5));

% Plot CL vs Alpha
subplot(2,2,1)
plot(data.(airfoilA).Re250000.pol.alpha, data.(airfoilA).Re250000.pol.CL, ...
    data.(airfoilB).Re250000.pol.alpha, data.(airfoilB).Re250000.pol.CL, ...
    data.(airfoilC).Re250000.pol.alpha, data.(airfoilC).Re250000.pol.CL, ...
    data.(airfoilD).Re250000.pol.alpha, data.(airfoilD).Re250000.pol.CL, ...
    data.(airfoilE).Re250000.pol.alpha, data.(airfoilE).Re250000.pol.CL,'Linewidth',line_width);
grid on;
xlabel('Angle of Attack [deg]','fontsize',font_size,'Interpreter','latex');
ylabel('Cl','fontsize',font_size,'Interpreter','latex');
ylim([-1 1.75]);
title('Cl','fontsize',font_size,'Interpreter','latex');
set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)


% Plot Efficiency Metric vs Alpha
subplot(2,2,2);
plot(data.(airfoilA).Re250000.pol.alpha, data.(airfoilA).Re250000.pol.CD./(abs(data.(airfoilA).Re250000.pol.CL).^1.5), ...
    data.(airfoilB).Re250000.pol.alpha, data.(airfoilB).Re250000.pol.CD./(abs(data.(airfoilB).Re250000.pol.CL).^1.5), ...
    data.(airfoilC).Re250000.pol.alpha, data.(airfoilC).Re250000.pol.CD./(abs(data.(airfoilC).Re250000.pol.CL).^1.5), ...
    data.(airfoilD).Re250000.pol.alpha, data.(airfoilD).Re250000.pol.CD./(abs(data.(airfoilD).Re250000.pol.CL).^1.5), ...
    data.(airfoilE).Re250000.pol.alpha, data.(airfoilE).Re250000.pol.CD./(abs(data.(airfoilE).Re250000.pol.CL).^1.5),'Linewidth',line_width);
grid on;
xlabel('Angle of Attack [deg]','fontsize',font_size,'Interpreter','latex');
ylabel('${\it} Cl/(Cd^{3/2})$','fontsize',font_size,'Interpreter','latex');
ylim([0 0.1]);
title('Steady Flight Metric','fontsize',font_size,'Interpreter','latex');
legend(airfoilA,airfoilB,airfoilC,airfoilD,airfoilE,'Interpreter','latex');
set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)


% Plot CL/CD vs Alpha
subplot(2,2,3);
plot(data.(airfoilA).Re250000.pol.alpha, data.(airfoilA).Re250000.pol.CL./data.(airfoilA).Re250000.pol.CD, ...
    data.(airfoilB).Re250000.pol.alpha, data.(airfoilB).Re250000.pol.CL./data.(airfoilB).Re250000.pol.CD, ...
    data.(airfoilC).Re250000.pol.alpha, data.(airfoilC).Re250000.pol.CL./data.(airfoilC).Re250000.pol.CD, ...
    data.(airfoilD).Re250000.pol.alpha, data.(airfoilD).Re250000.pol.CL./data.(airfoilD).Re250000.pol.CD, ...
    data.(airfoilE).Re250000.pol.alpha, data.(airfoilE).Re250000.pol.CL./data.(airfoilE).Re250000.pol.CD,'Linewidth',line_width);
grid on;
xlabel('Angle of Attack [deg]','fontsize',font_size,'Interpreter','latex');
ylabel('L/D','fontsize',font_size,'Interpreter','latex');
title('L/D','fontsize',font_size,'Interpreter','latex');
ylim([-50 90]);
set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)

% Plot CM vs alpha
subplot(2,2,4);
plot(data.(airfoilA).Re250000.pol.alpha, data.(airfoilA).Re250000.pol.Cm, ...
    data.(airfoilB).Re250000.pol.alpha, data.(airfoilB).Re250000.pol.Cm, ...
    data.(airfoilC).Re250000.pol.alpha, data.(airfoilC).Re250000.pol.Cm, ...
    data.(airfoilD).Re250000.pol.alpha, data.(airfoilD).Re250000.pol.Cm, ...
    data.(airfoilE).Re250000.pol.alpha, data.(airfoilE).Re250000.pol.Cm,'Linewidth',line_width);
grid on;
xlabel('Angle of Attack [deg]','fontsize',font_size,'Interpreter','latex');
ylabel('Cm','fontsize',font_size,'Interpreter','latex');
title('Cm','fontsize',font_size,'Interpreter','latex');
set(gcf, 'Position', [70, 80, 1000, 650])
set(gca,'XMinorGrid','off','GridLineStyle','-','FontSize',line_size)

figure();
plot(data.(airfoilA).Re250000.foil.x(1:100,1),data.(airfoilA).Re250000.foil.y(1:100,1),...
    data.(airfoilB).Re250000.foil.x(1:100,1),data.(airfoilB).Re250000.foil.y(1:100,1),...
    data.(airfoilC).Re250000.foil.x(1:100,1),data.(airfoilC).Re250000.foil.y(1:100,1),...
    data.(airfoilD).Re250000.foil.x(1:100,1),data.(airfoilD).Re250000.foil.y(1:100,1),...
    data.(airfoilE).Re250000.foil.x(1:100,1),data.(airfoilE).Re250000.foil.y(1:100,1),'--b','Linewidth',line_width)
legend(airfoilA,airfoilB,airfoilC,airfoilD,airfoilE,'Interpreter','latex');
xlabel('x coordinates','fontsize',font_size,'Interpreter','latex');
ylabel('y coordinates','fontsize',font_size,'Interpreter','latex');
title('Airfoil Geometries','fontsize',font_size,'Interpreter','latex');
grid on
axis equal
%% Plot Cm vs Alpha

%% Airfoil Performance Subplot - single Airfoil

airfoilA = char(airfoil_list(5));

% Plot CL vs Alpha
subplot(2,2,1)
plot(data.(airfoilA).Re250000.pol.alpha, data.(airfoilA).Re250000.pol.CL,'Linewidth', 1.2);
grid on;
xlabel('Angle of Attack [deg]');
ylabel('CL');
ylim([-1 1.75]);
title('Cl vs alpha');

% Plot Efficiency Metric vs Alpha
subplot(2,2,2);
plot(data.(airfoilA).Re250000.pol.alpha, data.(airfoilA).Re250000.pol.CD./(real(data.(airfoilA).Re250000.pol.CL.^1.5)),'Linewidth', 1.2);
grid on;
xlabel('Angle of Attack [deg]');
ylabel('CD/CL^(3/2)');
% ylim([0 0.05]);
title('Steady Flight Metric vs alpha');


% Plot CL/CD vs Alpha
subplot(2,2,3);
plot(data.(airfoilA).Re250000.pol.alpha, data.(airfoilA).Re250000.pol.CL./data.(airfoilA).Re250000.pol.CD,'Linewidth', 1.2);
grid on;
xlabel('Angle of Attack [deg]');
ylabel('L/D');
title('Cl/CD vs alpha');
ylim([-50 90]);

% Plot CM vs alpha
subplot(2,2,4);
plot(data.(airfoilA).Re250000.pol.alpha, data.(airfoilA).Re250000.pol.Cm,'Linewidth', 1.2);
grid on;
xlabel('Angle of Attack [deg]');
ylabel('Cm');
title('Moment coefficient vs Angle of Attack');
set(gcf, 'Position', [70, 80, 1000, 650])



%% Plot airfoil









