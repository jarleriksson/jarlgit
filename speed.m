clear all;
close all;
clc;

d = 75
v0 = 25

x = -5:d+5;

y  = max(min(v0, (x/d)*v0), 0)

plot(x, y)
 
xlabel('X-axis')
ylabel('Y-axis')
 
title('Piecewise Function f(x)')
% v = piecewise(x <= 0, 0, (10 > x) & (x > 0), x, x >= 10, 10)