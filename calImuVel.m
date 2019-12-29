close all
clear
clc

path = '/Users/user/Desktop/mac-ubuntu-share/ITBugData/speedCheckBug/1_GMT/result-json/imu.txt';
rawImu = importdata(path);
imu = [rawImu(:,1), rawImu(:,5:7)];

vel_init = [-23.600999548921646, 4.046042934177813, 0.004982441207661779];

for i = 1 : size(imu)
    if i == 1
        vel(i,:) = [imu(1,1), vel_init, norm(vel_init)*3.6]; 
    else
        vel_xyz = vel(i-1,2:4) + (imu(i,2:4)+[0,0,-9.7803267714])*(imu(i,1) - imu(i-1,1));
        vel(i,:) = [imu(i,1), vel_xyz, norm(vel_xyz)*3.6];
    end

end