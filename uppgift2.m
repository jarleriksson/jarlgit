
t0 = 0; % starttid
tend = 100; % sluttid
N = 100000; % antal steg
h = (tend-t0)/N; % steglängd

f = @(t,y) speed1(x); % y'(t) = f(t,y)

y0 = [0,0,0]; % begynnelsevärde

% Sätt upp vektorer för t och y
t = t0:h:tend;
y = zeros(length(t),length(y0));
y(1,:) = y0; % begynnelsevillkor
for k=1:N
  y(k+1,:) = y(k,:) + h*f(t(k), y(k,:))'; % Eulers metod
end

X = y(:,1);
Y = y(:,2);
Z = y(:,3);
% Plotta Euler-lösningen
I = 1:10:length(t); % plotta bara vart tionde steg (går snabbare)
plot3(X(I), Y(I), Z(I))
axis equal
view([30 15])