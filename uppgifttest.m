
t0 = 0; % starttid
tend = 100; % sluttid
N = 100000; % antal steg
h = (tend-t0)/N; % steglängd

f = @(t,y) speed1(x); % y'(t) = f(t,y)

y0 = [0,0,0]; % begynnelsevärde


y(1,:) = y0; % begynnelsevillkor
for k=1:N
  y(k+1,:) = y(k,:) + h*f(t(k), y(k,:))'; % Eulers metod
end