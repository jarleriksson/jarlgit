function [x40] = uppgift8_fixpunkt(maxiter, N)
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

% (x0 för xi) = i*d
for i=1:M
  x(1,i) = i*d;
end

% Beräkna bil M
for i=1:N
  x(i+1,M) = x(i,M) + h*v; % Eulers metod
end

%Beräkna bil N
for i=1:N
  for n=1:(M-1)
    iter = 0; 
    x(i+1,M-n) = x(i,M-n);
    while iter < maxiter
        iter = iter + 1;
        xnew = x(i,M-n) + h*speed1(x(i+1,M-n+1)-x(i+1,M-n), vmax);
        x(i+1,M-n) = xnew;
        % disp([iter xnew diffx])
    end
  end
end

x40 = x(N+1, 1);
end

