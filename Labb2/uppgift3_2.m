clear

x = [ 150; 200; 300; 500; 1000; 2000 ];
y = ([ 1/2; 1/3; 1/4; 1/5; 1/6; 1/7] - 1/8).^(-1);
U_f = [2, 3, 4, 5, 6, 7]';

B = x' * x;
C =  x' * y;

d = B \ C; 

coeff1 = 1/d(1); 


xmq = min(x):1:max(x);

U = (1/8 + coeff1*(xmq.^(-1))).^(-1);

plot(x, U_f, 'o', xmq,U,'-');