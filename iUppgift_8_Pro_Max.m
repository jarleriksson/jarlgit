clear
maxiter = 30;
x = zeros(1, maxiter);
iterationv = 1:maxiter; 
N = 10000; % antal steg

explicitValue = iNplicitEulerUltra(N);

for iter=1:maxiter
    x(iter) = iFixpunktPro(iter, N);
end

y = abs(x - explicitValue);

semilogy(iterationv, y)