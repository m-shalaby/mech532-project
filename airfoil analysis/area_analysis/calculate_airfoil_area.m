%% load airfoils
clc;clear;
airfoils = load('airfoils');


%% calculate area (using trapezoidal rule and 1-D interpolation)

airfoil_names = cell2mat(fieldnames(airfoils));

number_of_airfoils = size(airfoil_names);
number_of_airfoils = number_of_airfoils(1);

for i=1:1:number_of_airfoils
    airfoil_iter = airfoil_names(i,:);
    
    % Trapezoidal Rule
    area_iter = 0;
    for j=length(airfoils.(airfoil_iter).xU):-1:2
                
        x_0 = airfoils.(airfoil_iter).xU(j-1);
        x_1 = airfoils.(airfoil_iter).xU(j);
        
        z_upper_0 = airfoils.(airfoil_iter).zU(j-1);
        z_upper_1 = airfoils.(airfoil_iter).zU(j);
        
        z_lower_0 = interp1(airfoils.(airfoil_iter).xL, airfoils.(airfoil_iter).zL, x_0); % interpolate to find corresponding lower part
        z_lower_1 = interp1(airfoils.(airfoil_iter).xL, airfoils.(airfoil_iter).zL, x_1); % interpolate to find corresponding lower part
        
        z_0 = z_upper_0 - z_lower_0;
        z_1 = z_upper_1 - z_lower_1;
        
        area_iter = area_iter + (z_0+z_1)/2*(x_0-x_1);
        
    end
        
    assignin('base',airfoil_iter,area_iter);
    try
        save('airfoil_areas', airfoil_iter, '-append')
    catch
        save('airfoil_areas', airfoil_iter)   
    end

end
clc;clear;
    