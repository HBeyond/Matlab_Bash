close all
clear
clc
% /Users/user/Desktop/mac-ubuntu-share/DriverLoggerData/Performance/2017-08-16_T_08-46-23.675_GMT/0505-normal

path = '/Users/user/Desktop/mac-ubuntu-share/DriverLoggerData/Performance/';
dataFolder = '2017-08-16_T_08-46-23.675_GMT/planB-match/';
data = importdata([path dataFolder 'match.txt']);

figure(1)
plot(data(:,2),data(:,3),'b*-');
hold on
plot(data(:,5),data(:,6),'ms-');
hold on
for i=1:size(data)
   plot([data(i,2),data(i,5)],[data(i,3),data(i,6)]);
   hold on
end
axis equal
grid on
xlabel('east/m');
ylabel('north/m');
title('match');
legend('ekf\_match','osm\_match');