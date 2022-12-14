clear

vmax = 25; % Högsta tillåtna hastighet
d = vmax*3; % Distans mellan fordon för att sakta ner
v = 5; % Hastigheten för första bilen

t0 = 0; % starttid
tend = 40; % sluttidt0
N = 100; % antal steg
h = (tend-t0)/N; % steglängd
M = 10; % antal bilar
t = t0:h:tend; %
tol = 1e-10;         % Tolerans
maxiter = 1000;

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
    diffx = tol + 1; 
    iter = 0; 
    x(i+1,M-n) = x(i,M-n); % Gissar hastighet = 0
    while diffx > tol && iter < maxiter
        iter = iter + 1;% Antal iterationer - n
        xnew = x(i,M-n) + h*speed1(x(i+1,M-n+1)-x(i+1,M-n), vmax);         % Uppdatering med fixpunkt
        % x(k+1,M-j) = x(k,M-j) + h*speed1(x(k,M-j+1)-x(k,M-j), vmax);
        % xnew = x(i,M-n) + (h/3)*min((x(i+1,M+1-n)-x(i+1,M-n))/(1+h/3),75);
        diffx = abs(xnew-x(i+1,M-n)); % |x(n+1)-x(n)|
        x(i+1,M-n) = xnew;
        disp([iter xnew diffx])
    end
    % x(i+1,M-n) = (x(i,M-n) + (h/3)*min((x(i+1,M+1-n)-x(i,M-n))/(1+h/3),75)); % Eulers metod
  end
end

plot(t, x)