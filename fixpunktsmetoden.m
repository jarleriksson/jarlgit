g1 = @(x) (-x.^3-3)/4;    % Anonym funktion för g(x), alternativ 1
g2 = @(x) x.^3 + 5*x + 3; % Anonym funktion för g(x), alternativ 2

% Obs: Funktionerna g1 och g2 har samma fixpunkt, nämligen
% x≈-0.6735931, som denna figur visar:
plotinterval = [-2, 2];
clf, fplot(g1, plotinterval), hold on
fplot(g2, plotinterval)
fplot(@(x)x, plotinterval)
xlabel('x'), legend('g_1(x)', 'g_2(x)', 'x', 'Location', 'best')

% Testa fixpunktsmetoden för g1 och g2. För g1 så konvergerar
% metoden, men inte för g2.
g = g1;
%g = g2;

x = 1;               % Startgissning
tol = 1e-1000;         % Tolerans

diffx = 1; iter = 0; maxiter = 3;
format compact, format longg

while diffx > tol && iter < maxiter
    iter = iter + 1;     % Antal iterationer - n
    xnew = g(x);         % Uppdatering med fixpunkt
    diffx = abs(xnew-x); % |x(n+1)-x(n)|
    x = xnew;
    disp([iter xnew diffx])
end
if iter == maxiter
    disp('Varning! Maximalt antal iterationer nått')
end
