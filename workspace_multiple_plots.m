%% 
fig1 = figure(1)
subplot(2,2,1)
% fig1 = figure(1)
plot(VarName3, -VarName4, 'ro-.')
xlabel('x')
ylabel('y')
grid on 
axis equal
% savefig(fig1, 'ori corners frame 0')
title('ori corners frame 0')

subplot(2,2,2)
% fig2 = figure(2)
plot(VarName8, -VarName9,'bo-.')
xlabel('x')
ylabel('y')
grid on
axis equal
% savefig(fig2, 'ori corners frame 1')
title('ori corners frame 1')

subplot(2,2,3)
% fig3 = figure(3)
plot(VarName13, -VarName14,'ro-.')
xlabel('x')
ylabel('y')
grid on
axis equal
% savefig(fig3, 'undistorted corners in cam frame 0')
title('corners in cam frame 0')

subplot(2,2,4)
% fig4 = figure(4)
plot(VarName18, -VarName19,'bo-.')
xlabel('x')
ylabel('y')
grid on
axis equal
% savefig(fig4, 'undistorted corners in cam frame 1')
title('corners in cam frame 1')

% subplot(3,2,5)
% % fig5 = figure(5)
% plot(VarName33, -VarName34,'ro-.')
% xlabel('x')
% ylabel('y')
% grid on
% axis equal
% % savefig(fig5, ' corners in cam frame 0')
% title('undistorted corners in cam frame 0')
% 
% subplot(3,2,6)
% % fig6 = figure(6)
% plot(VarName38, -VarName39,'bo-.')
% xlabel('x')
% ylabel('y')
% grid on
% axis equal
% % savefig(fig6, 'undistorted corners in cam frame 1')
% title('undistorted corners in cam frame 1')

savefig(fig1, 'ori_and_processed_corners_in_first_2_frames')

%% 
fig2 = figure(2)
% fig7 = figure(7)
plot3(VarName23, -VarName24, VarName25,'ro-.')
xlabel('x')
ylabel('y')
zlabel('z')
grid on
axis equal
title('triangulated world points')
savefig(fig2, 'triangulated world points')

%% 
fig3 = figure(3)
plot3(VarName29, -VarName30, VarName31, 'ro-.')
xlabel('x')
ylabel('y')
zlabel('z')
grid on
axis equal
title('optimized world points')
savefig(fig2, 'optimized world points')