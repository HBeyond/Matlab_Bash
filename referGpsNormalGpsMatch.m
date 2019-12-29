
plot(correctmatch(:,2),correctmatch(:,3),'ro-');
hold on
plot(correctmatch(:,5),correctmatch(:,6),'bo-');
hold on
plot(errormatch(:,2),errormatch(:,3),'rx');
hold on
plot(errormatch(:,5),errormatch(:,6),'bx');
grid on
axis equal
xlabel('east/m');
ylabel('north/m');
legend('correct_match_referGPS','correct_match_normalGPS','error_match_referGPS','error_match_normalGPS')