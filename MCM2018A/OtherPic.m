clc;close all;clear all;
t = 0:0.01:2*pi;
eclipse_x = 30*cos(t);
eclipse_y = 20*sin(t);
plot(eclipse_x,eclipse_y,'--');
hold on;
plot([0 0],[-20 20]);
plot([-30 30],[0 0]);
axis([-50 50 -50 50]);