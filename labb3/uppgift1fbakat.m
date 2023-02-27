clear
N = 350000;
h = 0.0005;
pos = zeros(2,N);
has = zeros(2,N);

%startvärden
a = 0.5;
pos(1,1) = 1-a;
pos(2,1) =0;
has(1,1) = 0; 
has(2,1) = ((1+a)/(1-a))^0.5;

for n =1:N-1
    %hastighet
    data = fixpunktsmetoden(pos(:,n),has(:,n), h);
    has(:,n+1) =  has(:,n) + h* [data(1),data(2)]';

    pos(:,n+1) = pos(:,n) + h*has(:,n+1);

    %position
end 

plot(pos(1,:),pos(2,:))
title('bakåt Euler')
xlabel('pos1(t)')
ylabel('pos2(t)')
grid on


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
