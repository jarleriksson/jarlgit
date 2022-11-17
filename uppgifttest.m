clc, clear

%start variablerna
M=10
h=1
g=5
d=75
tid=40
N=tid/h
x = zeros(M,N)

% för bilen M:s position i tidssteget N
for bil=1:M    
    x(bil,1) = d*(bil-1);
end

% för tidssteg 1 till N, sätt startvärdena för samtliga bilar
for steg=1:N
    x(M, steg+1)=x(M,steg)+ h*g
    % för varje bil från M-1 till 1, använd Euler metoden för att bestämma
    % positionen baserat på sin position steget innan och den
    % framförvarande bilens position i steget innan.
    for bil = M-1:-1:1
        x(bil, steg+1)=x(bil,steg)+h*hastighet(x(bil+1,steg)-x(bil,steg))
    end
end

% för varje bil plotta bilen 1 till M:s position
for bil= 1:M
    plot(x(bil,:))
    hold on
end
hold off

% funktion för hastigheten
function f = hastighet(x)
    d=75;
    Vm=25;
    if x >= d;
        f=Vm;
    else
        f=Vm*x/d;
    end
end