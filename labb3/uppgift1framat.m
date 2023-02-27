clear
N = 500000;
h = 0.001;
pos = zeros(2,N);
has = zeros(2,N);

%startvärden
a = 0.5;
pos(1,1) = 1-a;
pos(2,1) =0;
has(1,1) = 0;
has(2,1) = ((1+a)/(1-a))^0.5;

for n =1:N
    %hastighet
    has(:,n+1) = has(:,n) + h * (acceleration(pos(:,n)));
    %position
    pos(:,n+1) = pos(:,n) + h * has(:,n);
end 

plot(pos(1,:),pos(2,:))
title('framåt Euler')
xlabel('pos1(t)')
ylabel('pos2(t)')



f=@(has,pos)  1/2*(has(1).^2+has(2).^2)-1./sqrt(pos(1).^2+pos(2).^2);

energi = zeros(1,N);
for n = 1:N
    energi(1,n) = (f(has(:,n),pos(:,n)));
end

t= h:h:n*h;

figure
plot(t, energi)
title('Energi')
xlabel('Tid')
ylabel('Energi')
