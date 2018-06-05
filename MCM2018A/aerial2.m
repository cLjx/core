clc;close all;clear all;

plot3([0 0 0 0],[0 8 10 0],[1000 0 200 1000]);
grid on;
hold on;
t = 0:0.01:2*pi;
eclipse_x = 20*cos(t);
eclipse_z = 2*sin(t)+8;
plot(eclipse_x,eclipse_z,'--');
eclipse_x = 40*cos(t);
eclipse_z = 3*sin(t)+7;
plot(eclipse_x,eclipse_z,'--');
axis([-100 100 0 10 0 1000]);