% this is for the compare for whole road osm secondary opt

close all
clear 
clc

path = '/Users/user/Desktop/mac-ubuntu-share/2018-09-19_T_13-19-19.258_GMT/CeresResults/11thSegMMG258segAllResult'
imuGpsOpt = importdata('/Users/user/Desktop/mac-ubuntu-share/2018-09-19_T_13-19-19.258_GMT/result_imu_gps_opt.txt');
osmOpt = importdata([path '/osmOptLocalResult.txt']);
osm = importdata([path '/osmOriLocal.txt']);
osmJuncEli = importdata([path '/osmLocalJuncEli.txt']);
osmSegsEli = importdata([path '/osmLocalSegsEli.txt']);
matchedOsm = importdata([path '/osmSegsLocalMatched.txt']);
matchedOpt = importdata([path '/optSegsMatched.txt']);
% only the 11th seg
fourPosTest = importdata('/Users/user/Desktop/mac-ubuntu-share/2018-09-19_T_13-19-19.258_GMT/4PosTest/13_14.txt');
fourPosTestResult = importdata('/Users/user/Desktop/mac-ubuntu-share/2018-09-19_T_13-19-19.258_GMT/4PosTest/13_14Result_1e-25.txt');

fig1=figure(1);
plot(imuGpsOpt(:,5),imuGpsOpt(:,6),'bo-');
hold on
plot(osmOpt(:,2), osmOpt(:,3),'ro-');
hold on 
plot(osm(:,2), osm(:,3), 'm+-')
hold on 
plot(osmJuncEli(:,2), osmJuncEli(:,3),'yx-');
hold on
plot(osmSegsEli(:,2), osmSegsEli(:,3),'gs-');
hold on
plot(matchedOsm(:,2), matchedOsm(:,3),'c*-');
hold on 
plot(fourPosTestResult.data(:,2),fourPosTestResult.data(:,3),'r^-', 'LineWidth', 1.5);
hold on 
plot(fourPosTestResult.data(:,6),fourPosTestResult.data(:,7),'rh-', 'LineWidth', 1.5);
% check match right or not
for i = 1: size(matchedOpt)
   if matchedOpt(i,1) == matchedOsm(i,1)
    plot([matchedOpt(i,2),matchedOsm(i,2)],[matchedOpt(i,3), matchedOsm(i,3)], 'lineWidth', 1.5);
    hold on
   end
end
% check the match relationship in ceres
for i = 1: size(osmOpt)
   if osmOpt(i,1) == imuGpsOpt(i,1)
    plot([osmOpt(i,2),imuGpsOpt(i,5)],[osmOpt(i,3), imuGpsOpt(i,6)], 'lineWidth', 1.5);
    hold on
   end
end
grid on
legend('ori-opt','osmOpt','osm','juncEli-osm','segsEli-osm','matched-osm','result-atan','result-acos');
title('//');
axis equal
xlabel('E/m');
ylabel('N/m');
savefig(fig1, 'osm secondary opt result.fig');

