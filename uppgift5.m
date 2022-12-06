clear

d = 75; % Distans mellan fordon för att sakta ner
vmax = 25; % Högsta tillåtna hastighet
v = 5; % Hastigheten för första bilen

t0 = 0; % starttid
tend = 40; % sluttidt0
N = 13; % antal steg
h = (tend-t0)/N; % steglängd
M = 10; % antal bilar
t = t0:h:tend; %

x = zeros(N, M);

% x0 = zeros(1,M);
% x(1, :) = x0;

% (x0 för xi) = i*d
for i=1:M
  x(1,i) = i*d;
end

% Beräkna bil M
for i=1:N
  x(i+1,M) = x(i,M) + h*v; % Eulers metod
end

%Beräkna bil N
f = @(t,x) (5);
for i=1:N
    
  for n=1:(M-1)
    x(i+1,M-n) = (x(i,M-n) + (h/3)*min((x(i+1,M+1-n)-x(i,M-n))/(1+h/3),75)); % Eulers metod
  end
end

plot(t, x)