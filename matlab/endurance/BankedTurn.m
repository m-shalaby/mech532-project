function [outBakedTurn] = BankedTurn(plane,R,v)
%BankedTurn calculates the total flight time and energy for performing
%banked turn.


banking_angle = atand((v^2)/(9.81*R));
banked_turn.CL = (plane.m*9.81)/(0.5*plane.test.rho*plane.S*(cosd(banking_angle))*v^2);
w = v/R;

%time
banked_turn.time = pi/w;

%energy
banked_turn.CD = calcCd(plane,calcAlpha(plane,banked_turn.CL));

banked_turn.alpha = calcAlpha(plane,banked_turn.CL);
banked_turn.CT = calcClimbCT(plane, [20,0,banked_turn.alpha]);


banked_turn.thrust = calcPropellerThrust(plane,banked_turn.CT);
banked_turn.eta = calcEta(plane,banked_turn.CT);

banked_turn.power = banked_turn.thrust*v/(banked_turn.eta*plane.motor.eff);
banked_turn.deltaQ = banked_turn.power*banked_turn.time/plane.batt.Vnom;
banked_turn.distance = v*banked_turn.time;

%output

outBakedTurn = banked_turn;

end

