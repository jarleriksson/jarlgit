 %Symplektisk
h = 0.001;
s = 100000;
tol = 1e-10;
% Begynnelsevärden
a=0.5;
u=zeros(4,s);
u(:,1)=[1-a; 0; 0; sqrt((1+a)/(1-a))];
f=@(p1,p2,q1,q2)  [p1; p2; -q1/(q1^2+q2^2)^(3/2); -q2/(q1^2+q2^2)^(3/2)];
for i=2:s
    w = u(:,i-1);
    while max(abs(u(:,i-1) + h* f(w(3),w(4),u(1,i-1),u(2,i-1))-w))> tol
       w = u(:,i-1) + h* f(w(3),w(4),u(1,i-1),u(2,i-1));
    end
    u(:,i)=w;
end
q1=u(1,:);
q2=u(2,:);

plot(q1,q2)
title('Symplektisk Euler')
xlabel('q1(t)')
ylabel('q2(t)')
energi(u,h,s)