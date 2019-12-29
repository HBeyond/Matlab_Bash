close all
clear
clc

path = '/Users/user/Desktop/mac-ubuntu-share/DriverLoggerData/Performance/';
dataFolder = '2017-08-16_T_08-46-23.675_GMT/';
matched = importdata([path dataFolder '0408_noEliTest_OSM-005-3/match.txt']);
data005_3 = importdata([path dataFolder '0408_noEliTest_OSM-005-3/result_imu_gps_osm_opt.txt']);
data005_5 = importdata([path dataFolder '0408_noEliTest_OSM-005-5/result_imu_gps_osm_opt.txt']);
data009_3 = importdata([path dataFolder '0408_noEliTest_OSM-009-3/result_imu_gps_osm_opt.txt']);
data009_5 = importdata([path dataFolder '0408_noEliTest_OSM-009-5/result_imu_gps_osm_opt.txt']);
data002_1 = importdata([path dataFolder '0408_noEliTest_OSM-002-1/result_imu_gps_osm_opt.txt']);

figure(1)
plot(matched(:,2),matched(:,3),'b*-');
hold on
plot(matched(:,5),matched(:,6),'co-');
hold on
for i=1:size(matched)
   plot([matched(i,2),matched(i,5)],[matched(i,3),matched(i,6)]);
   hold on
end
axis equal
grid on
xlabel('east/m');
ylabel('north/m');
title('osm and ekf matched results');
legend('ekf\_match','osm\_match');

figure(2)
plot(matched(:,5),matched(:,6),'k^-');
hold on
plot(data005_3(:,5), data005_3(:,6), 'r*-');
hold on 
plot(data005_5(:,5), data005_5(:,6), 'b>-');
hold on 
plot(data009_3(:,5), data009_3(:,6), 'md-');
hold on 
plot(data009_5(:,5), data009_5(:,6), 'cs-');
hold on 
plot(data002_1(:,5), data002_1(:,6), 'g+-');
axis equal
grid on
xlabel('east/m');
ylabel('north/m');
title('combinations comparison');
legend('reference','0.05-3','0.05-5','0.09-3','0.09-5','0.02-1');
