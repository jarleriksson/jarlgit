clear

x = [ 150; 200; 300; 500; 1000; 2000 ];
y = ([ 1/2; 1/3; 1/4; 1/5; 1/6; 1/7] - 1/8).^(-1);

A = [ x ];
B = A' * A;
C =  A' * y;

d = B \ C; 

coeff1 = d(1); 
% coeff2 = d(2);

n = length(x);
e = norm(A*d-y)/sqrt(n);

xmq = min(x):1/100:5000;
ymq = coeff1*xmq;

U = (1/8 + (1/coeff1)*(xmq.^(-1))).^(-1);

plot(xmq,U,'-');