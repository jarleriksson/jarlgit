close all
% Set step size, number of iterations and tolerance
h = 0.001; 
n = 90000; 
tol = 1e-10;

% Initialize u matrix with zeros
u = zeros(4,n);

% Set initial values for variables
a=0.5;
u(:,1)=[1-a; 0; 0; sqrt((1+a)/(1-a))];

f = @(q1,q2,p1,p2,q3,q4,p3,p4) [1/2*(h*p1+h*p3); 1/2*(h*p2+h*p4);h*(-1/2*(q1+q3)/((1/2*(q1+q3))^2 +(1/2*(q2+q4))^2)^(3/2));h*(-1/2*(q2+q4)/((1/2*(q1+q3))^2 +(1/2*(q2+q4))^2)^(3/2))];
for i=2:n
    w = u(:,i-1);
    while max(abs(u(:,i-1) + f(w(1),w(2),w(3),w(4),u(1,i-1),u(2,i-1),u(3,i-1),u(4,i-1))-w))> tol
    
    w = u(:,i-1) + f(w(1),w(2),w(3),w(4),u(1,i-1),u(2,i-1),u(3,i-1),u(4,i-1));
    end
   u(:,i)=w;
end

q1=u(1,:);
q2=u(2,:);
plot(q1,q2)
title('Symplektisk Euler')
xlabel('q1(t)')
ylabel('q2(t)')

axis equal

energi(u,h,n)