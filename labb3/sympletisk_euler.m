clear
%Symplektisk
h = 0.001;
N = 100000;
tol = 1e-10;

% Begynnelsevärden
a=0.5;
u=zeros(4,N);
u(:,1)=[1-a; 0; 0; sqrt((1+a)/(1-a))];

% Symplektisk Euler metoden 
f=@(has1,has2,pos1,pos2)  [has1; has2; -pos1/(pos1^2+pos2^2)^(3/2); -pos2/(pos1^2+pos2^2)^(3/2)];
for i=2:N
    g = u(:,i-1);
    while max(abs(u(:,i-1) + h* f(g(3),g(4),u(1,i-1),u(2,i-1))-g))> tol
       g = u(:,i-1) + h* f(g(3),g(4),u(1,i-1),u(2,i-1));
    end
    u(:,i)=g;
end
pos1=u(1,:);
pos2=u(2,:);

% Plotta 
plot(pos1,pos2)
title('Symplektisk Euler')
xlabel('pos1(t)')
ylabel('pos2(t)')
energi(u,h,N)