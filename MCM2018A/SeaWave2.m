clc; close all; clear all;
dx = 1/8;
Mapsize = 30;
[x,y] = meshgrid(0:dx:Mapsize);
z =  (3*(1-x).^2.*exp(-(x.^2) - (y+1).^2) ...
    - 10*(x/5 - x.^3 - y.^5).*exp(-x.^2-y.^2) ...
    - 1/3*exp(-(x+1).^2 - y.^2)+4);
x_pre = x;
for i = 1:Mapsize
    x = x_pre;
    y = y - 1;
    for j = 1:Mapsize
        x = x - 1;
        z =  randi([-1 1])* rand() * (3*(1-x).^2.*exp(-(x.^2) - (y+1).^2) ...
            - 10*(x/5 - x.^3 - y.^5).*exp(-x.^2-y.^2) ...
            - 1/3*exp(-(x+1).^2 - y.^2)+4) + z;
    end
end
z = z-min(min(z));
mesh(x,y,z);
hold on;
grid off;
for i = -300:-150
    j = i /10;
    axis([j j+15 -30 0 0 200]);
    getframe();
end