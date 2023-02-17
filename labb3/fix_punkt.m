function acc = fix_punkt(q, p, h)
itr_max = 2;
itr = 0;
tlr = 10^-6;
diff = 100;
test =[q(1),q(2),p(1),p(2)];

while diff > tlr  && itr < itr_max
   acc = acceleration([test(1),test(2)]);
   v = test;
   test = [q(1) + h*test(3), q(2) + h*test(4), p(1) + h*acc(1), p(2)+ h*acc(2)];
   
   diff = norm(v - test);
   itr = itr+1;

end
