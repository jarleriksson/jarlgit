function v = speed1(x, vmax)
v = max(min(vmax, abs(x/3)),0);
