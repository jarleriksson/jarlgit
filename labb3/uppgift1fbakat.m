clear
% Initialisering av variabler
N = 350000; % Antal steg i simuleringen
h = 0.0005; % Tidssteget
pos = zeros(2,N); % Matris för position
has = zeros(2,N); % Matris för hastighet

%startvärden
a = 0.5;
pos(1,1) = 1-a;
pos(2,1) =0;
has(1,1) = 0; 
has(2,1) = ((1+a)/(1-a))^0.5;

% Huvudloop för simuleringen
for n =1:N-1
    % Beräkna nästa hastighetsvektor med hjälp av fixpunktsmetoden
    data = fixpunktsmetoden(pos(:,n),has(:,n), h);
    has(:,n+1) =  has(:,n) + h* [data(1),data(2)]';
    % Beräkna nästa positionsvektor
    pos(:,n+1) = pos(:,n) + h*has(:,n+1);
end 


% Rita ut banan i en 2D-plot
plot(pos(1,:),pos(2,:))
title('bakåt Euler')
xlabel('pos1(t)')
ylabel('pos2(t)')
grid on


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
