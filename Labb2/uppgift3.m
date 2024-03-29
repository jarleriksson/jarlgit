clear 
alpha = [150; 200; 300; 500; 1000; 2000];
U = [2; 3; 4; 5; 6; 7];
zeros_vector = [zeros(6,1)];

A=[zeros_vector alpha];

B = A' *A;
C =  A' * log(8-U);

d=B\C; 

coeff1=d(1); 
coeff2=d(2);

xmq = 0:1/100:3;
ymq = coeff2*(xmq.^2) + coeff1*xmq  ;







%%
% Polynominterpolation med Newtons ansats
clear
% Datapunkter att interpolera
x = [150; 200; 300; 500; 1000; 2000]';
y = [2; 3; 4; 5; 6; 7]';

% Skapa matrisen (se slides)
B = [ones(size(x)), x-x(1), (x-x(1)).*(x-x(2)), (x-x(1)).*(x-x(2)).*(x-x(3)), (x-x(1)).*(x-x(2)).*(x-x(3)).*(x-x(4))];

% Lös
a = B\y;

% Polynomet
p = @(t) a(1) + a(2)*(t-x(1)) + a(3)*(t-x(1)).*(t-x(2)) + a(4)*(t-x(1)).*(t-x(2)).*(t-x(3));

% Plotta datapunkter och polynom
clf
plot(x, y, 'o')
hold on

fplot(p, [0, 2000])