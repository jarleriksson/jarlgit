    function energi(u,h,s)
figure
f=@(p1,p2,q1,q2)  1/2*(p1.^2+p2.^2)-1./sqrt(q1.^2+q2.^2);

t= h:h:s*h;

plot(t,f(u(3,:),u(4,:),u(1,:),u(2,:)))
title('Energi')
xlabel('Tid')
ylabel('Energi')
end