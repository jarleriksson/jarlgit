function energiframat(q,p,n,h)

f=@(p,q)  1/2*(p(1).^2+p(2).^2)-1./sqrt(q(1).^2+q(2).^2);

t= h:h:n*h;

plot(t,f(p,q))
title('Energi')
xlabel('Tid')
ylabel('Energi')
end