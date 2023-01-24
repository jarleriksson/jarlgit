clearvars -except siffror
clearpoints
hold on

X = [0; 0.5; 1; 1.5; 2; 2.99; 3];
Y = [0; 0.52; 1.09; 1.75;2.45; 3.5; 4];
siffror = [X Y];

scatter(siffror(:,1), siffror(:,2))

n = 2;

[p, F] = mk(siffror(:,1), siffror(:,2), n);

x = linspace(min(siffror(:,1)),max(siffror(:,1)));
plot(x, polyval(p,x));
legend('Mätvärden', 'Polynom')
% fplot(@(x) p(4) + p(3)*x+ p(2)*(x .^2)+p(1)*(x.^3));
% disp(polyval(p,x));
