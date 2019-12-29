close all
clear
clc

path = '/Users/user/Desktop/mac-ubuntu-share/ITBugData/speedCheckBug/1_GMT/result-json/processed_gps_local.txt';

processedGps_local = importdata(path);

gps_local = [processedGps_local(:,1), processedGps_local(:,5), processedGps_local(:,6),processedGps_local(:,7),processedGps_local(:,8)];

% vel 
for i = 1 : size(gps_local)
    if i == 1
        vel(i,:) = gps_local(1,1:4);
    else
        vel_xyz = (gps_local(i,2:4) - gps_local(i-1,2:4)) / (gps_local(i,1) - gps_local(i-1,1));
        vel(i,:) = [gps_local(i,1), vel_xyz];
    end
end
% comphrehensive vel
for i = 1 : size(vel)
    vel_comphre(i,:) = [vel(i,1), norm(vel(i,2:4))*3.6];
end

% acc 
for i = 1 : size(vel)
   if i == 1
      acc(i,:) = vel(i,2:4);
   else
       acc_xyz = (vel(i,2:4) - vel(i-1,2:4)) / (vel(i,1) - vel(i-1,1));
       acc(i,:) = acc_xyz;
   end
end
