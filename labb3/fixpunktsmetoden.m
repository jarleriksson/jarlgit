function acc = fixpunktsmetoden(q, p, h)
    g = @(q,p,acc,h) [q(1)+ h*p(1),q(2)+ h*p(2), p(1)+ h*acc(1), p(2)+ h*acc(2)];    % Anonym funktion för g(x), alternativ 1
 
    
    x = [q(1),q(2),p(1), p(2)];             % Startgissning
    tol = 1e-10;                             % Tolerans
    
    diffx = 1; iter = 0; maxiter = 100;
    format compact, format longg
    
    while diffx > tol && iter < maxiter
        iter = iter + 1;     % Antal iterationer - n
        acc = acceleration([x(1), x(2)]); 
        xnew = g(q, p, acc, h);     % Uppdatering med fixpunkt
        diffx = norm(xnew-x);        % |x(n+1)-x(n)|
        x = xnew;
        %disp([iter xnew diffx]);
    end
    if iter == maxiter
        disp('Varning! Maximalt antal iterationer nått')
    end