clear
t = [ 150; 200; 300; 500; 1000; 2000 ];
U = [ 2; 3; 4; 5; 6; 7];

% y = 8 - U(alpha) = a*alpha^b
y = 8 - U;


% Datapunkter för antal bilar vid olika tidpunkter:
% Låt oss mäta tiden i antal år efter 1950.

% Plot av datapunkerna
figure(1), clf
plot(t, y, 'o')
hold on

% Anynom funktion för modellen
f = @(t, c) (c(1) * t.^(c(2))); % c = [a, b]

tt = linspace(1, 30);

%%
% Lös ursprungliga modellen med Gauss-Newtons metod
% (se slides!)

c = [100; -0.1]; % startgissning
r = @(t, y, c) f(t,c) - y;
D_r = @(t, y, c) [t.^(c(2)), c(1)*log(t).*(t.^(c(2)))];
tol = 1e-10; s = Inf;
while norm(s) >= tol
    s = -D_r(t,y,c) \ r(t,y,c); % överbestämt system!
    disp(norm(s)) % kan användas för att studera metodens konvergens
    c = c + s;
end

figure(1)
plot(tt, f(tt, c));
legend("Punkter", "Gauss-Newton");

% Vad blir normen av residualvektorn?
resnorm2 = norm(f(t,c) - y)







