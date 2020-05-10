function fun_scattersFitSurface(data, fig_title)
    x = data(:,1);
    y = data(:,2);
    z = data(:,3);
    
    figure(1)
    plot3(x,y,z,'r*-')
    grid on
    xlabel('x')
    ylabel('y')
    zlabel('z')
    grid on
    title(fig_title)
    
    hold on 
    [X,Y] = meshgrid(linspace(min(x), max(x)),linspace(min(y), max(y)));
    Z = griddata(x,y,z,X,Y);
    surf(X,Y,Z) 
    axis equal