close all
clear
clc
 
path = '/Users/user/Desktop/mac-ubuntu-share/DriverLoggerData/Performance/batch/1_1_oneLongLost/disThreshold_uncover/';
dataFolder = '2017-08-16_T_08-39-44.128_GMT/0520/';
dataName = dataFolder(1:29);

% get anchor 
config = importdata([path dataFolder 'config.yaml']);
anchorChar = cell2mat(config(22));
borders = [0,0];
for i = 1:size(anchorChar,2)
    anchorChar(i);
    if anchorChar(i) == '['
        borders(1) = i+1;
    elseif anchorChar(i) == ']'
        borders(2) = i-1;
    end 
end
anchorLine = anchorChar(borders(1):borders(2));
anchor = str2num(anchorLine);

% get osm and ekfResultMovCheck Osm match
osmOri = importdata([path dataName '/osmData.txt']);
osmData = osmOri.data;
osmEkfRMCMatch = importdata([path dataFolder 'match.txt']);
% transfer osmData to ENU
for i = 1:size(osmData)
   osmENU(i,:) = fun_gpsPosToENU([osmData(i,1), osmData(i,2), 0], anchor(2), anchor(1), anchor(3)); 
end

% get gps and ekfResult gps match
gps = importdata([path dataFolder 'gps_local.txt']);
gpsEkfRMatch = importdata([path dataFolder 'gps_matched.txt']);

% get ekfResult
ekf = importdata([path dataFolder 'result_ekf.txt']);

% get opt result
result = importdata([path dataFolder 'result_imu_gps_osm_opt.txt']);

figure(1)
plot(osmENU(:,1), osmENU(:,2), 'ro-');
hold on
plot(osmEkfRMCMatch(:,5), osmEkfRMCMatch(:,6), 'r+');
hold on
plot(gps(:,2), gps(:,3), 'bs-');
hold on 
plot(gpsEkfRMatch(:,5), gpsEkfRMatch(:,6), 'bx');
hold on
plot(ekf(:,5), ekf(:,6), 'cd-');
hold on
plot(osmEkfRMCMatch(:,2), osmEkfRMCMatch(:,3), 'c+');
hold on
plot(gpsEkfRMatch(:,2), gpsEkfRMatch(:,3), 'cx');
hold on
plot(result(:,5), result(:,6), 'g*-');
hold on
% link osm and osmEkfRMCMatch
for i=1:size(osmEkfRMCMatch)
   plot([osmEkfRMCMatch(i,2),osmEkfRMCMatch(i,5)],[osmEkfRMCMatch(i,3),osmEkfRMCMatch(i,6)]);
   hold on
end
% link osm and gpsEkfRMatch
for i=1:size(gpsEkfRMatch)
   plot([gpsEkfRMatch(i,2),gpsEkfRMatch(i,5)],[gpsEkfRMatch(i,3),gpsEkfRMatch(i,6)]);
   hold on
end

axis equal
grid on
xlabel('east/m');
ylabel('north/m');
title('all matching');
legend('osmENU','osm\_match','gps','gps\_match','ekf','osmEkfRMCMatch','gpsEkfRMatch','result');

