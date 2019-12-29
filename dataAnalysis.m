close all
clear 
clc
path = '/Users/user/Desktop/mac-ubuntu-share/DriverLoggerData/20190228/M5_group/';
dataFolder = '2018-05-04_T_10-59-08.122_GMT/result_0308_imu_Gps_OsmOpt_30s-noInter-osm/';
ekf_mov = importdata([path dataFolder 'ekfResult_movCheck.txt']);
gps = importdata([path dataFolder 'gps_local.txt']);
imu = importdata([path dataFolder 'imu.txt']);
gps_matched = importdata([path dataFolder 'matchedGps.txt']);
osm_matched = importdata([path dataFolder 'match.txt']);
result = importdata([path dataFolder 'result_imu_gps_osm_opt.txt'])

gpsIndexFlag = 1;
match_ekf_gps = [];

% for i = 1:size(ekf_mov)
%    t_ekf_series(i,:) = [i, ekf_mov(i,1)];
% end
% for i = 1:size(gps)
%    t_gps_series(i,:) = [i, gps(i,1)]; 
% end
figure(1)
plot(ekf_mov(:,2), ekf_mov(:,3),'ro-');
hold on
plot(gps(:,2),gps(:,3),'b^-');
hold on
% plot(gps_matched(:,2),gps_matched(:,3),'g>-');
% hold on
plot(result(:,5),result(:,6),'c+-');
hold on
plot(osm_matched(:,5),osm_matched(:,6),'m*-')
legend('ekf\_mov','gps','result','osm\_matched');
axis equal

for i = 1:size(ekf_mov)
   t_ekf = ekf_mov(i,1);
   for j = 1:size(gps)
      t_gps = gps(j,1);
      tErr = t_ekf - t_gps;
      if abs(tErr) < (1/200)
         match_ekf_gps = [match_ekf_gps; ekf_mov(i,1), 0 , gps(j,1), 0, abs(tErr)] ;
         gpsIndexFlag = gpsIndexFlag + 1; 
         break;
      end
   end
end

% disp(match_ekf_gps);
disp(size(match_ekf_gps));

gpsIndexFlagDis = 1;
match_ekf_gps_dis = [];
for i = 1:size(ekf_mov)
   for j = gpsIndexFlagDis:size(gps)
      dis = sqrt(power(ekf_mov(i,2)-gps(j,2),2)+power(ekf_mov(i,3)-gps(j,3),2)); 
      if abs(dis) < (3)
         match_ekf_gps_dis = [match_ekf_gps_dis; ekf_mov(i,1), 0 , gps(j,1), 0, abs(tErr)] ;
         gpsIndexFlagDis = gpsIndexFlagDis + 1; 
         break;
      end
   end
end
disp(size(match_ekf_gps_dis));

% match_ekf_imu=[];
% imuIndexFlag = 1;
% for i = 1:size(ekf_mov)
%    t_ekf = ekf_mov(i,1);
%    for j = 1:size(imu)
%       t_imu = imu(j,1);
%       tErr = t_ekf - t_imu;
%       if abs(tErr) < (1/100)
%          match_ekf_imu = [match_ekf_imu; ekf_mov(i,1), 0 , imu(j,1), 0, abs(tErr)] ;
%          imuIndexFlag = imuIndexFlag + 1; 
%          break;
%       end
%    end
% end
% disp(size(match_ekf_imu));