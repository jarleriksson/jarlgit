clear
close all
% Set step size, number of iterations and tolerance
h = 0.001; 
N = 90000; 
tol = 1e-10;

% Initialize u matrix with zeros
u = zeros(4,N);


% Set initial values for variables
a=0.5;
u(:,1)=[1-a; 0; 0; sqrt((1+a)/(1-a))];

f = @(pos1,pos2,has1,has2,fore_pos1,fore_pos2,fore_has1,fore_has2) [1/2*(h*has1+h*fore_has1); 1/2*(h*has2+h*fore_has2);h*(-1/2*(pos1+fore_pos1)/((1/2*(pos1+fore_pos1))^2 +(1/2*(pos2+fore_pos2))^2)^(3/2));h*(-1/2*(pos2+fore_pos2)/((1/2*(pos1+fore_pos1))^2 +(1/2*(pos2+fore_pos2))^2)^(3/2))];
for i=2:N
    rel_data = u(:,i-1);
    while max(abs(u(:,i-1) + f(rel_data(1),rel_data(2),rel_data(3),rel_data(4),u(1,i-1),u(2,i-1),u(3,i-1),u(4,i-1))-rel_data))> tol
    
    rel_data = u(:,i-1) + f(rel_data(1),rel_data(2),rel_data(3),rel_data(4),u(1,i-1),u(2,i-1),u(3,i-1),u(4,i-1));
    end
   u(:,i)=rel_data;
end

% Plotta 
pos1=u(1,:);
pos2=u(2,:);
plot(pos1,pos2)
title('mittpunktsmetoden')
xlabel('pos1(t)')
ylabel('pos2(t)')

axis equal

energi(u,h,N)