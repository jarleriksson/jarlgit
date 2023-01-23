td=[0; 0.5; 1; 1.5; 2; 2.99; 3];
yd=[0; 0.52; 1.09; 1.75; 2.45; 3.5; 4];

A=[ones(size(td)) td];
B = transpose(A) *A;
C =  transpose(A) * yd;

x=B\C; a=x(1); b=x(2); 

n=length(td);
e=norm(A*x-yd)/sqrt(n);

xmq = 0:1/100:3;
ymq = b*xmq + a ;
hold on;
plot(xmq,ymq);
plot(td , yd);


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

fplot(p, [1, 4])