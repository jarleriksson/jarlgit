clear 
x = [150; 200; 300; 500; 1000; 2000];
y = [2; 3; 4; 5; 6; 7];


A=[ones(size(x)) x];
B = transpose(A) *A;
C =  transpose(A) * y;

d=B\C; a=d(1); b=d(2); 

n=length(x);
e=norm(A*d-y)/sqrt(n);

xmq = 0:1/100:x(6);
ymq = b*xmq + a ;
hold on;
plot(xmq,ymq);
plot(x , y);




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