clear
tspan=[0 300];
a=0.5;
data =[0; sqrt((1+a)/(1-a)); 1-a; 0];
u = data;
 
f = @(t, data) [(-data(3)/(data(3)^2+data(4)^2)^(3/2)); (-data(4)/(data(3)^2+data(4)^2)^(3/2)); data(1); data(2)];

[t, data]=ode45(f,tspan ,data);

plot(data(:,3),data(:,4))
axis equal