clearvars -except siffror
clearpoints
hold on

X = [0; 0.5; 1; 1.5; 2; 2.99; 3];
Y = [0; 0.52; 1.09; 1.75;2.45; 3.5; 4];

scatter(X, Y)

n = 2;

[p, F] = mk(X, Y, n);

x = linspace(min(X),max(Y));
plot(x, polyval(p,x));
legend('Mätvärden', 'Polynom')
