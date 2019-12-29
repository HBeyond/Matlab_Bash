function angle = fun_getAngle(gps)
% get the angle between two points 

for i = 1 : (size(gps(:,1), 1) - 1)
    % the output of atan2 is in unit rad, turning it into unit deg to
    % enlarge the difference
    angle(i,1) = atan2 ((gps(i,2) - gps(i+1, 2)), (gps(i,1) - gps(i+1, 1))) * 180 / pi;  
end