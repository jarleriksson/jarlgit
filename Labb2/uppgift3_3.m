clear

x = log([ 150; 200; 300; 500; 1000; 2000 ]);
y = log(8 - [ 1/2; 1/3; 1/4; 1/5; 1/6; 1/7]);

A = [ones(length(x), 1) x];

B = A' * A;
C =  A' * y;

d = B \ C; 

coeff1 = log(d(1)); 
coeff2 = log(d(2)); 


xmq = min(0):1:max(x);

U = 8 - exp(coeff1 + coeff2*xmq);

plot(xmq,U,'-');