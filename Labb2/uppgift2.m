clear
x=[0; 0.5; 1; 1.5; 2; 2.99; 3];
y=[0; 0.52; 1.09; 1.75; 2.45; 3.5; 4];

A=[ x x.^2];
B = A' *A;
C =  A' * y;

d=B\C; 

coeff1=d(1); 
coeff2=d(2);

n=length(x);
e=norm(A*d-y)/sqrt(n);

xmq = 0:1/100:3;
ymq = coeff2*(xmq.^2) + coeff1*xmq  ;
hold on;
plot(xmq,ymq);
plot(x , y, 'o');

%%
% Data
X = [0 0.5 1 1.5 2 2.99 3];
Y = [0 0.52 1.09 1.75 2.45 3.5 4];

% Designmatris
A = [X.^0 X.^1 X.^2];

% Lösning av minsta kvadraters problem
theta = (A'*A)\(A'*Y);

% Bestämda koefficienter
a = theta(1);
b = theta(2);
c = theta(3);

% Produktionsfunktion
f = @(x) a + b*x + c*x.^2;

% Skriv ut resultatet
fprintf('Produktionsfunktion: f(X) = %.2f + %.2fX + %.2fX^2\n', a, b, c)
%%
% Polynominterpolation med Newtons ansats
clear
% Datapunkter att interpolera
x = [0 0.5 1 1.5 2 2.99 3]';
y = [0 0.52 1.09 1.75 2.45 3.5 4]';

% Skapa matrisen (se slides)
B = [ones(size(x)), x-x(1), (x-x(1)).*(x-x(2)), (x-x(1)).*(x-x(2)).*(x-x(3))];

% Lös
a = B\y;

% Polynomet
p = @(t) a(1) + a(2)*(t-x(1)) + a(3)*(t-x(1)).*(t-x(2)) + a(4)*(t-x(1)).*(t-x(2)).*(t-x(3));

% Plotta datapunkter och polynom
clf
plot(x, y, 'o')
hold on

fplot(p, [0, 4])