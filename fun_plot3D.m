function fig = fun_plot3D(data, fig_title)
plot3(data(:,1), data(:,2),data(:,3),'ro-')
xlabel('x')
ylabel('y')
zlabel('z')
axis equal
grid on
title(fig_title)