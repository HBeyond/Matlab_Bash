function dis = fun_getXYPlaneDistance(gps)
% get the distance between two points

for i = 1 : (size(gps(:,1), 1) - 1)
    dis(i,1) = sqrt(power((gps(i,1) - gps(i+1, 1)), 2) + power((gps(i,2) - gps(i+1, 2)), 2));
end