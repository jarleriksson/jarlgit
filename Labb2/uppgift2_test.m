clearvars -except siffror
clearpoints
hold on

X = [0; 0.5; 1; 1.5; 2; 2.99; 3];
Y = [0; 0.52; 1.09; 1.75; 2.45; 3.5; 4];
siffror = [X Y];

scatter(siffror(:,1), siffror(:,2))

n = 2;

[p, F] = mk(siffror(:,1), siffror(:,2), n);
ta_bort = 1;
fel_matris = zeros(length(siffror),1);
while ta_bort <= length(siffror)
    [p_new, F_new] = mk(siffror(not(siffror(:,1)==siffror(ta_bort,1)), 1), siffror(not(siffror(:,1)==siffror(ta_bort,1)), 2), n);
    fel_matris(ta_bort, 1) = F_new;
    ta_bort = ta_bort + 1;
end

i = 1;
fel = [];
while i < length(fel_matris)
    if fel_matris(i, 1) < F
        fel(end+1, 1) = i;
    end
    i = i + 1;
end

h = length(fel);
while h > 0
    % siffror(fel(h), :) = [];
    h = h - 1;
end

% scatter(siffror(fel,1), siffror(fel,2))


disp(siffror(not(siffror(2, 1)), 1));

% disp(ischange(siffror))

x = linspace(min(siffror(:,1)),max(siffror(:,1)));
plot(x, polyval(p,x));
legend('Mätvärden', 'Polynom')
% fplot(@(x) p(4) + p(3)*x+ p(2)*(x .^2)+p(1)*(x.^3));
% disp(polyval(p,x));
