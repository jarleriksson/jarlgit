clear
maxiter = 100;
x = zeros(1, maxiter);
iterationv = 1:maxiter; 

explicitValue = iNplicitEulerUltra();

for iter=1:maxiter
    x(iter) = iFixpunktPro(iter);
end

y = x - iNplicitEulerUltra();

semilogy(iterationv, y)