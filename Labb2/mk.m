function [p,error_mean] = mk(x,y,n)
%MK Summary of this function goes here
%   Detailed explanation goes here
A = x.^(0:n);
c = linsolve(A' * A, A' * y);
% c = (A' * A)\(A' * y);
% c = pinv(A' * A)*(A' * y);
% c = bicgstab(A' * A,A' * y,1e-3,100);
p = flip(c);
error = abs(y - polyval(flip(c),x));
error_mean = sum(error) / length(error);
end