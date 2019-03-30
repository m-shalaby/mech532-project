%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MECH 533 
% Felix Couturier-Lamy 260617874

% Assignment 4 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear all


%% load data

load('data_run3.mat');


%% Airfoil Performance Subplot

% Plot CL vs Alpha
subplot(2,2,1)
plot(data.NACA21015.Re100000.pol.alpha, data.NACA21015.Re100000.pol.CL, ...
    data.NACA21015.Re280000.pol.alpha, data.NACA21015.Re280000.pol.CL, ...
    data.NACA21015.Re460000.pol.alpha, data.NACA21015.Re460000.pol.CL, ...
    data.NACA21015.Re640000.pol.alpha, data.NACA21015.Re640000.pol.CL, ...
    data.NACA21015.Re820000.pol.alpha, data.NACA21015.Re820000.pol.CL, ...
    data.NACA21015.Re1000000.pol.alpha, data.NACA21015.Re1000000.pol.CL, ...
    'Linewidth', 1.2);
grid on;
xlabel('Angle of Attack [deg]');
ylabel('CL');
ylim([-1 1.75]);
title('Cl vs alpha');

% Plot CD vs Alpha
subplot(2,2,2);
plot(data.NACA21015.Re100000.pol.alpha, data.NACA21015.Re100000.pol.CD, ...
    data.NACA21015.Re280000.pol.alpha, data.NACA21015.Re280000.pol.CD, ...
    data.NACA21015.Re460000.pol.alpha, data.NACA21015.Re460000.pol.CD, ...
    data.NACA21015.Re640000.pol.alpha, data.NACA21015.Re640000.pol.CD, ...
    data.NACA21015.Re820000.pol.alpha, data.NACA21015.Re820000.pol.CD, ...
    data.NACA21015.Re1000000.pol.alpha, data.NACA21015.Re1000000.pol.CD, ...
    'Linewidth', 1.2);
grid on;
xlabel('Angle of Attack [deg]');
ylabel('CD');
title('CD vs alpha');

% Plot CL/CD vs Alpha
subplot(2,2,3);
plot(data.NACA21015.Re100000.pol.alpha, data.NACA21015.Re100000.pol.CL./data.NACA21015.Re100000.pol.CD, ...
    data.NACA21015.Re280000.pol.alpha, data.NACA21015.Re280000.pol.CL./data.NACA21015.Re280000.pol.CD, ...
    data.NACA21015.Re460000.pol.alpha, data.NACA21015.Re460000.pol.CL./data.NACA21015.Re460000.pol.CD, ...
    data.NACA21015.Re640000.pol.alpha, data.NACA21015.Re640000.pol.CL./data.NACA21015.Re640000.pol.CD, ...
    data.NACA21015.Re820000.pol.alpha, data.NACA21015.Re820000.pol.CL./data.NACA21015.Re820000.pol.CD, ...
    data.NACA21015.Re1000000.pol.alpha, data.NACA21015.Re1000000.pol.CL./data.NACA21015.Re1000000.pol.CD, ...
    'Linewidth', 1.2);
grid on;
xlabel('Angle of Attack [deg]');
ylabel('L/D');
title('Cl/CD vs alpha');
ylim([-50 90]);

% Plot CL vs CD
subplot(2,2,4);
plot(data.NACA21015.Re100000.pol.CD, data.NACA21015.Re100000.pol.CL, ...
    data.NACA21015.Re280000.pol.CD, data.NACA21015.Re280000.pol.CL, ...
    data.NACA21015.Re460000.pol.CD, data.NACA21015.Re460000.pol.CL, ...
    data.NACA21015.Re640000.pol.CD, data.NACA21015.Re640000.pol.CL, ...
    data.NACA21015.Re820000.pol.CD, data.NACA21015.Re820000.pol.CL, ...
    data.NACA21015.Re1000000.pol.CD, data.NACA21015.Re1000000.pol.CL, ...
    'Linewidth', 1.2);
grid on;
legend('Re100000','Re280000','Re460000','Re640000','Re820000','Re1000000','Location','southeast' );
xlabel('CD');
ylabel('CL');
title('Cl vs CD');
ylim([-0.75 1.75]);

set(gcf, 'Position', [70, 80, 1000, 650])
%% Plot Cm vs Alpha

plot(data.NACA21015.Re100000.pol.alpha, data.NACA21015.Re100000.pol.Cm, ...
    data.NACA21015.Re280000.pol.alpha, data.NACA21015.Re280000.pol.Cm, ...
    data.NACA21015.Re460000.pol.alpha, data.NACA21015.Re460000.pol.Cm, ...
    data.NACA21015.Re640000.pol.alpha, data.NACA21015.Re640000.pol.Cm, ...
    data.NACA21015.Re820000.pol.alpha, data.NACA21015.Re820000.pol.Cm, ...
    data.NACA21015.Re1000000.pol.alpha, data.NACA21015.Re1000000.pol.Cm, ...
    'Linewidth', 1.2);
grid on;
legend('Re100000','Re280000','Re460000','Re640000','Re820000','Re1000000');
xlabel('Angle of Attack [deg]');
ylabel('Cm');
title('Moment coefficient vs Angle of Attack');


%% Plot CDp vs Alpha (Pressure Drag)

plot(data.NACA21015.Re100000.pol.alpha, data.NACA21015.Re100000.pol.CDp, ...
    data.NACA21015.Re280000.pol.alpha, data.NACA21015.Re280000.pol.CDp, ...
    data.NACA21015.Re460000.pol.alpha, data.NACA21015.Re460000.pol.CDp, ...
    data.NACA21015.Re640000.pol.alpha, data.NACA21015.Re640000.pol.CDp, ...
    data.NACA21015.Re820000.pol.alpha, data.NACA21015.Re820000.pol.CDp, ...
    data.NACA21015.Re1000000.pol.alpha, data.NACA21015.Re1000000.pol.CDp, ...
    'Linewidth', 1.2);
grid on;
legend('Re100000','Re280000','Re460000','Re640000','Re820000','Re1000000','Location','northwest');
xlabel('Angle of Attack [deg]');
ylabel('CDp');
title('Pressure drag vs Alpha');


%% Plot (CD-CDp) vs Alpha (Skin Drag)

plot(data.NACA21015.Re100000.pol.alpha, data.NACA21015.Re100000.pol.CD-data.NACA21015.Re100000.pol.CDp, ...
    data.NACA21015.Re280000.pol.alpha, data.NACA21015.Re280000.pol.CD-data.NACA21015.Re280000.pol.CDp, ...
    data.NACA21015.Re460000.pol.alpha, data.NACA21015.Re460000.pol.CD-data.NACA21015.Re460000.pol.CDp, ...
    data.NACA21015.Re640000.pol.alpha, data.NACA21015.Re640000.pol.CD-data.NACA21015.Re640000.pol.CDp, ...
    data.NACA21015.Re820000.pol.alpha, data.NACA21015.Re820000.pol.CD-data.NACA21015.Re820000.pol.CDp, ...
    data.NACA21015.Re1000000.pol.alpha, data.NACA21015.Re1000000.pol.CD-data.NACA21015.Re1000000.pol.CDp, ...
    'Linewidth', 1.2);
grid on;
legend('Re100000','Re280000','Re460000','Re640000','Re820000','Re1000000');
xlabel('Angle of Attack [deg]');
ylabel('Coefficient of Drag - Skin');
title('Skin drag vs alpha');

%% Plot Transition Point Vs Alpha

% Plot Top Transition Point Vs Alpha
subplot(1,2,1);
plot(data.NACA21015.Re100000.pol.alpha, data.NACA21015.Re100000.pol.Top_xtr, ...
    data.NACA21015.Re280000.pol.alpha, data.NACA21015.Re280000.pol.Top_xtr, ...
    data.NACA21015.Re460000.pol.alpha, data.NACA21015.Re460000.pol.Top_xtr, ...
    data.NACA21015.Re640000.pol.alpha, data.NACA21015.Re640000.pol.Top_xtr, ...
    data.NACA21015.Re820000.pol.alpha, data.NACA21015.Re820000.pol.Top_xtr, ...
    data.NACA21015.Re1000000.pol.alpha, data.NACA21015.Re1000000.pol.Top_xtr, ...
    'Linewidth', 1.2);
grid on;
xlabel('Angle of Attack [deg]');
ylabel('Transition Point [x/c]');
title('Transition Point on Airfoil Upper Surface');
ylim([0 1.04]);
xlim([-6 20]);
% Plot Bottom Transition Point Vs Alpha
subplot(1,2,2);
plot(data.NACA21015.Re100000.pol.alpha, data.NACA21015.Re100000.pol.Bot_Xtr, ...
    data.NACA21015.Re280000.pol.alpha, data.NACA21015.Re280000.pol.Bot_Xtr, ...
    data.NACA21015.Re460000.pol.alpha, data.NACA21015.Re460000.pol.Bot_Xtr, ...
    data.NACA21015.Re640000.pol.alpha, data.NACA21015.Re640000.pol.Bot_Xtr, ...
    data.NACA21015.Re820000.pol.alpha, data.NACA21015.Re820000.pol.Bot_Xtr, ...
    data.NACA21015.Re1000000.pol.alpha, data.NACA21015.Re1000000.pol.Bot_Xtr, ...
    'Linewidth', 1.2);
grid on;
legend('Re100000','Re280000','Re460000','Re640000','Re820000','Re1000000','Location','southeast');
xlabel('Angle of Attack [deg]');
ylabel('Transition Point [x/c]');
title('Transition Point on Airfoil Lower Surface');
ylim([0 1.04]);
xlim([-6 20]);
set(gcf, 'Position', [200, 200, 1000, 400])

%% Plot Cp vs chord (Skin Drag)

% plot(data.NACA21015.Re100000.foil.xcp, data.NACA21015.Re100000.foil.cp, ...
%     data.NACA21015.Re280000.foil.xcp, data.NACA21015.Re280000.foil.cp, ...
%     data.NACA21015.Re460000.foil.xcp, data.NACA21015.Re460000.foil.cp, ...
%     data.NACA21015.Re640000.foil.xcp, data.NACA21015.Re640000.foil.cp, ...
%     data.NACA21015.Re820000.foil.xcp, data.NACA21015.Re820000.foil.cp, ...
%     data.NACA21015.Re1000000.foil.xcp, data.NACA21015.Re1000000.foil.cp, ...
%     'Linewidth', 1.2);

plot(data.NACA21015.Re100000.foil.xcp(:,1), data.NACA21015.Re100000.foil.cp);
grid on;
legend('Re100000','Re280000','Re460000','Re640000','Re820000','Re1000000');
xlabel('Angle of Attack [deg]');
ylabel('Transition Point');
title('Transition Point (Top) vs alpha');


%% Plot Peak CL vs Re

subplot(2,2,1);
% find CL peaks
peak_CL_100000 = max(data.NACA21015.Re100000.pol.CL);
peak_CL_280000 = max(data.NACA21015.Re280000.pol.CL);
peak_CL_460000 = max(data.NACA21015.Re460000.pol.CL);
peak_CL_640000 = max(data.NACA21015.Re640000.pol.CL);
peak_CL_820000 = max(data.NACA21015.Re820000.pol.CL);
peak_CL_1000000 = max(data.NACA21015.Re1000000.pol.CL);
%build array
peak_CL(:,1) = [data.NACA21015.Re100000.pol.Re; data.NACA21015.Re280000.pol.Re; data.NACA21015.Re460000.pol.Re; data.NACA21015.Re640000.pol.Re; data.NACA21015.Re820000.pol.Re; data.NACA21015.Re1000000.pol.Re];
peak_CL(:,2) = [peak_CL_100000; peak_CL_280000; peak_CL_460000; peak_CL_640000; peak_CL_820000; peak_CL_1000000];
%fit polynomial
peak_CL_fit = polyfit(peak_CL(:,1), peak_CL(:,2),2);
%evaluate polynomial
x1 = 100000:1000:1000000;
y1 = polyval(peak_CL_fit,x1);
%figure
plot(peak_CL(:,1), peak_CL(:,2), 'o', 'LineWidth', 1.5);
hold on
plot(x1,y1, 'LineWidth', 1)
hold off
grid on
ylim([0.85 1.5]);
xlim([0.9E5 1.05E6]);
xlabel('Reynolds Number [Re]');
ylabel('Lift [CL]');
title('Peak Lift vs Reynolds Number');
% Plot Peak L/D vs Re

subplot(2,2,3)
% find CL peaks
peak_eff_100000 = max(data.NACA21015.Re100000.pol.CL./data.NACA21015.Re100000.pol.CD);
peak_eff_280000 = max(data.NACA21015.Re280000.pol.CL./data.NACA21015.Re280000.pol.CD);
peak_eff_460000 = max(data.NACA21015.Re460000.pol.CL./data.NACA21015.Re460000.pol.CD);
peak_eff_640000 = max(data.NACA21015.Re640000.pol.CL./data.NACA21015.Re640000.pol.CD);
peak_eff_820000 = max(data.NACA21015.Re820000.pol.CL./data.NACA21015.Re820000.pol.CD);
peak_eff_1000000 = max(data.NACA21015.Re1000000.pol.CL./data.NACA21015.Re1000000.pol.CD);
%build array
peak_eff(:,1) = [data.NACA21015.Re100000.pol.Re; data.NACA21015.Re280000.pol.Re; data.NACA21015.Re460000.pol.Re; data.NACA21015.Re640000.pol.Re; data.NACA21015.Re820000.pol.Re; data.NACA21015.Re1000000.pol.Re];
peak_eff(:,2) = [peak_eff_100000; peak_eff_280000; peak_eff_460000; peak_eff_640000; peak_eff_820000; peak_eff_1000000];
%fit polynomial
peak_eff_fit = polyfit(peak_eff(:,1), peak_eff(:,2),2);
%evaluate polynomial
x1 = 100000:1000:1000000;
y1 = polyval(peak_eff_fit,x1);
%figure

plot(peak_eff(:,1), peak_eff(:,2), 'o', 'LineWidth', 1.5);
hold on
plot(x1,y1, 'LineWidth', 1)
grid on
hold off
xlim([0.9E5 1.05E6]);
xlabel('Reynolds Number [Re]');
ylabel('Peak L/D');
title('Peak Efficiency vs Reynolds Number');

% Plot alpha @ peak CL vs Re

subplot(2,2,2)
% find CL peaks
[peak_CL_100000, I_100000]  = max(data.NACA21015.Re100000.pol.CL);
[peak_CL_280000, I_280000] = max(data.NACA21015.Re280000.pol.CL);
[peak_CL_460000, I_460000] = max(data.NACA21015.Re460000.pol.CL);
[peak_CL_640000, I_640000] = max(data.NACA21015.Re640000.pol.CL);
[peak_CL_820000, I_820000] = max(data.NACA21015.Re820000.pol.CL);
[peak_CL_1000000, I_1000000] = max(data.NACA21015.Re1000000.pol.CL);
%find alpha @ peak CL
alpha_peak_CL_100000 = data.NACA21015.Re100000.pol.alpha(I_100000);
alpha_peak_CL_280000 = data.NACA21015.Re280000.pol.alpha(I_280000);
alpha_peak_CL_460000 = data.NACA21015.Re460000.pol.alpha(I_460000);
alpha_peak_CL_640000 = data.NACA21015.Re640000.pol.alpha(I_640000);
alpha_peak_CL_820000 = data.NACA21015.Re820000.pol.alpha(I_820000);
alpha_peak_CL_1000000 = data.NACA21015.Re1000000.pol.alpha(I_1000000);

%build array
alpha_peak_CL(:,1) = [data.NACA21015.Re100000.pol.Re; data.NACA21015.Re280000.pol.Re; data.NACA21015.Re460000.pol.Re; data.NACA21015.Re640000.pol.Re; data.NACA21015.Re820000.pol.Re; data.NACA21015.Re1000000.pol.Re];
alpha_peak_CL(:,2) = [alpha_peak_CL_100000; alpha_peak_CL_280000; alpha_peak_CL_460000; alpha_peak_CL_640000; alpha_peak_CL_820000; alpha_peak_CL_1000000];
%fit polynomial
alpha_peak_CL_fit = polyfit(alpha_peak_CL(:,1), alpha_peak_CL(:,2),2);
%evaluate polynomial
x1 = 100000:1000:1000000;
y1 = polyval(alpha_peak_CL_fit,x1);
%figure
plot(alpha_peak_CL(:,1), alpha_peak_CL(:,2), 'o', 'LineWidth', 1.5);
hold on
plot(x1,y1, 'LineWidth', 1)
grid on
hold off
xlim([0.9E5 1.05E6]);
xlabel('Reynolds Number [Re]');
ylabel('alpha [deg]');
title('Angle of Attack @ peak Lift');
% Plot alpha @ peak efficiency vs Re

subplot(2,2,4)
% find efficiency peaks
[peak_eff_100000, I_100000] = max(data.NACA21015.Re100000.pol.CL./data.NACA21015.Re100000.pol.CD);
[peak_eff_280000, I_280000] = max(data.NACA21015.Re280000.pol.CL./data.NACA21015.Re280000.pol.CD);
[peak_eff_460000, I_460000] = max(data.NACA21015.Re460000.pol.CL./data.NACA21015.Re460000.pol.CD);
[peak_eff_640000, I_640000] = max(data.NACA21015.Re640000.pol.CL./data.NACA21015.Re640000.pol.CD);
[peak_eff_820000, I_820000] = max(data.NACA21015.Re820000.pol.CL./data.NACA21015.Re820000.pol.CD);
[peak_eff_1000000, I_1000000] = max(data.NACA21015.Re1000000.pol.CL./data.NACA21015.Re1000000.pol.CD);
%find alpha @ peak CL
alpha_peak_eff_100000 = data.NACA21015.Re100000.pol.alpha(I_100000);
alpha_peak_eff_280000 = data.NACA21015.Re280000.pol.alpha(I_280000);
alpha_peak_eff_460000 = data.NACA21015.Re460000.pol.alpha(I_460000);
alpha_peak_eff_640000 = data.NACA21015.Re640000.pol.alpha(I_640000);
alpha_peak_eff_820000 = data.NACA21015.Re820000.pol.alpha(I_820000);
alpha_peak_eff_1000000 = data.NACA21015.Re1000000.pol.alpha(I_1000000);

%build array
alpha_peak_eff(:,1) = [data.NACA21015.Re100000.pol.Re; data.NACA21015.Re280000.pol.Re; data.NACA21015.Re460000.pol.Re; data.NACA21015.Re640000.pol.Re; data.NACA21015.Re820000.pol.Re; data.NACA21015.Re1000000.pol.Re];
alpha_peak_eff(:,2) = [alpha_peak_eff_100000; alpha_peak_eff_280000; alpha_peak_eff_460000; alpha_peak_eff_640000; alpha_peak_eff_820000; alpha_peak_eff_1000000];
%fit polynomial
alpha_peak_eff_fit = polyfit(alpha_peak_eff(:,1), alpha_peak_eff(:,2),2);
%evaluate polynomial
x1 = 100000:1000:1000000;
y1 = polyval(alpha_peak_eff_fit,x1);
%figure
plot(alpha_peak_eff(:,1), alpha_peak_eff(:,2), 'o', 'LineWidth', 1.5);
hold on
plot(x1,y1, 'LineWidth', 1)
grid on
xlim([0.9E5 1.05E6]);
ylim([3.75 8.5]);
xlabel('Reynolds Number [Re]');
ylabel('alpha [deg]');
title('Angle of Attack @ peak Efficiency');

set(gcf, 'Position', [70, 80, 1000, 650])
%% Plot foil data

plot(data.NACA21015.Re280000.foil.x(1:100,1),data.NACA21015.Re280000.foil.y(1:100,1))
% pbaspect([1 1 1]);
ylim([-1 1]);

%%
plot(data.NACA21015.Re280000.foil.s(1:50,10),data.NACA21015.Re280000.foil.cp(1:50,10))
hold on

%%
plot(data.NACA21015.Re280000.foil.xcp(1:100,90),data.NACA21015.Re280000.foil.cp(1:100,90))

%%
plot(data.NACA21015.Re280000.foil.xcp(1:100,90),data.NACA21015.Re280000.foil.Dstar(1:100,90))

%%
plot(data.NACA21015.Re280000.foil.xcp(1:100,90),data.NACA21015.Re280000.foil.cp(1:100,90))

%%
plot(data.NACA21015.Re280000.foil.xcp(1:100,10),data.NACA21015.Re280000.foil.H(1:100,10))
grid on;


%% Plot CP vs Alpha with Airfoil shape

w = 1.1;
i1 = find(data.NACA21015.Re100000.foil.alpha == -5);
i2 = find(data.NACA21015.Re100000.foil.alpha == 0);
i3 = find(data.NACA21015.Re100000.foil.alpha == 5);
i4 = find(data.NACA21015.Re100000.foil.alpha == 10);
i5 = find(data.NACA21015.Re100000.foil.alpha == 15);
i6 = find(data.NACA21015.Re100000.foil.alpha == 20);
cla reset

subplot(2,2,1);
hold on
set(gca,'Ydir','reverse')
plot(data.NACA21015.Re460000.foil.xcp(1:100,i2),data.NACA21015.Re460000.foil.cp(1:100,i2),...
    data.NACA21015.Re460000.foil.xcp(1:100,i3),data.NACA21015.Re460000.foil.cp(1:100,i3),...
    data.NACA21015.Re460000.foil.xcp(1:100,i4),data.NACA21015.Re460000.foil.cp(1:100,i4),'-',...
    data.NACA21015.Re460000.foil.xcp(1:100,i5),data.NACA21015.Re460000.foil.cp(1:100,i5),'-',...
    data.NACA21015.Re460000.foil.xcp(1:100,i6),data.NACA21015.Re460000.foil.cp(1:100,i6),'-','LineWidth', w);
xlabel('x/c');
ylabel('Cp');
yyaxis right
plot(data.NACA21015.Re460000.foil.x(1:100,1),data.NACA21015.Re460000.foil.y(1:100,1),'--b','Linewidth', 1.5)
ylim([-1 1]);
ylabel('z/c');
grid on
hold off
title('Re = 460,000');

subplot(2,2,2);
hold on
set(gca,'Ydir','reverse')
plot(data.NACA21015.Re640000.foil.xcp(1:100,i2),data.NACA21015.Re640000.foil.cp(1:100,i2),'-',...
    data.NACA21015.Re640000.foil.xcp(1:100,i3),data.NACA21015.Re640000.foil.cp(1:100,i3),'-',...
    data.NACA21015.Re640000.foil.xcp(1:100,i4),data.NACA21015.Re640000.foil.cp(1:100,i4),'-',...
    data.NACA21015.Re640000.foil.xcp(1:100,i5),data.NACA21015.Re640000.foil.cp(1:100,i5),'-',...
    data.NACA21015.Re640000.foil.xcp(1:100,i6),data.NACA21015.Re640000.foil.cp(1:100,i6),'-','LineWidth', w);
xlabel('x/c');
ylabel('Cp');
yyaxis right
plot(data.NACA21015.Re640000.foil.x(1:100,1),data.NACA21015.Re640000.foil.y(1:100,1),'--b','Linewidth', 1.5)
ylim([-1 1]);
ylabel('z/c');
grid on
hold off
title('Re = 640,000');

subplot(2,2,3);
hold on
set(gca,'Ydir','reverse')
a1 = 0;
a2 = 5;
a3 = 10;
a4 = 15;
a5 = 17.5;
plot(data.NACA21015.Re820000.foil.xcp(1:100,(find(data.NACA21015.Re820000.foil.alpha == a1))),data.NACA21015.Re820000.foil.cp(1:100,(find(data.NACA21015.Re820000.foil.alpha == a1))),'-',...
    data.NACA21015.Re820000.foil.xcp(1:100,(find(data.NACA21015.Re820000.foil.alpha == a2))),data.NACA21015.Re820000.foil.cp(1:100,(find(data.NACA21015.Re820000.foil.alpha == a2))),'-',...
    data.NACA21015.Re820000.foil.xcp(1:100,(find(data.NACA21015.Re820000.foil.alpha == a3))),data.NACA21015.Re820000.foil.cp(1:100,(find(data.NACA21015.Re820000.foil.alpha == a3))),'-',...
    data.NACA21015.Re820000.foil.xcp(1:100,(find(data.NACA21015.Re820000.foil.alpha == a4))),data.NACA21015.Re820000.foil.cp(1:100,(find(data.NACA21015.Re820000.foil.alpha == a4))),'-',...
    data.NACA21015.Re820000.foil.xcp(1:100,(find(data.NACA21015.Re820000.foil.alpha == a5))),data.NACA21015.Re820000.foil.cp(1:100,(find(data.NACA21015.Re820000.foil.alpha == a5))),'-','LineWidth', w);
xlabel('x/c');
ylabel('Cp');
yyaxis right
plot(data.NACA21015.Re820000.foil.x(1:100,1),data.NACA21015.Re820000.foil.y(1:100,1),'--b','Linewidth', 1.5)
ylim([-1 1]);
ylabel('z/c');
grid on
hold off
legend('alpha = 0deg','alpha = 5deg', 'alpha = 10deg', 'alpha = 15deg', 'alpha = 17.5deg','Airfoil','Location','northeast');
title('Re = 820,000');

subplot(2,2,4);
hold on
set(gca,'Ydir','reverse')
a1 = 0;
a2 = 5;
a3 = 10;
a4 = 15;
a5 = 20;
plot(data.NACA21015.Re1000000.foil.xcp(1:100,(find(data.NACA21015.Re1000000.foil.alpha == a1))),data.NACA21015.Re1000000.foil.cp(1:100,(find(data.NACA21015.Re1000000.foil.alpha == a1))),'-',...
    data.NACA21015.Re1000000.foil.xcp(1:100,(find(data.NACA21015.Re1000000.foil.alpha == a2))),data.NACA21015.Re1000000.foil.cp(1:100,(find(data.NACA21015.Re1000000.foil.alpha == a2))),'-',...
    data.NACA21015.Re1000000.foil.xcp(1:100,(find(data.NACA21015.Re1000000.foil.alpha == a3))),data.NACA21015.Re1000000.foil.cp(1:100,(find(data.NACA21015.Re1000000.foil.alpha == a3))),'-',...
    data.NACA21015.Re1000000.foil.xcp(1:100,(find(data.NACA21015.Re1000000.foil.alpha == a4))),data.NACA21015.Re1000000.foil.cp(1:100,(find(data.NACA21015.Re1000000.foil.alpha == a4))),'-',...
    data.NACA21015.Re1000000.foil.xcp(1:100,(find(data.NACA21015.Re1000000.foil.alpha == a5))),data.NACA21015.Re1000000.foil.cp(1:100,(find(data.NACA21015.Re1000000.foil.alpha == a5))),'-','LineWidth', w);
xlabel('x/c');
ylabel('Cp');
yyaxis right
plot(data.NACA21015.Re1000000.foil.x(1:100,1),data.NACA21015.Re1000000.foil.y(1:100,1),'--b','Linewidth', 1.5)
ylim([-1 1]);
ylabel('z/c');
grid on
legend('alpha = 0deg','alpha = 5deg', 'alpha = 10deg', 'alpha = 15deg', 'alpha = 20deg','Airfoil','Location','northeast');
hold off
title('Re = 1,000,000');
set(gcf, 'Position', [70, 80, 1000, 650])


%% Plot CP vs Alpha with Airfoil shape

w = 1.1;
i1 = find(data.NACA21015.Re100000.foil.alpha == -5);
i2 = find(data.NACA21015.Re100000.foil.alpha == 0);
i3 = find(data.NACA21015.Re100000.foil.alpha == 5);
i4 = find(data.NACA21015.Re100000.foil.alpha == 10);
i5 = find(data.NACA21015.Re100000.foil.alpha == 15);
i6 = find(data.NACA21015.Re100000.foil.alpha == 20);
cla reset

subplot(2,2,1);
hold on
set(gca,'Ydir','reverse')
plot(data.NACA21015.Re460000.foil.xcp(1:100,i3),data.NACA21015.Re460000.foil.cp(1:100,i3),'-',...
    data.NACA21015.Re640000.foil.xcp(1:100,i3),data.NACA21015.Re640000.foil.cp(1:100,i3),'-',...
    data.NACA21015.Re820000.foil.xcp(1:100,i3),data.NACA21015.Re820000.foil.cp(1:100,i3),'-',...
    data.NACA21015.Re1000000.foil.xcp(1:100,i3),data.NACA21015.Re1000000.foil.cp(1:100,i3),'-','LineWidth', w);
xlabel('x/c');
ylabel('Cp');
yyaxis right
plot(data.NACA21015.Re460000.foil.x(1:100,1),data.NACA21015.Re460000.foil.y(1:100,1),'--b','Linewidth', 1.5)
ylim([-1 1]);
ylabel('z/c');
grid on
hold off
title('Angle of Attack = 5 deg');

subplot(2,2,2);
hold on
set(gca,'Ydir','reverse')
plot(data.NACA21015.Re460000.foil.xcp(1:100,i4),data.NACA21015.Re460000.foil.cp(1:100,i4),'-',...
    data.NACA21015.Re640000.foil.xcp(1:100,i4),data.NACA21015.Re640000.foil.cp(1:100,i4),'-',...
    data.NACA21015.Re820000.foil.xcp(1:100,i4),data.NACA21015.Re820000.foil.cp(1:100,i4),'-',...
    data.NACA21015.Re1000000.foil.xcp(1:100,i4),data.NACA21015.Re1000000.foil.cp(1:100,i4),'-','LineWidth', w);
xlabel('x/c');
ylabel('Cp');
yyaxis right
plot(data.NACA21015.Re640000.foil.x(1:100,1),data.NACA21015.Re640000.foil.y(1:100,1),'--b','Linewidth', 1.5)
ylim([-1 1]);
ylabel('z/c');
grid on
hold off
title('Angle of Attack = 10 deg');

subplot(2,2,3);
hold on
set(gca,'Ydir','reverse')
plot(data.NACA21015.Re460000.foil.xcp(1:100,i5),data.NACA21015.Re460000.foil.cp(1:100,i5),'-',...
    data.NACA21015.Re640000.foil.xcp(1:100,i5),data.NACA21015.Re640000.foil.cp(1:100,i5),'-',...
    data.NACA21015.Re820000.foil.xcp(1:100,i5),data.NACA21015.Re820000.foil.cp(1:100,i5),'-',...
    data.NACA21015.Re1000000.foil.xcp(1:100,i5),data.NACA21015.Re1000000.foil.cp(1:100,i5),'-','LineWidth', w);
xlabel('x/c');
ylabel('Cp');
yyaxis right
plot(data.NACA21015.Re820000.foil.x(1:100,1),data.NACA21015.Re820000.foil.y(1:100,1),'--b','Linewidth', 1.5)
ylim([-1 1]);
ylabel('z/c');
grid on
hold off
title('Angle of Attack = 15 deg');

subplot(2,2,4);
hold on
set(gca,'Ydir','reverse')
plot(data.NACA21015.Re460000.foil.xcp(1:100,i6),data.NACA21015.Re460000.foil.cp(1:100,i6),'-',...
    data.NACA21015.Re640000.foil.xcp(1:100,i6),data.NACA21015.Re640000.foil.cp(1:100,i6),'-',...
    data.NACA21015.Re820000.foil.xcp(1:100,i6),data.NACA21015.Re820000.foil.cp(1:100,i6),'-',...
    data.NACA21015.Re1000000.foil.xcp(1:100,i6),data.NACA21015.Re1000000.foil.cp(1:100,i6),'-','LineWidth', w);
xlabel('x/c');
ylabel('Cp');
yyaxis right
plot(data.NACA21015.Re1000000.foil.x(1:100,1),data.NACA21015.Re1000000.foil.y(1:100,1),'--b','Linewidth', 1.5)
ylim([-1 1]);
ylabel('z/c');
grid on
legend('Re = 460,000', 'Re = 640,000', 'Re = 820,000', 'Re = 1,000,000','Airfoil','Location','northeast');
title('Angle of Attack = 20 deg');
hold off
set(gcf, 'Position', [70, 80, 1000, 650])

%% Plot CP vs Alpha with Airfoil shape

w = 1.1;
% find CL peaks
[peak_CL_100000, I_100000]  = max(data.NACA21015.Re100000.pol.CL);
[peak_CL_280000, I_280000] = max(data.NACA21015.Re280000.pol.CL);
[peak_CL_460000, I_460000] = max(data.NACA21015.Re460000.pol.CL);
[peak_CL_640000, I_640000] = max(data.NACA21015.Re640000.pol.CL);
[peak_CL_820000, I_820000] = max(data.NACA21015.Re820000.pol.CL);
[peak_CL_1000000, I_1000000] = max(data.NACA21015.Re1000000.pol.CL);
%find alpha @ peak CL
alpha_peak_CL_100000 = data.NACA21015.Re100000.pol.alpha(I_100000);
alpha_peak_CL_280000 = data.NACA21015.Re280000.pol.alpha(I_280000);
alpha_peak_CL_460000 = data.NACA21015.Re460000.pol.alpha(I_460000);
alpha_peak_CL_640000 = data.NACA21015.Re640000.pol.alpha(I_640000);
alpha_peak_CL_820000 = data.NACA21015.Re820000.pol.alpha(I_820000);
alpha_peak_CL_1000000 = data.NACA21015.Re1000000.pol.alpha(I_1000000);

i1 = find(data.NACA21015.Re100000.foil.alpha == 10);
i2 = find(data.NACA21015.Re280000.foil.alpha == alpha_peak_CL_280000);
i3 = find(data.NACA21015.Re460000.foil.alpha == alpha_peak_CL_460000);
i4 = find(data.NACA21015.Re640000.foil.alpha == alpha_peak_CL_640000);
i5 = find(data.NACA21015.Re820000.foil.alpha == alpha_peak_CL_820000);
i6 = find(data.NACA21015.Re1000000.foil.alpha == alpha_peak_CL_1000000);

cla reset


subplot(2,2,2);
hold on
set(gca,'Ydir','reverse')
plot(data.NACA21015.Re100000.foil.xcp(1:100,i1),data.NACA21015.Re100000.foil.cp(1:100,i1),'-',...
    data.NACA21015.Re280000.foil.xcp(1:100,i2),data.NACA21015.Re280000.foil.cp(1:100,i2),'-',...
    data.NACA21015.Re460000.foil.xcp(1:100,i3),data.NACA21015.Re460000.foil.cp(1:100,i3),'-',...
    data.NACA21015.Re640000.foil.xcp(1:100,i4),data.NACA21015.Re640000.foil.cp(1:100,i4),'-',...
    data.NACA21015.Re820000.foil.xcp(1:100,i5),data.NACA21015.Re820000.foil.cp(1:100,i5),'-',...
    data.NACA21015.Re1000000.foil.xcp(1:100,i6),data.NACA21015.Re1000000.foil.cp(1:100,i6),'-','LineWidth', w);
xlabel('x/c');
ylabel('Cp');
yyaxis right
plot(data.NACA21015.Re820000.foil.x(1:100,i2),data.NACA21015.Re820000.foil.y(1:100,i2),'--b','Linewidth', 1.5)
ylim([-1 1]);
ylabel('z/c');
legend('Re = 100,000, alpha = 10.4deg','Re = 280,000, alpha = 13.2deg', 'Re = 460,000, alpha = 15.2deg', 'Re = 640,000, alpha = 16.4deg', 'Re = 820,000, alpha = 17.2deg','Re = 1,000,000, alpha = 17.4deg','Airfoil','Location','northeast');
grid on
hold off
title('Pressure Coefficient Peak lift');

subplot(2,2,1);
hold on
set(gca,'Ydir','reverse')
a1 = 0;
a2 = 5;
a3 = 10;
a4 = 15;
a5 = 20;
plot(data.NACA21015.Re1000000.foil.xcp(1:100,(find(data.NACA21015.Re1000000.foil.alpha == a1))),data.NACA21015.Re1000000.foil.cp(1:100,(find(data.NACA21015.Re1000000.foil.alpha == a1))),'-',...
    data.NACA21015.Re1000000.foil.xcp(1:100,(find(data.NACA21015.Re1000000.foil.alpha == a2))),data.NACA21015.Re1000000.foil.cp(1:100,(find(data.NACA21015.Re1000000.foil.alpha == a2))),'-',...
    data.NACA21015.Re1000000.foil.xcp(1:100,(find(data.NACA21015.Re1000000.foil.alpha == a3))),data.NACA21015.Re1000000.foil.cp(1:100,(find(data.NACA21015.Re1000000.foil.alpha == a3))),'-',...
    data.NACA21015.Re1000000.foil.xcp(1:100,(find(data.NACA21015.Re1000000.foil.alpha == a4))),data.NACA21015.Re1000000.foil.cp(1:100,(find(data.NACA21015.Re1000000.foil.alpha == a4))),'-',...
    data.NACA21015.Re1000000.foil.xcp(1:100,(find(data.NACA21015.Re1000000.foil.alpha == a5))),data.NACA21015.Re1000000.foil.cp(1:100,(find(data.NACA21015.Re1000000.foil.alpha == a5))),'-','LineWidth', w);
xlabel('x/c');
ylabel('Cp');
yyaxis right
plot(data.NACA21015.Re1000000.foil.x(1:100,1),data.NACA21015.Re1000000.foil.y(1:100,1),'--b','Linewidth', 1.5)
ylim([-1 1]);
ylabel('z/c');
grid on
legend('alpha = 0deg','alpha = 5deg', 'alpha = 10deg', 'alpha = 15deg', 'alpha = 20deg','Airfoil','Location','northeast');
hold off
title('Pressure coefficient Re = 1,000,000');

% Contour Plot

subplot(2,2,3);
x = linspace(0,1,50);
y = linspace(-4.6,15.2,97);
[X,Y] = meshgrid(x,y);
Z = data.NACA21015.Re280000.foil.cp(1:50,1:97);
Z = Z';
Z = flip(Z,2);
contourf(X,Y,Z,'ShowText','on');
xlabel('x/c');
ylabel('Angle of Attack');
zlabel('Cp');
title('Suction pressure coefficient Re = 280,000');

subplot(2,2,4);
x = linspace(0,1,50);
y = linspace(-5,19.8,122);
[X,Y] = meshgrid(x,y);
Z = data.NACA21015.Re820000.foil.cp(1:50,1:122);
Z = Z';
Z = flip(Z,2);
contourf(X,Y,Z,'ShowText','on');
xlabel('x/c');
ylabel('Angle of Attack');
zlabel('Cp');
title('Suction pressure coefficient Re = 820,000');
set(gcf, 'Position', [70, 80, 1000, 650])



%% Boundary Layer Analysis 

%Dstar

subplot(2,2,3);
i1 = find(data.NACA21015.Re100000.foil.alpha == 8);
i2 = find(data.NACA21015.Re280000.foil.alpha == 8);
i3 = find(data.NACA21015.Re460000.foil.alpha == 8);
i4 = find(data.NACA21015.Re640000.foil.alpha == 8);
i5 = find(data.NACA21015.Re820000.foil.alpha == 8);
i6 = find(data.NACA21015.Re1000000.foil.alpha == 8);

plot(data.NACA21015.Re100000.foil.xcp(1:100,i1),data.NACA21015.Re100000.foil.Dstar(1:100,i1),'-',...
    data.NACA21015.Re280000.foil.xcp(1:100,i2),data.NACA21015.Re280000.foil.Dstar(1:100,i2),'-',...
    data.NACA21015.Re460000.foil.xcp(1:100,i3),data.NACA21015.Re460000.foil.Dstar(1:100,i3),'-',...
    data.NACA21015.Re640000.foil.xcp(1:100,i4),data.NACA21015.Re640000.foil.Dstar(1:100,i4),'-',...
    data.NACA21015.Re820000.foil.xcp(1:100,i5),data.NACA21015.Re820000.foil.Dstar(1:100,i5),'-',...
    data.NACA21015.Re1000000.foil.xcp(1:100,i6),data.NACA21015.Re1000000.foil.Dstar(1:100,i6),'-','LineWidth', w);


xlabel('x/c');
ylabel('Dstar [m]');
yyaxis right
plot(data.NACA21015.Re820000.foil.x(1:100,i2),data.NACA21015.Re820000.foil.y(1:100,i2),'--b','Linewidth', 1.5)
ylim([-1 1]);
ylabel('z/c');
grid on
hold off
title('Displacement thickness at alpha = 8deg');


% Theta

subplot(2,2,2)
i1 = find(data.NACA21015.Re100000.foil.alpha == 8);
i2 = find(data.NACA21015.Re280000.foil.alpha == 8);
i3 = find(data.NACA21015.Re460000.foil.alpha == 8);
i4 = find(data.NACA21015.Re640000.foil.alpha == 8);
i5 = find(data.NACA21015.Re820000.foil.alpha == 8);
i6 = find(data.NACA21015.Re1000000.foil.alpha == 8);

plot(data.NACA21015.Re100000.foil.xcp(1:100,i1),data.NACA21015.Re100000.foil.Theta(1:100,i1),'-',...
    data.NACA21015.Re280000.foil.xcp(1:100,i2),data.NACA21015.Re280000.foil.Theta(1:100,i2),'-',...
    data.NACA21015.Re460000.foil.xcp(1:100,i3),data.NACA21015.Re460000.foil.Theta(1:100,i3),'-',...
    data.NACA21015.Re640000.foil.xcp(1:100,i4),data.NACA21015.Re640000.foil.Theta(1:100,i4),'-',...
    data.NACA21015.Re820000.foil.xcp(1:100,i5),data.NACA21015.Re820000.foil.Theta(1:100,i5),'-',...
    data.NACA21015.Re1000000.foil.xcp(1:100,i6),data.NACA21015.Re1000000.foil.Theta(1:100,i6),'-','LineWidth', w);

xlabel('x/c');
ylabel('Theta [m]');
yyaxis right
plot(data.NACA21015.Re820000.foil.x(1:100,i2),data.NACA21015.Re820000.foil.y(1:100,i2),'--b','Linewidth', 1.5)
ylim([-1 1]);
ylabel('z/c');
grid on
hold off
title('Momentum thickness at alpha = 8deg');

% H

subplot(2,2,4)
i1 = find(data.NACA21015.Re100000.foil.alpha == 8);
i2 = find(data.NACA21015.Re280000.foil.alpha == 8);
i3 = find(data.NACA21015.Re460000.foil.alpha == 8);
i4 = find(data.NACA21015.Re640000.foil.alpha == 8);
i5 = find(data.NACA21015.Re820000.foil.alpha == 8);
i6 = find(data.NACA21015.Re1000000.foil.alpha == 8);

plot(data.NACA21015.Re100000.foil.xcp(1:100,i1),data.NACA21015.Re100000.foil.H(1:100,i1),'-',...
    data.NACA21015.Re280000.foil.xcp(1:100,i2),data.NACA21015.Re280000.foil.H(1:100,i2),'-',...
    data.NACA21015.Re460000.foil.xcp(1:100,i3),data.NACA21015.Re460000.foil.H(1:100,i3),'-',...
    data.NACA21015.Re640000.foil.xcp(1:100,i4),data.NACA21015.Re640000.foil.H(1:100,i4),'-',...
    data.NACA21015.Re820000.foil.xcp(1:100,i5),data.NACA21015.Re820000.foil.H(1:100,i5),'-',...
    data.NACA21015.Re1000000.foil.xcp(1:100,i6),data.NACA21015.Re1000000.foil.H(1:100,i6),'-','LineWidth', w);
xlabel('x/c');
ylabel('H');
yyaxis right
plot(data.NACA21015.Re820000.foil.x(1:100,i2),data.NACA21015.Re820000.foil.y(1:100,i2),'--b','Linewidth', 1.5)
ylim([-1 1]);
ylabel('z/c');
legend('Re100000','Re280000','Re460000','Re640000','Re820000','Re1000000','Location','northeast' );
grid on
hold off
title('Shape factor at alpha = 8deg');

% CF

subplot(2,2,1)
i1 = find(data.NACA21015.Re100000.foil.alpha == 8);
i2 = find(data.NACA21015.Re280000.foil.alpha == 8);
i3 = find(data.NACA21015.Re460000.foil.alpha == 8);
i4 = find(data.NACA21015.Re640000.foil.alpha == 8);
i5 = find(data.NACA21015.Re820000.foil.alpha == 8);
i6 = find(data.NACA21015.Re1000000.foil.alpha == 8);

plot(data.NACA21015.Re100000.foil.xcp(1:100,i1),data.NACA21015.Re100000.foil.Cf(1:100,i1),'-',...
    data.NACA21015.Re280000.foil.xcp(1:100,i2),data.NACA21015.Re280000.foil.Cf(1:100,i2),'-',...
    data.NACA21015.Re460000.foil.xcp(1:100,i3),data.NACA21015.Re460000.foil.Cf(1:100,i3),'-',...
    data.NACA21015.Re640000.foil.xcp(1:100,i4),data.NACA21015.Re640000.foil.Cf(1:100,i4),'-',...
    data.NACA21015.Re820000.foil.xcp(1:100,i5),data.NACA21015.Re820000.foil.Cf(1:100,i5),'-',...
    data.NACA21015.Re1000000.foil.xcp(1:100,i6),data.NACA21015.Re1000000.foil.Cf(1:100,i6),'-','LineWidth', w);
xlabel('x/c');
ylabel('Cf');
yyaxis right
plot(data.NACA21015.Re820000.foil.x(1:100,i2),data.NACA21015.Re820000.foil.y(1:100,i2),'--b','Linewidth', 1.5)
ylim([-1 1]);
ylabel('z/c');
grid on
hold off
title('Skin friction coefficient at alpha = 8deg');



%% Contour Plot Theta

x = linspace(0,1,50);
y = linspace(-5,19.8,122);
[X,Y] = meshgrid(x,y);
Z = data.NACA21015.Re820000.foil.Dstar(1:50,1:122);
Z = Z';
Z = flip(Z,2);
contourf(X,Y,Z,'ShowText','on');
xlabel('x/c');
ylabel('Angle of Attack');
zlabel('Cp');
title('Suction pressure coefficient Re = 820,000');











