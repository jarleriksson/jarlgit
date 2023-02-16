clear
N = 50000;
h = 0.0005;
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

scatter(q(1,:),q(2,:))