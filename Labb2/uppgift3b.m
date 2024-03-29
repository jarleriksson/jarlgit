
clear
%mk metod
x=[0; 0.5; 1; 1.5; 2; 2.99; 3];
y=[0; 0.52; 1.09; 1.75; 2.45; 3.5; 4];

A=[ x x.^2];
B = A' *A;
C =  A' * y;

d=B\C; 

coeff1=d(1); 
coeff2=d(2);


% Define the non-linear function U(alpha)
alpha = [150, 200, 300, 500, 1000, 2000]';
U = [2, 3, 4, 5, 6, 7]';
% Define the initial guess for a and b
c =[100, -0.1];

% Define the tolerance and maximum number of iterations
tol = 1e-6;
max_iter = 100;
r = @(alpha, U, c) 8 - c(1)*alpha.^c(2) - U;
J = [-alpha.^c(2), -c(1).*log(alpha).*alpha.^c(2)];

% Define the variables to store the error and number of iterations
s = inf;
iter = 0;
% Start the iteration loop
while norm(s) > tol && iter <= max_iter
    % Compute the Jacobian matrix
    s = -J\r(alpha, U, c);
    c = c + s';
    iter = iter + 1;
end



xx = linspace(0, 5);
konsumption = @(x) (coeff1*x + coeff2*x.^2)/(1-1/c(2));

plot(xx, konsumption(xx), '-')


