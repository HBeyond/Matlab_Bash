% function test
%% for measurement gps
clear
% load the gps data only including longitude and latitude
gpsMeasurementFilePath = '/Users/user/Desktop/mac-ubuntu-share/2018-09-19_T_09-29-47.303_GMT/2018-09-19_T_09-29-47.303_GMT.gps';
% get the original gps data
gpsMeasurementData = fun_gpsLoadFilter(gpsMeasurementFilePath);
% transform frames
% pre-process for gpsMeasurement data, turn the unit to deg
% deg
gpsMeasurementData(:,1) = gpsMeasurementData(:,1) * 90 / power(1024, 3);
gpsMeasurementData(:,2) = gpsMeasurementData(:,2) * 90 / power(1024, 3);
% get anchor for frame transform
% gpsMeasurement = [longitude, latitude]
lambda0 = gpsMeasurementData(1,1); % anchor for longitude
phi0 = gpsMeasurementData(1,2); % anchor for latitude
h0 = gpsMeasurementData(1,3); % anchor for altitude
% transform
gpsMeasurementENU = fun_gpsPosToENU(gpsMeasurementData, lambda0, phi0, h0);
% get the distance between two points
disMeasurementENUPairs = fun_getDistance(gpsMeasurementENU);
% get the angle between two points
angleMeasurementENUPairs = fun_getAngle(gpsMeasurementENU);

%% for opt result
gpsOptFilePath = '/Users/user/Desktop/mac-ubuntu-share/2018-09-19_T_09-29-47.303_GMT/result_imu_gps_opt.txt';
% get the opt result gps data
gpsOptENU = fun_gpsLoadFilter(gpsOptFilePath);
% get the distance between two points
disOpt = fun_getDistance(gpsOptENU);
% get the angle between two points
angleOpt = fun_getAngle(gpsOptENU);

%% for osm gps -- only longtitude and latitude
gpsOsmFilePath = '/Users/user/Desktop/mac-ubuntu-share/2018-09-19_T_09-29-47.303_GMT/OSMPointsLonLan-2018-09-19_T_09-29-47.303_GMT for Matlab.txt';
% get the osm gps data
gpsOsmData = fun_gpsLoadFilter(gpsOsmFilePath);
% transform
gpsOsmENU = fun_gpsPosToENU(gpsOsmData, lambda0, phi0, h0);
% get the distance between two points
disOsmENUPairs = fun_getDistance(gpsOsmENU);
% get the angle between two points
angleOsmENUPairs = fun_getAngle(gpsOsmENU);

%% analyse
% error between 

%% show
%%original
figure(1)
plot(gpsMeasurementData(:,1), gpsMeasurementData(:,2), 'bo');
% figure(2)
hold on
plot(gpsOsmData(:,1), gpsOsmData(:,2), 'ro');
legend('measurement', 'osm');
title('trajectory in longitude-latitude frame');
xlabel('longitude/deg');
ylabel('latitude/deg');
%%ENU 
figure(3)
plot(gpsMeasurementENU(:,1), gpsMeasurementENU(:,2), 'bo');
%figure(4)
hold on
plot(gpsOsmENU(:,1), gpsOsmENU(:,2), 'ro-');
hold on
plot(gpsOptENU(:,1), gpsOptENU(:,2), 'co-')
hold on
plot(lambda0, phi0, 'go');
legend('measurement', 'osm', 'opt');
title('trajectory in ENU frame');
xlabel('E/m');
ylabel('N/m');