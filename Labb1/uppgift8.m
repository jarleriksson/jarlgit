clear
maxiter = 30;
x = zeros(1, maxiter);
iterationv = 1:maxiter; 
N = 1000; % antal steg

implicitValue = uppgift8_implicit(N);

for iter=1:maxiter
    x(iter) = uppgift8_fixpunkt(iter, N);)
end

y = abs(x - implicitValue);

semilogy(iterationv, y