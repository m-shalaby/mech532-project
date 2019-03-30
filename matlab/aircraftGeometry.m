clear all;
close all;

fuse_cd = 0.004;

fuse_length = 200; % cm
wing_xPosition = 60;
wing_span = 200;
wing_chord = 18;
boxLength = 5; % cm
t2cRatio = (boxLength/2+0.1)/fuse_length;
n = 20;     % number of points to obtain from arifoil

[xu_norm,zu_norm,xl_norm,zl_norm]= GenerateNACASeries4Airfoil('0004',n);
xu = xu_norm*fuse_length;
xl = xl_norm*fuse_length;
zu = zu_norm*fuse_length;
zl = zl_norm*fuse_length;

[yu_max, yu_max_index] = max(zu);
box_xPosition = xu(yu_max_index);
%% Plots
close all;
% Cl vs alpha
font_size = 15;
line_size = 15;
line_width = 1.7;
position = [250 75 900 600];

% solution plots
f1 = figure('Name','Plot','pos',position);
hold on;
grid on;
plot(xu,zu, 'b-','linewidth',line_width);
plot(xl,zl, 'b-','linewidth',line_width);
rectangle('position',[box_xPosition-boxLength/2, -boxLength/2, boxLength, boxLength], 'linewidth',line_width);
rectangle('position',[wing_xPosition, -wing_span/2, wing_chord, wing_span], 'linewidth',line_width);
axis([0, fuse_length, -fuse_length/2, fuse_length/2]);
% legItem{1} = 'Datcom data';
% legItem{2} = 'Stall point';
% legItem{1} = '$i=1$';
% leg = legend(legItem);
% leg.Interpreter = 'latex';
% leg.FontSize = 14;

xlabel('$x$','Interpreter','latex','fontsize',font_size);
ylabel('$z$','Interpreter','latex','fontsize',font_size);