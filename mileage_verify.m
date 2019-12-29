close all
clear
clc

path = '/Users/user/Desktop/mac-ubuntu-share/DriverLoggerData/Oea-mileageTest/2017-11-13_T_10-40-48.988_GMT/result-mileage/';
result = importdata([path 'Smoothed Trajectory.txt']);

data = result.data;
positionData = data(:,1:3);

mileage = zeros(size(positionData(:,1)));

lambda0 = 10.638630855828524;  % for longitude
phi0 = 52.2524718940258;      % for latitude
h0 = 99;                     % for altitude

for i = 1:size(positionData)
    if i == 1
       distance(i) = 0; 
    else
       lastPosition = positionData(i-1,:);
       lastPosition = [lastPosition(2),lastPosition(1),lastPosition(3)];
       lastPositionENU = fun_gpsPosToENU(lastPosition, lambda0, phi0, h0);
       currentPosition = positionData(i,:);
       currentPosition = [currentPosition(2),currentPosition(1),currentPosition(3)];
       currentPositionENU = fun_gpsPosToENU(currentPosition, lambda0, phi0, h0);
       error = currentPositionENU - lastPositionENU;
       distance(i) = norm(error)/1000;
       mileage(i) = mileage(i-1) + distance(i);
    end
    
end

disp(mileage)
