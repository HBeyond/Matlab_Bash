function gpsData = fun_gpsLoadFilter(filePath)
% load whole gps data and kick some out besides longitude, latitude

%% gpsOriginal includes: timestamps, longitude, latitude, altitude, number
% of satellites and course
gpsOriginal = importdata(filePath);

%% filter
% check data source
if size(gpsOriginal,1) == 1
    gpsData = [gpsOriginal.data(:,1), gpsOriginal.data(:,2), gpsOriginal.data(:,3)];
elseif size(gpsOriginal, 2) == 2
    gpsData = [gpsOriginal(:,1), gpsOriginal(:,2)];
else
    gpsData = [gpsOriginal(:,5), gpsOriginal(:,6)];
end