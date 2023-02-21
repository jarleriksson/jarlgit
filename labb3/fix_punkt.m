function acc = fix_punkt(q, p, h)
    itr_max = 50;
    itr = 0;
    tlr = 10^-10;
    diff = 100;
    test =[q(1),q(2),p(1),p(2)];

    while diff > tlr  && itr < itr_max
       acc = acceleration([test(1),test(2)]);
       v = test;
       test = [v(1) + h*test(3), v(2) + h*test(4), v(3) + h*acc(1), v(4) + h*acc(2)];
       
       diff = norm(v - test);
       itr = itr + 1;

    end

end