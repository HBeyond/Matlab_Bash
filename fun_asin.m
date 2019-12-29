function ang = func_asin(x1,y1,x2,y2,rx1,ry1,rx2,ry2)

eqn1 = sqrt(power((rx1-rx2)*(y1-y2)-(x1-x2)*(ry1-ry2),2));
eqn2 = sqrt(power(rx1-rx2,2)+power(ry1-ry2,2));
eqn3 = sqrt(power(x1-x2,2)+power(y1-y2,2));

ang = asin(eqn1/(eqn2*eqn3))*180/pi;