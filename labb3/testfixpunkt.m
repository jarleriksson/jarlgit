clear
q = [0.132704404815210,0.672268908128758];
p = [-1.13324447650245,0.803808661736571];
h = 0.005;

itr_max = 500000;
itr = 0;
tlr = 10^-10;
diff = 100;
test =[q(1),q(2),p(1),p(2)];
matris = zeros(itr_max,1);

while diff > tlr  &&  itr < itr_max
   acc = acceleration([test(1),test(2)]);
   v = test;
   test = [v(1) + h*test(3), v(2) + h*test(4), v(3) + h*acc(1), v(4) + h*acc(2)];
   
   diff = norm(v - test);
   itr = itr + 1;
   matris(itr) = diff;


end

plot(matris)
