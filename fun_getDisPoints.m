function dis = fun_getDisPoints(data)
for i = 1:(size(data(:,1),1)-1)
    dis(i,1) = sqrt(power((data(i,1)-data(i+1,1)),2)...
        +power((data(i,2)-data(i+1,2)),2));
end