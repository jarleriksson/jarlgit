clear

T = 1; % Tidsintervall
N = 100; % Antal tidssteg
delta_t = T/N;
x_0 = 1; % Startvärde

% Produktions-funktionerna med derivator
func_1 = @(X)(X); 
Derivative_func_1 = @(X)(1);
func_2 = @(X)(X+(X.^2)./10);
Derivative_func_2 = @(X)(1+X./5);

% c = [a,b] med a, b (från uppgift 2)
c = [1.070894403456629,0.061849368625104];

% Minsta-kvadrat-lösning
b = @(x,c)(c(1)*x+c(2)*x.^2);
Derivative_b = @(X,c)(c(1)+2*c(2)*X);

% Given nyttofunktion g
g = @(X)(2*sqrt(X));
Derivative_g = @(X)(1./sqrt(X)); 

% Vektorer vars N + 1 komponenter lagrar kapitalet X
X_1 = zeros(1,N+1);
X_2 = zeros(1,N+1);
X_b = zeros(1,N+1);
X_1(1)=x_0;
X_2(1)=x_0;
X_b(1)=x_0;

% Startgissningar från ekvation 9
for i = 1:N
    X_1(i+1) = X_1(i)+delta_t*Derivative_func_1(X_1(i));
    X_2(i+1) = X_2(i)+delta_t*Derivative_func_2(X_2(i));
    X_b(i+1) = X_b(i)+delta_t*Derivative_b(X_b(i),c);

end

% vektorer med N + 1 komponenter för uppdatering av kapitalet
X_update_1 = zeros(1,N+1); 
X_update_2 = zeros(1,N+1);
X_update_b = zeros(1,N+1);
X_update_1(1)=x_0;
X_update_2(1)=x_0;
X_update_b(1)=x_0;
lambda_1 = zeros(1,N);
lambda_2 = zeros(1,N);
lambda_b = zeros(1,N);
Derivative_norm_1 = 1;
Derivative_norm_2 = 1;
Derivative_norm_b = 1;

% Yttre slinga för iterationer
while Derivative_norm_1>10^(-10)
    lambda_1(N) = Derivative_g(X_1(N+1));

    % Första inre slinga - beräkna Lagrangemultiplikatorerna bakåt i tiden
    for j=N-1:-1:1 
        lambda_1(j) = lambda_1(j+1) + delta_t*Derivative_func_1(X_1(j+1))*lambda_1(j+1);
    end

    % Andra inre slinga - uppdatera kapitalet framåt i tiden
    for j=1:N
        X_update_1(j+1) = X_update_1(j) + delta_t*(func_1(X_update_1(j))- ...
        1/(lambda_1(j)^(3/5)));
    end 
    diff = X_1-X_update_1;
    Derivative_norm_1 = norm(diff);

    % Kapitarvektorn uppdateras
     X_1 = X_update_1;
end

% Motsvarande för resterande funktioner
while Derivative_norm_2 > 10^(-10)
    lambda_2(N) = Derivative_g(X_2(N+1));
    for j=N-1:-1:1
        lambda_2(j) = lambda_2(j+1) + delta_t*Derivative_func_2(X_2(j+1))*lambda_2(j+1);
    end
    for j=1:N
        X_update_2(j+1) = X_update_2(j) + delta_t*(func_2(X_update_2(j))- 1/(lambda_2(j)^(3/5)));
    end
    diff = X_2-X_update_2;
    Derivative_norm_2 = norm(diff);
    X_2 = X_update_2;
end 

while Derivative_norm_b > 10^(-10)
    lambda_b(N) = Derivative_g(X_b(N+1));
    for j=N-1:-1:1
        lambda_b(j) = lambda_b(j+1) + delta_t*Derivative_b(X_b(j+1),c)*lambda_b(j+1);
    end
    for j=1:N
        X_update_b(j+1) = X_update_b(j) + delta_t*(b(X_update_b(j),c)- 1/(lambda_b(j)^(3/5)));

    end 
    diff = X_b-X_update_b;
    Derivative_norm_b = norm(diff);
    X_b = X_update_b;
end

% Förhållande mellan lambda & alfa
alpha_1 = lambda_1.^(-3/5);
alpha_2 = lambda_2.^(-3/5);
alpha_t = lambda_b.^(-3/5);

% Presentera resultat
clf, close all
plot(0:delta_t:T,X_1)

hold on
plot(0:delta_t:T,X_2)
plot(0:delta_t:T,X_b)
legend('f(X)=X','f(X)=X+X^2/10ä,''f(X)=aX+bX^2, från del 2')
xlabel('Tid (t)')
ylabel('Kapital (X)')
title('Kapital (X) som funktion av tiden (t)')
figure(2)
plot(0:delta_t:T-delta_t,alpha_1)
hold on
plot(0:delta_t:T-delta_t,alpha_2)
