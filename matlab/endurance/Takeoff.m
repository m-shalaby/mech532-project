function [outTakeoff] = Takeoff(plane,climbV)
%This function simulates the takeoff of the airplane.

%initialization
dt = 0.01;
Simtime = 0:dt:20;
dx = zeros(1,length(Simtime));
Ax = zeros(1,length(Simtime));
v = zeros(1,length(Simtime));
power = zeros(1,length(Simtime));
Q = zeros(1,length(Simtime));
SOC = zeros(1,length(Simtime));

Q(1) = plane.batt.totalQ;
v(1) = 0.1;
SOC(1) = 100;

%forward euler
for n = 1:length(Simtime)
    if v(n) >= climbV
    takeoff.v = v(1:n);
    takeoff.SOC = SOC(1:n);
    takeoff.Ax = Ax(1:n);
    takeoff.power = power(1:n);
    takeoff.Q = Q(1:n);
    takeoff.SOC = SOC(1:n);
    takeoff.dx = dx(1:n);
    takeoff.distance = sum(dx(1:n));
    takeoff.time = dt*n;
    takeoff.deltaQ = Q(1)-(Q(n));
    break
    else
    %thrust
    CT = calcCT(plane,v(n));
    thrust = calcPropellerThrust(plane,CT);
    %drag
    drag = 0.5*plane.test.rho*plane.S*calcCd(plane,0)*(v(n)^2);
    %friction
    friction = plane.test.mu*((plane.m*9.81)-(0.5*plane.test.rho*plane.S*calcCL(plane,0)*(v(n)^2)));
    %forward euler
    Ax(n) = (thrust-drag-friction)/plane.m;
    v(n+1) = v(n) + (Ax(n)*dt);
    dx(n) = v(n)*dt;
    power(n) = plane.m*Ax(n)*v(n)/plane.motor.eff;
    Q(n+1) = (Q(n) - (power(n)*dx(n)/plane.batt.Vnom));
    SOC(n+1) = (Q(n+1)*100)/plane.batt.totalQ;
    end
end

outTakeoff = takeoff;

end

