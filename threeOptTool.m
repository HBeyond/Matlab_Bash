close all
clear
clc

path = '/Users/user/Desktop/mac-ubuntu-share/imuGpsOsmOpt';
resultFolder = 'matchResult_0129/match.txt'
% match442 = load([path '/2018-04-26_T_13-54-00.442_GMT/' resultFolder]);
match443 = load([path '/2018-09-18_T_14-05-25.443_GMT/' resultFolder]);
match844 = load([path '/2018-09-18_T_14-30-25.844_GMT/' resultFolder]);
match303 = load([path '/2018-09-19_T_09-29-47.303_GMT/' resultFolder]);
match495 = load([path '/2018-09-19_T_09-39-47.495_GMT/' resultFolder]);
match258 = load([path '/2018-09-19_T_13-19-19.258_GMT/' resultFolder]); 

% %%
% % plot a match result
% fig1=figure(1);
% % optimization data 
% plot(match442(:,2),match442(:,3),'r^-');
% hold on 
% % osm data 
% plot(match442(:,5),match442(:,6),'b*-');
% hold on
% % link the matched positions between opt data and osm data
% for i = 1: size(match442)
%     plot([match442(i,2),match442(i,5)],[match442(i,3), match442(i,6)], 'lineWidth', 1.5);
% %     dis = sqrt(power((match442(i,2)-match442(i,5)),2)+power((match442(i,3)-match442(i,6)),2));
% %     text((match442(i,2)+match442(i,5))/2,(match442(i,3)-match442(i,6))/2, num2str(dis));
%     hold on
% end
% grid on
% axis equal
% xlabel('east/m');
% ylabel('north/m');
% title('3 opt match442 result');
% legend('opt data','osm data');
% savefig(fig1, '3 opt match442 result');
% 
% % get the ang and dis error
% for i =1 : size(match442)-1
%    if (floor(match442(i+1,1))- floor(match442(i,1)) == 1)
%        angError442(i,1) = fun_asin(match442(i,2),match442(i,3),match442(i+1,2),match442(i+1,3),match442(i,5),match442(i,6),match442(i+1,5),match442(i+1,6));
%        optDisLastNext442(i,1) = fun_getDisPoints(match442(i,2),match442(i,3),match442(i+1,2),match442(i+1,3));       
%        osmDisLastNext442(i,1) = fun_getDisPoints(match442(i,5),match442(i,6),match442(i+1,5),match442(i+1,6));
%    end
% end
% disError442 = optDisLastNext442 - osmDisLastNext442;
% error442 = [angError442 disError442]
% var442 = [var(error442(:,1)),var(error442(:,2))]


%%
% % path = '/Users/user/Desktop/mac-ubuntu-share/imuGpsOsmOpt';
% % resultFolder = 'result_0115_4_ImuGpsOsmOpt/match.txt'
% % match443 = load([path '/2018-09-18_T_14-05-25.443_GMT/' resultFolder]);
% fig2=figure(2);
% plot(match443(:,2),match443(:,3),'r^-');
% hold on 
% plot(match443(:,5),match443(:,6),'b*-');
% hold on
% % link the matched positions between opt data and osm data
% for i = 1: size(match443)
%     plot([match443(i,2),match443(i,5)],[match443(i,3), match443(i,6)], 'lineWidth', 1.5);
%     hold on
% end
% grid on
% axis equal
% xlabel('east/m');
% ylabel('north/m');
% title('3 opt match443 result');
% legend('opt data','osm data');
% savefig(fig2, '3 opt match443 result');

% get the ang and dis error
for i =1 : size(match443)-1
   if (floor(match443(i+1,1))- floor(match443(i,1)) == 1)
       angError443(i,1) = fun_asin(match443(i,2),match443(i,3),match443(i+1,2),match443(i+1,3),match443(i,5),match443(i,6),match443(i+1,5),match443(i+1,6));
       optDisLastNext443(i,1) = fun_getDisPoints(match443(i,2),match443(i,3),match443(i+1,2),match443(i+1,3));
       osmDisLastNext443(i,1) = fun_getDisPoints(match443(i,5),match443(i,6),match443(i+1,5),match443(i+1,6));
   end
end
disError443 = optDisLastNext443 - osmDisLastNext443;
error443 = [angError443 disError443]
var443 = [std(error443(:,1)),std(error443(:,2))]

%%
% fig3=figure(3);
% plot(match844(:,2),match844(:,3),'r^-');
% hold on 
% plot(match844(:,5),match844(:,6),'b*-');
% hold on
% % link the matched positions between opt data and osm data
% for i = 1: size(match844)
%     plot([match844(i,2),match844(i,5)],[match844(i,3), match844(i,6)], 'lineWidth', 1.5);
%     hold on
% end
% grid on
% axis equal
% xlabel('east/m');
% ylabel('north/m');
% title('3 opt match844 result');
% legend('opt data','osm data');
% savefig(fig3, '3 opt match844 result');

% get the ang and dis error
for i =1 : size(match844)-1
   if (floor(match844(i+1,1))- floor(match844(i,1)) == 1)
       angError844(i,1) = fun_asin(match844(i,2),match844(i,3),match844(i+1,2),match844(i+1,3),match844(i,5),match844(i,6),match844(i+1,5),match844(i+1,6));
       optDisLastNext844(i,1) = fun_getDisPoints(match844(i,2),match844(i,3),match844(i+1,2),match844(i+1,3));
       osmDisLastNext844(i,1) = fun_getDisPoints(match844(i,5),match844(i,6),match844(i+1,5),match844(i+1,6));
   end
end
disError844 = optDisLastNext844 - osmDisLastNext844;
error844 = [angError844 disError844]
var844 = [std(error844(:,1)),std(error844(:,2))]

%%
% fig4=figure(4);
% plot(match303(:,2),match303(:,3),'r^-');
% hold on 
% plot(match303(:,5),match303(:,6),'b*-');
% hold on
% % link the matched positions between opt data and osm data
% for i = 1: size(match303)
%     plot([match303(i,2),match303(i,5)],[match303(i,3), match303(i,6)], 'lineWidth', 1.5);
%     hold on
% end
% grid on
% axis equal
% xlabel('east/m');
% ylabel('north/m');
% title('3 opt match303 result');
% legend('opt data','osm data');
% savefig(fig4, '3 opt match303 result');

% get the ang and dis error
for i =1 : size(match303)-1
   if (floor(match303(i+1,1))- floor(match303(i,1)) == 1)
       angError303(i,1) = fun_asin(match303(i,2),match303(i,3),match303(i+1,2),match303(i+1,3),match303(i,5),match303(i,6),match303(i+1,5),match303(i+1,6));
       optDisLastNext303(i,1) = fun_getDisPoints(match303(i,2),match303(i,3),match303(i+1,2),match303(i+1,3));
       osmDisLastNext303(i,1) = fun_getDisPoints(match303(i,5),match303(i,6),match303(i+1,5),match303(i+1,6));
   end
end
disError303 = optDisLastNext303 - osmDisLastNext303;
error303 = [angError303 disError303]
var303 = [std(error303(:,1)),std(error303(:,2))]

%%
% fig5=figure(5);
% plot(match495(:,2),match495(:,3),'r^-');
% hold on 
% plot(match495(:,5),match495(:,6),'b*-');
% % link the matched positions between opt data and osm data
% for i = 1: size(match495)
%     plot([match495(i,2),match495(i,5)],[match495(i,3), match495(i,6)], 'lineWidth', 1.5);
%     hold on
% end
% grid on
% axis equal
% xlabel('east/m');
% ylabel('north/m');
% title('3 opt match495 result');
% legend('opt data','osm data');
% savefig(fig5, '3 opt match495 result');

% get the ang and dis error
for i =1 : size(match495)-1
   if (floor(match495(i+1,1))- floor(match495(i,1)) == 1)
       angError495(i,1) = fun_asin(match495(i,2),match495(i,3),match495(i+1,2),match495(i+1,3),match495(i,5),match495(i,6),match495(i+1,5),match495(i+1,6));
       optDisLastNext495(i,1) = fun_getDisPoints(match495(i,2),match495(i,3),match495(i+1,2),match495(i+1,3));
       osmDisLastNext495(i,1) = fun_getDisPoints(match495(i,5),match495(i,6),match495(i+1,5),match495(i+1,6));
   end
end
disError495 = optDisLastNext495 - osmDisLastNext495;
error495 = [angError495 disError495]
var495 = [std(error495(:,1)),std(error495(:,2))]

%%
% fig6=figure(6);
% plot(match258(:,2),match258(:,3),'r^-');
% hold on 
% plot(match258(:,5),match258(:,6),'b*-');
% hold on
% % link the matched positions between opt data and osm data
% for i = 1: size(match258)
%     plot([match258(i,2),match258(i,5)],[match258(i,3), match258(i,6)], 'lineWidth', 1.5);
%     hold on
% end
% grid on
% axis equal
% xlabel('east/m');
% ylabel('north/m');
% title('3 opt match258 result');
% legend('opt data','osm data');
% savefig(fig6, '3 opt match258 result');

% get the ang and dis error
for i =1 : size(match258)-1
   if (floor(match258(i+1,1))- floor(match258(i,1)) == 1)
       angError258(i,1) = fun_asin(match258(i,2),match258(i,3),match258(i+1,2),match258(i+1,3),match258(i,5),match258(i,6),match258(i+1,5),match258(i+1,6));
       optDisLastNext258(i,1) = fun_getDisPoints(match258(i,2),match258(i,3),match258(i+1,2),match258(i+1,3));
       osmDisLastNext258(i,1) = fun_getDisPoints(match258(i,5),match258(i,6),match258(i+1,5),match258(i+1,6));
   end
end
disError258 = optDisLastNext258 - osmDisLastNext258;
error258 = [angError258 disError258]
var258 = [std(error258(:,1)),std(error258(:,2))]