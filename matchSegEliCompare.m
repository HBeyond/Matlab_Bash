close all
clear 
clc

path = '/Users/user/Desktop/mac-ubuntu-share/2018-09-19_T_13-19-19.258_GMT';
OriOsm = load([path '/OsmOptResult_MatSegEliOn_11/osm_local.txt']);
OnMatched = load([path '/OsmOptResult_MatSegEliOn_11/match.txt']);
OffMatched = load([path '/OsmOptResult_OsmOptResult_MatSegEliOff_11/match.txt']);
OffMatched100 = load([path '/OsmOptResult_MatSegEliOff100_11/match.txt']);
spline_Inner = load([path '/spline_Inner.txt']);
spline_Outer = load([path '/spline_Outer.txt']);

off_no01 = load([path '/OsmOptResult_NoInnerInerP_tAd/match.txt']);
off_no1 = load([path '/OsmOptResult_NoInnerInerP_tAd0/match.txt']);
off = load([path '/OsmOptResult_NoInnerInerP_tAd01/match.txt']);
oriOsm = load([path '/OsmOptResult_NoOuter/osm_local.txt']);
%???????????
%on = load('/Users/user/Desktop/mac-ubuntu-share/2018-09-19_T_09-29-47.303_GMT/OsmOptResult_NoOuter/match.txt');
on = load([path '/OsmOptResult_NoOuter/match.txt']);

figure(1);
plot(OriOsm(:,2),OriOsm(:,3),'co-');
hold on
plot(off_no01(:,2),off_no01(:,3),'ro-');
hold on
plot(off_no01(:,5),off_no01(:,6),'bx-');
hold on
for i =1:size(off_no01)
    plot([off_no01(i,2),off_no01(i,5)],[off_no01(i,3),off_no01(i,6)]);
end
axis equal
title('(0,1)off');

figure(2);
plot(OriOsm(:,2),OriOsm(:,3),'co-');
hold on
plot(off_no1(:,2),off_no1(:,3),'ro-');
hold on
plot(off_no1(:,5),off_no1(:,6),'bx-');
axis equal
title('[0,1)off');

figure(3);
plot(OriOsm(:,2),OriOsm(:,3),'co-');
hold on
plot(off(:,2),off(:,3),'ro-');
hold on
plot(off(:,5),off(:,6),'bx-');
axis equal
title('(-0.05,1.05)off');

figure(4);
plot(OriOsm(:,2),OriOsm(:,3),'co-');
hold on
plot(on(:,2),on(:,3),'ro-');
hold on
plot(on(:,5),on(:,6),'bx-');
for i =1:size(on)
    plot([on(i,2),on(i,5)],[on(i,3),on(i,6)]);
end
axis equal
title('(-0.05,1.05)on');

% opt = [OnMatched(:,2),OnMatched(:,3)];
% onMat = [OnMatched(:,5),OnMatched(:,6)];
% offMat = [OffMatched(:,5),OffMatched(:,6)];
% offMat100 = [OffMatched100(:,5),OffMatched100(:,6)];

% figure(1);
% plot(OnMatched(:,2),OnMatched(:,3), 'ro-');
% hold on
% plot(OnMatched(:,5),OnMatched(:,6), 'bx-');
% title('on')
% axis equal
% 
% figure(2);
% plot(OffMatched(:,2),OffMatched(:,3), 'ro-');
% hold on
% plot(OffMatched(:,5),OffMatched(:,6), 'bx-');
% title('off')
% axis equal
% 
% figure(3)
% plot(OffMatched100(:,2),OffMatched100(:,3), 'ro-');
% hold on
% plot(OffMatched100(:,5),OffMatched100(:,6), 'bx-');
% title('off100')

% plot(OriOsm(:,2),OriOsm(:,3),'ro-');
% hold on
% plot(opt(:,1),opt(:,2),'bo-');
% hold on 
% plot(onMat(:,1), onMat(:,2),'m+-');
% hold on
% plot(offMat(:,1),offMat(:,2),'c^-');
% hold on
% plot(offMat100(:,1),offMat100(:,2), 'yx-');
% hold on
% plot(spline_Outer(:,2),spline_Outer(:,3), 'r*-');
% hold on
% plot(spline_Inner(:,2),spline_Inner(:,3),'g*-');
% grid on
% legend('ori-osm','opt','on-matched','off-matched','off-matched100','spline_outer','spline_inner');




