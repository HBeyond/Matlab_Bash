close all
clear
clc

path='/Users/user/Desktop/mac-ubuntu-share/DriverLoggerData/Performance/2017-08-16_T_08-46-23.675_GMT/';
dataName = '0417-IMU-GPS-OSM-Test/';

ori_ekf = importdata([path dataName 'result_ekf.txt']);
checked_ekf = importdata([path dataName 'ekfResult_movCheck.txt']);

a = [882.619797160932, 3179.15258087154];
b = [882.985257305401, 3179.1844171963];
lastVec = b-a;

c = [ori_ekf(16744:19326, 5), ori_ekf(16744:19326, 6)];

for i = 1:size(c,1)
%     disp(c(i))
    nextVec = c(i,:)-b;

    d(i,1) = dot(lastVec, nextVec);

    if d(i,1)>0
       disp('yes') 
    end
end