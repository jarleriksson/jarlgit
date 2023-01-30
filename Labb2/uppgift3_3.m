clear

x_f = [ 150; 200; 300; 500; 1000; 2000 ];
x = log(x_f);
U_f = [2, 3, 4, 5, 6, 7]';
y = log(8 - U_f);

A = [ones(length(x), 1) x];

B = A' * A;
C =  A' * y;

d = B \ C; 

a = exp(d(1)); 
b = d(2); 


xmq = min(x_f):1:max(x_f);

U = 8-a*(xmq.^b);

plot(x_f, U_f, 'o',xmq,U,'-');