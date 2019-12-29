close all
clear
clc

path='/Users/user/Desktop/mac-ubuntu-share/DriverLoggerData/Performance/2017-08-16_T_08-46-23.675_GMT/';
dataName = '0417-IMU-GPS-OSM-Test/';

ori_ekf = importdata([path dataName 'result_ekf.txt']);
checked_ekf = importdata([path dataName 'ekfResult_movCheck.txt']);

figure(1)
plot(ori_ekf(:,5),ori_ekf(:,6),'ro-');
hold on
plot(checked_ekf(:,2),checked_ekf(:,3),'b+-');

axis equal
grid on

xlabel('east/m');
ylabel('north/m');
title('ekf-ekfMovCheck comparison');
legend('ekf\_ori','ekf\_movCheck');