% Eulers metod för ett system
% Baserat på avsnitt 6.4.3 i Sauer (Lorenz ekvationer)
clear

t0 = 0; % starttid
tend = 100; % sluttid
N = 100000; % antal steg
h = (tend-t0)/N; % steglängd

s = 10; r = 28; b = 8/3;
% y = [X, Y, Z] = [y(1), y(2), y(3)]
f = @(t,y) [-s*y(1) + s*y(2) ;
            -y(1)*y(3) + r*y(1) - y(2) ;
            y(1)*y(2) - b*y(3)]; % y'(t) = f(t,y)
y0 = [1,1,1]; % begynnelsevärde

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
