close all
clear
clc

path = '/Users/user/Desktop/mac-ubuntu-share/DriverLoggerData/Performance/batch/1_3_oneLongLost/disThreshold300/2017-12-06_T_08-25-37.420_GMT/0507/';
gps = importdata([path 'gps_local.txt']);
osm = importdata([path 'match.txt']);;
ekf = importdata([path 'result_ekf.txt']);
opt = importdata([path 'result_imu_gps_osm_opt.txt']);


figure(1)
plot(gps(:,2), gps(:,3), 'bsquare-');
hold on
plot(osm(:,5), osm(:,6), 'mx-');
hold on
plot(ekf(:,5), ekf(:,6), 'g^-');
hold on 
plot(opt(:,5), opt(:,6), 'ro-');
axis equal
grid on
xlabel('East/m')
ylabel('North/m')
legend('Original GPS','Open source map skeleton points','EKF result','Optimization result');


