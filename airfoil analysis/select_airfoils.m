function [outList, outAFMetrics] = select_airfoils(data, minCL, maxCL, k)
%This function returns 

list_airfoils = fieldnames(data);
afmetrics = zeros(length(list_airfoils),2);
selected_airfoils = zeros(10,2);

for m = 1:length(list_airfoils)
    %set airfoil geometry
    afoil_geo = char(list_airfoils(m));
    %find angles of attack where lift condition is satisfied
    indicesCL = find((data.(afoil_geo).Re250000.pol.CL > minCL) & (data.(afoil_geo).Re250000.pol.CL < maxCL));
    %calculate mean efficiency over that range of angle of attacks
    meanEff = mean(data.(afoil_geo).Re250000.pol.CL(indicesCL)./data.(afoil_geo).Re250000.pol.CD(indicesCL));
    %calculate mean steady flight efficiency metric
    meanSFEff = mean(data.(afoil_geo).Re250000.pol.CD(indicesCL)./(data.(afoil_geo).Re250000.pol.CL(indicesCL).^(1.5)));

    if meanSFEff < 0.01
        meanSFEff = 10;
        
    end
    %store metrics
    afmetrics(m,1) = meanEff;
    afmetrics(m,2) = meanSFEff;
end


% [~,I] = maxk(afmetrics(:,1),10);
% selected_airfoils_Eff = char(list_airfoils(I,1));


[~,I] = mink(afmetrics(:,2),k);
selected_airfoils = (list_airfoils(I,1));

outAFMetrics = afmetrics;
outList = selected_airfoils;
end

