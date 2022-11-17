
t0 = 0; % starttid
tend = 100; % sluttid
N = 100000; % antal steg
h = (tend-t0)/N; % steglängd

xfn+1 = 5 * h + xf;

f = @(t,x) speed1(x); % y'(t) = f(t,x)

