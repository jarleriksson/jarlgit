function v = speed(x, d, vmax)
v = max(min(vmax, (x/d)*vmax), 0);

