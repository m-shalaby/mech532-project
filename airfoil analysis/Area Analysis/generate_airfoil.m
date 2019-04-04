clear; clc

%% Set up airfoils.

airfoil = 'NACA2512';

iaf.designation=airfoil(5:8);
iaf.n=250;
iaf.HalfCosineSpacing=0;
iaf.wantFile=0;
% iaf.datFilePath='./'; % Current folder
iaf.is_finiteTE=0;

af = naca4gen(iaf);
assignin('base',airfoil,af)

try
    save('airfoils', airfoil, '-append')
catch
    save('airfoils', airfoil)
end

clear