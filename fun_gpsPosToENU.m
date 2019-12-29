function gpsPosENU = fun_gpsPosToENU(gpsPos, lambda0, phi0, h0)
% transform gpsPos(WGS-84) to local ENU without timestamps, altitude and
% course,  because the original gps data from osm does not include the
% altitude.

% gpsPos = [longitude, latitude] in deg
% gpsPosENU = [E, N] in m
% gpsPosENU = [E, N, U] in m

% fix the anchor.   anchor should be put out here, cuz osm needs it.
% lambda0 = gpsPos(1,1); for longitude 
% phi0 = gpsPos(1,2); for latitude

% declare the config parameter and the operations
M_PI = 3.14159265358979323846;

phi0_deg = phi0*M_PI/180;

sin_phi0 = sin(phi0_deg);
cos_phi0 = cos(phi0_deg);

p = gpsPos;
p0 = [lambda0, phi0, h0];

a = 6378137.0;  %meter
f = 1/298.257223563;
e = sqrt(f*(2-f));

Rm = a*(1-e*e)/(power((1-e*e*sin_phi0*sin_phi0),1.5));
Rn = a/(sqrt(1-e*e*sin_phi0*sin_phi0));
Rwg_1_1 = (Rn + h0) * cos_phi0;
Rwg_2_2 = Rm + h0;

%transfor
for i = 1 : size(gpsPos,1) 
    delta_p = [(p(i,1)-p0(1,1))*M_PI/180,(p(i,2)-p0(1,2))*M_PI/180,(p(i,3)-p0(1,3))];     
    E(i,1) = Rwg_1_1*delta_p(1);
    N(i,1) = Rwg_2_2*delta_p(2);
    U(i,1) = 1*delta_p(3);
end

if size(gpsPos,2) == 2
    gpsPosENU = [E, N];
elseif size(gpsPos,2) == 3
    gpsPosENU = [E, N, U];
end


