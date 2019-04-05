function [outAlpha] = calcAlphaGliding(plane)
%This function calculates the optimal angle of attack for gliding.

%calculate CD/CL^1.5
glide_metric_initial = plane.CD(:,2)./(abs(plane.CL(:,2)).^1.5);
m = 1;
for n = 1:length(glide_metric_initial)
    if plane.CL(n) < 0
        continue
    else
        glide_metric(m,1) = plane.CL(n,1);
        glide_metric(m,2) = glide_metric_initial(n);
        m = m+1;
    end
end

%fit data
p = polyfit(glide_metric(:,1),glide_metric(:,2),8);
x1 = linspace(glide_metric(1,1), glide_metric(m-1,1),150);
y1 = polyval(p,x1);

%plot fit
% figure
% plot(glide_metric(:,1),glide_metric(:,2),'o')
% hold on
% plot(x1,y1)

%find alpha to minimize metric
outAlpha = interp1(y1,x1,min(y1));
end

