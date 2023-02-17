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

%Beräkna bil N
f = @(t,x) (5);
for n=1:N
    
  for i=1:(M-1)
    x(n+1,M-i) = (x(n,M-i) + (h/3)*min((x(n+1,M+1-i)-x(n,M-i))/(1+h/3),75)); % Eulers metod
  end
end

plot(t, x)