function [xcg, zcg] = getCG(M)
% Input
%  M: Matrix consists of m x 3 matrix
%   First column is mass of each component
%   Second column is the x-coordinate (measured from nose of aricraft) of component.
%   Third column is the z-coordinate (measured from center of aircraft) of
%   the component
% Output
%   xcg: x-position of center of gravity measured from nose of aircraft
%   zcg: z-position of center of gravity measured from center of aircraft
%   (longitudinal axis)

mass_vec = M(:,1);
x_vec = M(:,2);
z_vec = M(:,3);

mass_total = sum(mass_vec);

x_ws = 0; % weighted sum (x(i)*m(i))
z_ws = 0;

for i = 1:length(mass_vec)
    x_ws = x_ws + x_vec(i)*mass_vec(i);
    z_ws = z_ws + z_vec(i)*mass_vec(i);
end

xcg = x_ws/mass_total;
zcg = z_ws/mass_total;
