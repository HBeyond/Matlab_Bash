a = [10.1831 47.9621];
b = [10.1837 47.9623];
c = [a;b];
lambda0 = 10.15076503157616;
phi0 = 47.98709034919739;
h0 = 601;
d = fun_gpsPosToENU(c, lambda0, phi0, h0); 
dis = fun_getXYPlaneDistance(d)
