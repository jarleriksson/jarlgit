



function acc = fixpunktsmetoden(pos, has, h)
    g = @(pos,has,acc,h) [pos(1)+ h*has(1),pos(2)+ h*has(2), has(1)+ h*acc(1), has(2)+ h*acc(2)];    % Anonym funktion för g(x), alternativ 1
 
    
    x = [pos(1),pos(2),has(1), has(2)];             % Startgissning
    tol = 1e-10;                             % Tolerans
    
    diffx = 1; iter = 0; maxiter = 100;
    format compact, format longg
    
    while diffx > tol && iter < maxiter
        iter = iter + 1;     % Antal iterationer - n
        acc = acceleration([x(1), x(2)]); 
        xnew = g(pos, has, acc, h);     % Uppdatering med fixpunkt
        diffx = norm(xnew-x);        % |x(n+1)-x(n)|
        x = xnew;
        %disp([iter xnew diffx]);
    end
    if iter == maxiter
        disp('Varning! Maximalt antal iterationer nått')
    end
