close all
clear
clc

path = '/Users/user/Desktop/mac-ubuntu-share/DriverLoggerData/Performance/batch/1_1_oneLongLost/disThreshold_customized/';
dataFolder = '2017-11-10_T_09-55-20.984_GMT/0507/';
ori_gps = importdata([path dataFolder 'gps_local.txt']);
matched = importdata([path dataFolder 'gps_matched.txt']);
result = importdata([path dataFolder 'result_imu_gps_osm_opt.txt']);
ekf = importdata([path dataFolder 'result_ekf.txt']);

figure(1)
plot(ekf(:,5), ekf(:,6), 'b-o');
hold on
plot(matched(:,2), matched(:,3), 'b+');
hold on 
plot(matched(:,5), matched(:,6), 'mx');
hold on
plot(ori_gps(:,2), ori_gps(:,3), 'm-o');
hold on
plot(result(:,5), result(:,6), 'g-*');
hold on
for i=1:size(matched)
   plot([matched(i,2),matched(i,5)],[matched(i,3),matched(i,6)]);
   hold on
end
axis equal
grid on
xlabel('east/m');
ylabel('north/m');
title('gps ekf matching');
legend('ekf','ekf\_match','gps\_match','gps\_ori','result');