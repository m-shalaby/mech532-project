function [xcg, zcg, J] = getInertiaParams(M)
% Input
%  M: Matrix consists of m x 4 matrix
%   First column is mass of each component
%   Second column is the x-coordinate (measured from nose of aricraft) of component.
%   Fourth column is the y-coordinate (measured from center of aircraft) 
%   Fourth column is the z-coordinate (measured from center of aircraft) of
%   the component
% Output
%   xcg: x-position of center of gravity measured from nose of aircraft
%   zcg: z-position of center of gravity measured from center of aircraft
%   (longitudinal axis)
%   J: Inertia matrix

mass_vec = M(:,1);
x_vec = M(:,2);
y_vec = M(:,3);
z_vec = M(:,4);

mass_total = sum(mass_vec);

x_ws = 0; % weighted sum (x(i)*m(i))
z_ws = 0;

Ixx = 0;
Ixy = 0;
Ixz = 0;
Iyy = 0;
% Iyx = 0;      % symm
Iyz = 0;
Izz = 0;
% Izx = 0;      % symm
% Izy = 0;      % symm
    
for i = 1:length(mass_vec)
    x_ws = x_ws + x_vec(i)*mass_vec(i);
    z_ws = z_ws + z_vec(i)*mass_vec(i);
end
xcg = x_ws/mass_total;
zcg = z_ws/mass_total;
ycg = 0; % by assuming the aircraft is symmetrical along xz plane

x_vec_cg = x_vec-xcg;
y_vec_cg = y_vec-ycg;
z_vec_cg = z_vec-zcg;
for i = 1:length(mass_vec)
    Ixx = Ixx + (y_vec_cg(i)^2+z_vec_cg(i)^2)*mass_vec(i);
    Ixy = Ixy + (x_vec_cg(i)*y_vec_cg(i))*mass_vec(i);
    Ixz = Ixz + (x_vec_cg(i)*z_vec_cg(i))*mass_vec(i);
    Iyy = Iyy + (x_vec_cg(i)^2+z_vec_cg(i)^2)*mass_vec(i);
%     Iyx = Iyx + (y_vec_cg(i)*x_vec_cg(i))*mass_vec(i);
    Iyz = Iyz + (y_vec_cg(i)*z_vec_cg(i))*mass_vec(i);
    Izz = Izz + (x_vec_cg(i)^2+y_vec_cg(i)^2)*mass_vec(i);
%     Izx = Izx + (z_vec_cg(i)*x_vec_cg(i))*mass_vec(i);
%     Izy = Izy + (z_vec_cg(i)*y_vec_cg(i))*mass_vec(i); 
end

Iyx = Ixy;
Izx = Ixz;
Izy = Iyz;

J = [ Ixx, -Ixy, -Ixz;
      -Iyx, Iyy, -Iyz;
      -Izx, -Izy, Izz];
  
