clear

symvar a
symvar b

% Define function and Jacobian
f = @(x) [8 - a*x^b];
J = @(x) [2*x(1), 2*x(2); 1, -2*x(2)];

% Define initial guess
x0 = [2; 2];

% Solve nonlinear least squares problem
x = gaussNewton(f, J, x0)
