clear all;clc;close all;

xx=linspace(0,100,100);
yy=linspace(0,100,100);
[x,y]=meshgrid(xx,yy);
z = Wave(x,y);
mesh(x,y,z);

%figure;
w = -1:0.0001:1;
S_w = 8.1*10^(-3)*(10^2)*exp(-0.74*(10./(10*w)).^2)./(w.^5);
%plot(w,S_w);


figure;
test_x = 0:0.001:1;
test_y = randi([2 100])*sin(test_x);

for i = 1:10
    test_y = randi([2 100])*sin((randi([2 100])*test_x+100*rand())*2*pi) + test_y;
end
plot(test_x,test_y);