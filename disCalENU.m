clear 
clc

fourPosTest = importdata('/Users/user/Desktop/mac-ubuntu-share/2018-09-19_T_13-19-19.258_GMT/4PosTest/testData.txt');
fourPosTestResult = importdata('/Users/user/Desktop/mac-ubuntu-share/2018-09-19_T_13-19-19.258_GMT/4PosTest/testDataResult.txt');

% distance 
oriOptDis = sqrt(power(fourPosTest(1,2)-fourPosTest(2,2),2)+power(fourPosTest(1,3)-fourPosTest(2,3),2));
osmDis = sqrt(power(fourPosTest(1,6)-fourPosTest(2,6),2)+power(fourPosTest(1,7)-fourPosTest(2,7),2));

optAtanDis = sqrt(power(fourPosTestResult.data(1,2)-fourPosTestResult.data(2,2),2)+power(fourPosTestResult.data(1,3)-fourPosTestResult.data(2,3),2));
optAcosDis = sqrt(power(fourPosTestResult.data(1,6)-fourPosTestResult.data(2,6),2)+power(fourPosTestResult.data(1,7)-fourPosTestResult.data(2,7),2));

disp(['oriOptDis = ' num2str(oriOptDis) ', osmDis = ' num2str(osmDis) ', optAtanDis = ' num2str(optAtanDis) ', optAcosDis = ' num2str(optAcosDis)]);

% angle 
% oriOptAng = atan2(fourPosTest(1,3)-fourPosTest(2,3), fourPosTest(1,2)-fourPosTest(2,2));
oriOptAng = atan(fourPosTest(1,3)-fourPosTest(2,3)/fourPosTest(1,2)-fourPosTest(2,2));
% osmAng = atan2(fourPosTest(1,7)-fourPosTest(2,7), fourPosTest(1,6)-fourPosTest(2,6));
osmAng = atan(fourPosTest(1,7)-fourPosTest(2,7)/fourPosTest(1,6)-fourPosTest(2,6));

% optAtanAng = atan2(fourPosTestResult.data(1,3)-fourPosTestResult.data(2,3), fourPosTestResult.data(1,2)-fourPosTestResult.data(2,2));
optAtanAng = atan(fourPosTestResult.data(1,3)-fourPosTestResult.data(2,3)/fourPosTestResult.data(1,2)-fourPosTestResult.data(2,2));
% optAcosAng = atan2(fourPosTestResult.data(1,7)-fourPosTestResult.data(2,7), fourPosTestResult.data(1,6)-fourPosTestResult.data(2,6));
optAcosAng = atan(fourPosTestResult.data(1,7)-fourPosTestResult.data(2,7)/fourPosTestResult.data(1,6)-fourPosTestResult.data(2,6));


disp(['oriOptAng = ' num2str(oriOptAng) ', osmAng = ' num2str(osmAng) ', optAtanAng = ' num2str(optAtanAng) ', optAcosAng = ' num2str(optAcosAng)]);