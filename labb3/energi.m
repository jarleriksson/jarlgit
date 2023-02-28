 
function energi(u,h,s)
figure
f=@(has1,has2,pos1,pos2)   1/2*(has1.^2+has2.^2)-1./sqrt(pos1.^2+pos2.^2);

% Tidsspann
t= h:h:s*h;
% Plotta
plot(t,f(u(3,:),u(4,:),u(1,:),u(2,:)))
title('Energi')
xlabel('Tid')
ylabel('Energi')
end