clear 
% Define the non-linear function U(alpha)
 
% Define the data
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

h = @(x) 8 - c(1).*x.^c(2);

xx = linspace(0, 3000);
plot(alpha, U, 'o', xx, h(xx))





