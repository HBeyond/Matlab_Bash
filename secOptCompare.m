% this is for the compare between osmLocalMatched and osmOpt

close all
clear 
clc
path = '/Users/user/Desktop/mac-ubuntu-share/2018-09-19_T_13-19-19.258_GMT/CeresResults/AtanTest'
osmLocalMatched = load([path '/osmSegsLocalMatched.txt']);
osmOptAll = importdata([path '/osmOptLocalResult.txt']);
optMatched = importdata([path '/optSegsMatched.txt']);

% extract matched ceres from all data
for i = 1:size(osmLocalMatched)
    tIndex = osmLocalMatched(i,1);
    for j = 1:size(osmOptAll)
        if tIndex == osmOptAll(j,1)
            index = j;
        end
    end
    osmOpt(i,:)=osmOptAll(index,:);
end

% plot the result 
fig1=figure(1);
plot(osmLocalMatched(:,2), osmLocalMatched(:,3),'b*-');
hold on
plot(optMatched(:,2), optMatched(:,3),'md-');
hold on
plot(osmOpt(:,2),osmOpt(:,3),'ro-');
legend('matched-osm','matched-opt','ceres-opt');
title('//');
axis equal
xlabel('E/m');
ylabel('N/m');
savefig(fig1, 'ceres result.fig');

% verify the result from data
xErrOptMatched = optMatched(1:size(optMatched)-1,2) - optMatched(2:size(optMatched),2);
yErrOptMatched = optMatched(1:size(optMatched)-1,3) - optMatched(2:size(optMatched),3);

xErrOsmMatched = osmLocalMatched(1:size(osmLocalMatched)-1,2) - osmLocalMatched(2:size(osmLocalMatched),2);
yErrOsmMatched = osmLocalMatched(1:size(osmLocalMatched)-1,3) - osmLocalMatched(2:size(osmLocalMatched),3);

xErrOsmOpt = osmOpt(1:size(osmOpt)-1,2) - osmOpt(2:size(osmOpt),2);
yErrOsmOpt = osmOpt(1:size(osmOpt)-1,3) - osmOpt(2:size(osmOpt),3);

% innerDis compare
for i=1:size(osmLocalMatched)-1
    innerDisOpt_M(i,1) = sqrt(power(xErrOptMatched(i),2) + power(yErrOptMatched(i),2));
end

for i=1:size(osmLocalMatched)-1
    innerDisOsm_M(i,1) = sqrt(power(xErrOsmMatched(i),2) + power(yErrOsmMatched(i),2));
end

for i=1:size(osmOpt)-1
    innerDisOpt_C(i,1) = sqrt(power(xErrOsmOpt(i),2) + power(yErrOsmOpt(i),2));
end
for i = size(osmOpt)+1 : size(osmLocalMatched)-1
   innerDisOpt_C(i,1) = 0; 
end
innerDis = [innerDisOpt_M, innerDisOpt_C, innerDisOsm_M]
save innerDis.mat innerDis

% inner ang compare
for i=1:size(osmLocalMatched)-1
    innerAngOpt_M(i,1) = atan2(yErrOptMatched(i), xErrOptMatched(i))*180/pi;
end

for i=1:size(osmLocalMatched)-1
    innerAngOsm_M(i,1) = atan2(yErrOsmMatched(i), xErrOsmMatched(i))*180/pi;
end

for i=1:size(osmOpt)-1
    innerAngOpt_C(i,1) = atan2(yErrOsmOpt(i), xErrOsmOpt(i))*180/pi;
end
for i = size(osmOpt)+1 : size(osmLocalMatched)-1
   innerAngOpt_C(i,1) = 0; 
end
innerAng = [innerAngOpt_M, innerAngOpt_C, innerAngOsm_M]
save innerAng.mat innerAng

% cal the dis cost
for i=1:size(optMatched)-1
    costDis_ini(i,1) = sqrt(power(osmLocalMatched(i,2)-osmLocalMatched(i+1,2),2)+power(osmLocalMatched(i,3)-osmLocalMatched(i+1,3),2))...
        - sqrt(power(optMatched(i,2)-optMatched(i+1,2),2)+power(optMatched(i,3)-optMatched(i+1,3),2));
end
for i=1:size(optMatched)-1
    costDis_ceres(i,1) = sqrt(power(osmLocalMatched(i,2)-osmLocalMatched(i+1,2),2)+power(osmLocalMatched(i,3)-osmLocalMatched(i+1,3),2))...
        - sqrt(power(osmOpt(i,2)-osmOpt(i+1,2),2)+power(osmOpt(i,3)-osmOpt(i+1,3),2));
end
costDis = [costDis_ini costDis_ceres]
save costDis.mat costDis
costDis_ave=sum(costDis)./size(costDis) 

% cal the ang cost
for i=1:size(optMatched)-1
    costAng_ini(i,1) = atan2(osmLocalMatched(i,3)-osmLocalMatched(i+1,3),osmLocalMatched(i,2)-osmLocalMatched(i+1,2))...
        -atan2(optMatched(i,3)-optMatched(i+1,3),optMatched(i,2)-optMatched(i+1,2));
end
for i=1:size(optMatched)-1
    costAng_ceres(i,1) = atan2(osmLocalMatched(i,3)-osmLocalMatched(i+1,3),osmLocalMatched(i,2)-osmLocalMatched(i+1,2))...
        -atan2(osmOpt(i,3)-osmOpt(i+1,3),osmOpt(i,2)-osmOpt(i+1,2));
end
costAng = [costAng_ini costAng_ceres]
save costAng.mat costAng
costAng_ave=sum(costAng)./size(costAng) 

% cal the ang+dis cost
for i=1:size(optMatched)-1
    costAngDis_ini(i,1) = sqrt(power(osmLocalMatched(i,2)-osmLocalMatched(i+1,2),2)+power(osmLocalMatched(i,3)-osmLocalMatched(i+1,3),2))...
        - sqrt(power(optMatched(i,2)-optMatched(i+1,2),2)+power(optMatched(i,3)-optMatched(i+1,3),2))...
        + atan2(osmLocalMatched(i,3)-osmLocalMatched(i+1,3),osmLocalMatched(i,2)-osmLocalMatched(i+1,2))...
        - atan2(optMatched(i,3)-optMatched(i+1,3),optMatched(i,2)-optMatched(i+1,2));
end 
for i=1:size(optMatched)-1
    costAngDis_ceres(i,1) = sqrt(power(osmLocalMatched(i,2)-osmLocalMatched(i+1,2),2)+power(osmLocalMatched(i,3)-osmLocalMatched(i+1,3),2))...
        - sqrt(power(osmOpt(i,2)-osmOpt(i+1,2),2)+power(osmOpt(i,3)-osmOpt(i+1,3),2))...
        + atan2(osmLocalMatched(i,3)-osmLocalMatched(i+1,3),osmLocalMatched(i,2)-osmLocalMatched(i+1,2))...
        - atan2(osmOpt(i,3)-osmOpt(i+1,3),osmOpt(i,2)-osmOpt(i+1,2));
end
costAngDis = [costAngDis_ini costAngDis_ceres]
save costAngDis.mat costAngDis
costAngDis_ave=sum(costAngDis)./size(costAngDis) 