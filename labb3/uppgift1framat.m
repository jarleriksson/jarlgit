clear
N = 500000;
h = 0.001;
q = zeros(2,N);
p = zeros(2,N);

%startvärden
a = 0.5;
q(1,1) = 1-a;
q(2,1) =0;
p(1,1) = 0;
p(2,1) = ((1+a)/(1-a))^0.5;

for n =1:N
    %hastighet
    p(:,n+1) = p(:,n) + h * (acceleration(q(:,n)));
    %position
    q(:,n+1) = q(:,n) + h * p(:,n);
end 

plot(q(1,:),q(2,:))
title('framåt Euler')
xlabel('q1(t)')
ylabel('q2(t)')

energiframat(q, p, n, h);