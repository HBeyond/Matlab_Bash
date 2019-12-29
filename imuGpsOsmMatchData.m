close all
clear
clc
% /Users/user/Desktop/mac-ubuntu-share/DriverLoggerData/Performance/batch/1_1_oneLongLost/disThreshold_customized/2017-08-16_T_10-09-46.248_GMT/0507

path = '/Users/user/Desktop/mac-ubuntu-share/DriverLoggerData/Performance/batch/1_1_oneLongLost/disThreshold_customized/';
dataFolder = '2017-11-10_T_09-55-20.984_GMT/0507/';
dataName = dataFolder(1:29);
ori_data = importdata([path dataFolder 'match.txt']);
data = ori_data;
gps = importdata([path dataFolder 'gps_matched.txt']);
% osmOri = importdata([path dataFolder 'osmOri_0225_imuGpsOsmOpt/osmOri_imu_gps_osm_opt.txt']);
% opt_data = importdata([path dataFolder 'osmOri_0123_imuGpsOsmOpt_test/osmOri_imu_gps_osm_opt.txt']);
% imuGpsOpt_data = importdata([path dataFolder 'osmOri_0118_ImuGpsOpt_Ori/osmOri_imu_gps_opt.txt']);
osmOri = importdata([path dataName '/osmData.txt']);
osmOri = osmOri.data;
optedPos = importdata([path dataFolder 'opted_Positions.txt']);
ekfResult_movCheck = importdata([path dataFolder 'ekfResult_movCheck.txt']);

% transfer osm to ENU
% anchor
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

for i = 1:size(osmOri)
   osmOriENU(i,:) = fun_gpsPosToENU([osmOri(i,1), osmOri(i,2), 0], anchor(2), anchor(1), anchor(3)); 
end

figure(1);
plot(gps(:,5),gps(:,6),'g^-');
hold on
plot(data(:,2),data(:,3),'b*');
hold on
plot(data(:,5),data(:,6),'m+');
hold on
plot(osmOriENU(:,1),osmOriENU(:,2),'mo-');
hold on
plot(optedPos(:,2),optedPos(:,3),'yd-');
hold on 
plot(ekfResult_movCheck(:,2), ekfResult_movCheck(:,3), 'bs-');
for i=1:size(data)
   plot([data(i,2),data(i,5)],[data(i,3),data(i,6)]);
   hold on
end
% plot(opt_data(:,5),opt_data(:,6),'ms-');
% plot(imuGpsOpt_data(:,5),imuGpsOpt_data(:,6),'gd-');
axis equal
grid on
xlabel('east/m');
ylabel('north/m');
title('gps osm matching');
legend('gps\_match','ekf\_match','osm\_match','osmOri','opted-positions','ekfResult\_movCheck');
% legend('osmOri', 'gps', 'osm', '3-osmOri','2-osmOri');
%  legend('ekf\_match','osm\_match','osmOri','opted-positions','ekfResult_movCheck');

% % calculate the ang
% for i = 1 : size(data)-1
%     angosmOri(i,1) = fun_asin(data(i,1),data(i,2),data(i+1,1),data(i+1,2),data(i,5),data(i,6),data(i+1,5),data(i+1,6));
%     angGps(i,1) = fun_asin(data(i,3),data(i,4),data(i+1,3),data(i+1,4),data(i,5),data(i,6),data(i+1,5),data(i+1,6));
% %     ang3Opt(i,1) = func_asin(opt_data(i,5),opt_data(i,6),opt_data(i+1,5),opt_data(i+1,6),data(i,5),data(i,6),data(i+1,5),data(i+1,6));
% %     ang2Opt(i,1) = func_asin(imuGpsOpt_data(i,5),imuGpsOpt_data(i,6),imuGpsOpt_data(i+1,5),imuGpsOpt_data(i+1,6),data(i,5),data(i,6),data(i+1,5),data(i+1,6));
% end
% % ang = [angosmOri angGps ang2Opt ang3Opt]
%  ang = [angosmOri angGps]
% ang_ave = mean(ang)
