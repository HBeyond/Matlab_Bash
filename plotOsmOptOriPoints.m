close all 
clear
clc

osm = importdata('/Users/user/Desktop/mac-ubuntu-share/2018-09-19_T_09-29-47.303_GMT/allMatch/CenterLineLocal.txt');
opt = importdata('/Users/user/Desktop/mac-ubuntu-share/2018-09-19_T_09-29-47.303_GMT/allMatch/ReceivedGpsLocal.txt');

a = osm(:,1)
b = osm(:,2)
fig1 = figure(1)
plot(osm(:,1), osm(:,2), 'ro-');
hold on
plot(opt(:,1), opt(:,2), 'bo-', );
title('osm and opt line under matlab-ext25.443\_GMT');
xlabel('E/m');
ylabel('N/m');
legend('osm','opt');
savefig(fig1, 'osm and opt line under matlab-ext25.443\_forthSegment_GMT.fig');