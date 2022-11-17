% Eulers metod - exempel (c)
clear

t0 = 0; % starttid
tend = 1; % sluttid
N = 100; % antal steg
h = (tend-t0)/N; % steglängd          

f = @(t,y) t*y + t^3; % y'(t) = f(t,y)
y0 = 1; % begynnelsevärde

% Sätt upp vektorer för t och y
t = t0:h:tend;
y = zeros(length(t),1);
y(1) = y0; % begynnelsevillkor
for k=1:N
  y(k+1) = y(k) + h*f(t(k), y(k)); % Eulers metod
end

% Plotta Euler-lösningen
clf
plot(t, y)
% och exakta lösningen
y_exact = 3*exp(t.^2/2) - t.^2 - 2;
hold on
plot(t, y_exact)
legend('Euler', 'exakt')
