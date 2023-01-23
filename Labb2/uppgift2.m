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
hold 
plot(xmq,ymq);
plot(td , yd);
