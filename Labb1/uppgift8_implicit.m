function [x40] = uppgift8_implicit(N)

vmax = 25; % Högsta tillåtna hastighet
d = vmax*3; % Distans mellan fordon för att sakta ner
v = 5; % Hastigheten för första bilen

t0 = 0; % starttid
tend = 40; % sluttid
h = (tend-t0)/N; % steglängd
M = 10; % antal bilar

x = zeros(N, M);

% x0 = zeros(1,M);
% x(1, :) = x0;

% (x0 för xi) = n*d
for n=1:M
  x(1,n) = n*d;
end

% Beräkna bil M
for n=1:N
  x(n+1,M) = x(n,M) + h*v; % Eulers metod
end

%Beräkna bil N
for n=1:N
  for i=1:(M-1)
    x(n+1,M-i) = (x(n,M-i) + (h/3)*min((x(n+1,M+1-i)-x(n,M-i))/(1+h/3),75)); % Eulers metod
  end
end

x40 = x(N+1, 1);
end

