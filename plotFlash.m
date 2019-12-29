close all
clear 
clc 

path = '/Users/user/Desktop/mac-ubuntu-share/DriverLoggerData/20190228/M5_group/';
dataFolder = '2018-05-04_T_10-59-08.122_GMT/'
data = importdata([path dataFolder 'matchResult_0308_GPS/match.txt']);

for i = 1 : size(data)-1
    plot([data(i,2),data(i+1,2)],[data(i,3),data(i+1,3)],'b*-');
    hold on
    delay
end