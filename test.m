for i =1:size(VarName1)
   var(i,:) = [i,VarName1(i)] ;
end

plot(var(:,1),var(:,2));