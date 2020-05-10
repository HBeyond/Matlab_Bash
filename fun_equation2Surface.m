function fig = fun_fitPlane(data, equation)
    % ???????x,y,z),????????????????
    x = data(:, 1)
    y = data(:, 2)
    z = equation
    
    z=1+2*x+3*y;
    scatter3(x,y,z,'filled')
    hold on;

    planeData=[x,y,z];

    % ??????SVD???????????????????????
    xyz0=mean(planeData,1);
    centeredPlane=bsxfun(@minus,planeData,xyz0);
    [U,S,V]=svd(centeredPlane);

    a=V(1,3);
    b=V(2,3);
    c=V(3,3);
    d=-dot([a b c],xyz0);

    % ????
    xfit = min(x):0.1:max(x);
    yfit = min(y):0.1:max(y);
    [XFIT,YFIT]= meshgrid (xfit,yfit);
    ZFIT = -(d + a * XFIT + b * YFIT)/c;
    mesh(XFIT,YFIT,ZFIT);
    xlabel('x')
    ylabel('y')
    zlabel('z')
    axis equal
    grid on
    title(fig_title)