% this is the main part, add the functions you want use here
close all 
clear 
clc

%% data from linux analysis
linuxDataPath = '/Users/user/Desktop/mac-ubuntu-share/2018-09-19_T_09-29-47.303_GMT/segMatch/back2ndSegMatch/MatchResult3/correctNoTimeCheck.txt';
linuxData = load(linuxDataPath);
tIndex = linuxData(:,1);
disOsmOpt = linuxData(:,2);
optMatchedLocal = [linuxData(:,3), linuxData(:,4)];  
osmMatchedLocal = [linuxData(:,6), linuxData(:,7)];
% import the CenterLineLocal data
osmSeg = importdata('/Users/user/Desktop/mac-ubuntu-share/2018-09-19_T_09-29-47.303_GMT/segMatch/back2ndSegMatch/MatchResult3/CenterLineLocal.txt');
% import the spline data
osm_spline = importdata('/Users/user/Desktop/mac-ubuntu-share/2018-09-19_T_09-29-47.303_GMT/segMatch/back2ndSegMatch/MatchResult3/spline.txt');
% find the actual start point from CenterLineLocal data in matched osm
% data, and set it as the correct matching start point
% startNum = -1;
indexNum = 1;
dataLength = size(linuxData,1);
formerData = 10; % find the new start point in the former 10 points.
lastDis = sqrt(power((linuxData(1,6) - osmSeg(1,1)),2) + power((linuxData(1,7) - osmSeg(1,2)),2));
% for i = 2 : formerData
%     tempDis = sqrt(power((linuxData(i,6) - osmSeg(1,1)),2) + power((linuxData(i,7) - osmSeg(1,2)),2));
%     if tempDis < lastDis
%         lastDis = tempDis;
%         indexNum = i
% %         break
%     end
% end
lastDis
fig1 = figure(1);
% osm = importdata('/Users/user/Desktop/mac-ubuntu-share/2018-09-19_T_09-29-47.303_GMT/allMatch/CenterLineLocal.txt');
% opt = importdata('/Users/user/Desktop/mac-ubuntu-share/2018-09-19_T_09-29-47.303_GMT/allMatch/ReceivedGpsLocal.txt');
plot(linuxData(indexNum:dataLength,3), linuxData(indexNum:dataLength,4),'b+-.');  % matched-opt
hold on 
plot(linuxData(indexNum:dataLength,6), linuxData(indexNum:dataLength,7),'r+-');   % matched-osm
hold on 
% plot(osm(:,1), osm(:,2), 'ro-');
% hold on
% plot(opt(:,1), opt(:,2), 'bo-');
% hold on 
% osm_first = [10.0976532679929, 47.9334457348279,0];
% osm_first_ENU = fun_gpsPosToENU(osm_first,10.12908406555653,47.9844456911087,600);
% plot(osm_first_ENU(1),osm_first_ENU(2),'md');
plot(osmSeg(1,1),osmSeg(1,2),'md');  % plot the actual first point in CenterLineLocal.txt
hold on
plot(osm_spline(:,2), osm_spline(:,3), 'c^');
grid on
%legend('matched-opt', 'matched-osm', 'ori-osm', 'ori-opt','osm-start','osm-spline');
legend('matched-opt', 'matched-osm', 'osm-start','osm-spline');
title('matched trajectory ENU frame-ext47.303\_forthSegment\_GMT');
axis equal
xlabel('E/m');
ylabel('N/m');
savefig(fig1, 'matched trajectory ENU frame-ext47.303\_forthSegment_GMT.fig');

disOsm = fun_getXYPlaneDistance(osmMatchedLocal(indexNum:dataLength , :));
angOsm = fun_getAngle(osmMatchedLocal(indexNum:dataLength , :));
disOpt = fun_getXYPlaneDistance(optMatchedLocal(indexNum:dataLength , :));  % attention: there is another disOpt in function test module above
angOpt = fun_getAngle(optMatchedLocal(indexNum:dataLength , :));
disOsmOptErr = disOsm - disOpt;
angOsmOptErr = angOsm - angOpt;

fig2 = figure(2);
plot(tIndex, disOsmOpt, 'LineWidth', 1.5);
grid on
%legend('distance');
title('the distance between matched Osm points and Opt points-ext47.303\_forthSegment\_GMT');
xlabel('tIndex/sec');
ylabel('distance/m');
savefig(fig2, 'the distance between matched Osm points and Opt points-ext47.303\_forthSegment_GMT.fig');

tIndexResize = tIndex(indexNum:(size(tIndex,1)-1), 1);
fig3 = figure(3);
plot(tIndexResize, disOpt, 'b-.',  'LineWidth', 1.5);
hold on
plot(tIndexResize, disOsm, 'r', 'LineWidth', 1.5);
grid on
legend('inner distance of Opt', 'inner distance of Osm');
title('the inner distance of Osm and Opt-ext47.303\_forthSegment\_GMT');
xlabel('tIndexResize/sec');
ylabel('distance/m');
savefig(fig3, 'the inner distance of Osm and Opt-ext47.303\_forthSegment_GMT.fig');

fig4 = figure(4);
plot(tIndexResize, disOsmOptErr, 'LineWidth', 1.5);
title('the outer error with inner distance-ext47.303\_forthSegment\_GMT');
xlabel('tIndexResize/sec');
ylabel('distance/m');
savefig(fig4, 'the outer error with inner distance-ext47.303\_forthSegment_GMT.fig');

fig5 = figure(5);
plot(tIndexResize, angOpt, 'b-.',  'LineWidth', 1.5);
hold on
plot(tIndexResize, angOsm, 'r', 'LineWidth', 1.5);
grid on
legend('inner angle of Opt', 'inner angle of Osm');
title('the inner angle of Osm and Opt-ext47.303\_forthSegment\_GMT');
xlabel('tIndexResize/sec');
ylabel('angle/deg');
savefig(fig5, 'the inner angle of Osm and Opt-ext47.303\_forthSegment_GMT.fig');

fig6 = figure(6);
plot(tIndexResize, angOsmOptErr, 'LineWidth', 1.5);
title('the outer error with inner angle-ext47.303\_forthSegment\_GMT');
xlabel('tIndexResize/sec');
ylabel('angle/deg');
savefig(fig6, 'the outer error with inner angle-ext47.303\_forthSegment_GMT.fig');