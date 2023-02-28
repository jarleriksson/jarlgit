clear
% Initialisering av variabler
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

% Huvudloop för simuleringen
for n =1:N
    % Beräkna nästa hastighetsvektor med hjälp av accelerationen
    has(:,n+1) = has(:,n) + h * (acceleration(pos(:,n)));
    % position
    pos(:,n+1) = pos(:,n) + h * has(:,n);
end 

% Rita ut banan i en 2D-plot
plot(pos(1,:),pos(2,:))
title('framåt Euler')
xlabel('pos1(t)')
ylabel('pos2(t)')

% Beräkna energin i systemet och plotta energin över tid
energi = zeros(1,N);
f=@(has,pos)  1/2*(has(1).^2+has(2).^2)-1./sqrt(pos(1).^2+pos(2).^2);
for n = 1:N
    energi(1,n) = (f(has(:,n),pos(:,n)));
end


t= h:h:n*h;

figure
plot(t, energi)
title('Energi')
xlabel('Tid')
ylabel('Energi')
