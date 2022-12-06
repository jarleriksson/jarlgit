clear

d = 75; % Distans mellan fordon för att sakta ner
vmax = 25; % Högsta tillåtna hastighet
v = 5; % Hastigheten för första bilen

t0 = 0; % starttid
tend = 40; % sluttid
N = 40; % antal steg
h = (tend-t0)/N; % steglängd
M = 10; % antal bilar
t = t0:h:tend; %



x = zeros(N+1, M);

x0 = zeros(1,M);
x(1, :) = x0;

%Beräkna bil M
f = @(t,x) (5);
for k=0:N
  for j=1:(M-1)
    x(N+1-k,M-j) = (M*d) + (tend-k*h)*v;
  end
end

%Beräkna bil N
for k=0:N
  for j=1:(M-1)
      disp(M-j)
    x(N+1-k,M-j) = x(N-k,M-j) + h*speed1(x(k,M-j+1)-x(k,M-j), vmax); % Eulers metod
  end
end

plot(t, x)