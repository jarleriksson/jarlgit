clear

d = 75; % Distans mellan fordon
vmax = 25; % Högsta tillåtna hastighet
v = 25; % Hastigheten för första bilen

t0 = 0; % starttid
tend = 40; % sluttid
N = 50; % antal steg
h = (tend-t0)/N; % steglängd
M = 10; % antal bilar
t = t0:h:tend; % steglängd

x = zeros(N, M);

% x0 = zeros(1,M);
% x(1, :) = x0;

% (x0 för xi) = i*d
for k=1:M
  x(1,k) = k*10;
end

% Beräkna bil 1
for k=1:N
  x(k+1,M) = x(k,M) + h*v; % Eulers metod
end

%Beräkna bil N
f = @(t,x) (5);
for k=1:N
  for j=1:(M-1)
    x(k+1,M-j) = x(k,M-j) + h*speed1(x(k,M-j+1)-x(k,M-j), d, vmax); % Eulers metod
  end
end

plot(t, x)