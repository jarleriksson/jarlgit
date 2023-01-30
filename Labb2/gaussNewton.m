function x = gaussNewton(f, J, x0)
% Gauss-Newton algorithm for solving nonlinear least squares problems.
% Inputs:
%   f - function handle for the function to be minimized (vector valued)
%   J - function handle for the Jacobian of f
%   x0 - initial guess for the solution
% Output:
%   x - solution to the nonlinear least squares problem

maxIter = 100;
tol = 1e-6;

x = x0;
for i = 1:maxIter
    % Evaluate function and Jacobian at current solution
    fx = f(x);
    Jx = J(x);

    % Compute update direction using Gauss-Newton method
    dx = -(Jx'*Jx)\(Jx'*fx);

    % Update solution
    x = x + dx;

    % Check for convergence
    if norm(dx) < tol
        break;
    end
end
