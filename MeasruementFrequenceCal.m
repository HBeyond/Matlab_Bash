close all
clear
clc

path = '/Users/user/Desktop/mac-ubuntu-share/ITBugData/SophusBug/';
gpsMeasurment = csvread([path '2018-05-31_T_14-39-12_GMT/gpsDataSheet.csv']);
imuMeasurment = csvread([path '2018-05-31_T_14-39-12_GMT/imuDataSheet.csv']);

% path = '/Users/user/Desktop/mac-ubuntu-share/DriverLoggerData/Performance/';
% gpsMeasurment = importdata([path '2017-08-16_T_08-46-23.675_GMT/forMatlabFrequencyTest.gps']);
% imuMeasurment = importdata([path '2017-08-16_T_08-46-23.675_GMT/2017-08-16_T_08-46-23.675_GMT.imu']);
% imuMeasurment = imuMeasurment.data;

gpsMeasurmentTimestamp = gpsMeasurment(:,1)/1000;
gpsFrequencyReference = size(gpsMeasurmentTimestamp,1) / (gpsMeasurmentTimestamp(size(gpsMeasurmentTimestamp,1))-gpsMeasurmentTimestamp(1));
gpsPeriodReference = 1/gpsFrequencyReference;

imuMeasurmentTimestamp = imuMeasurment(:,1)/1000;
imuFrequencyReference = size(imuMeasurmentTimestamp,1) / (imuMeasurmentTimestamp(size(imuMeasurmentTimestamp,1))-imuMeasurmentTimestamp(1));
imuPeriodReference = 1/imuFrequencyReference;

for i = 1 : size(gpsMeasurmentTimestamp) - 1   
    if abs(abs(gpsMeasurmentTimestamp(i) - gpsMeasurmentTimestamp(i+1)) - gpsPeriodReference) > gpsPeriodReference/2
        % C++ there should throw an exception to tell there is something
        % wrong with the GPS
        continue;
    else
        % C++ use emplace_back could avoid the 0 element to be added into
        % the vector
        gpsMeasurmentTimestampError(i,1) = abs(gpsMeasurmentTimestamp(i) - gpsMeasurmentTimestamp(i+1));
    end
end

for i = 1 : size(imuMeasurmentTimestamp) - 1   
    if abs(abs(imuMeasurmentTimestamp(i) - imuMeasurmentTimestamp(i+1)) - imuPeriodReference) > imuPeriodReference/2
        continue;
    else
        imuMeasurmentTimestampError(i,1) = abs(imuMeasurmentTimestamp(i) - imuMeasurmentTimestamp(i+1));
    end
end
% eliminate the 0 element
% C++ use emplace_back could avoid the 0 element to be added into
% the vector
gpsMeasurmentTimestampError(gpsMeasurmentTimestampError == 0) = [];
imuMeasurmentTimestampError(imuMeasurmentTimestampError == 0) = [];

gpsPeriodAverage = mean(gpsMeasurmentTimestampError)
imuPeriodAverage = mean(imuMeasurmentTimestampError)
