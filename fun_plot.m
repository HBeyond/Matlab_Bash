function fig = fun_plot(data, fig_title)
plot(data(:,1), data(:,2),'ro-')
xlabel('x')
ylabel('y')
axis equal
grid on
title(fig_title)