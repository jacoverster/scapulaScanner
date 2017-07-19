y = GRADmx(i,(PEAK(3)-2):(PEAK(3)+2));
x = (PEAK(3)-2):1:(PEAK(3)+2);

f = fit(x',y','poly3');
x2 = PEAK(3)-2:0.01:PEAK(3)+2;
plot(f(x2))

[y,x_loc]=max(f(x2));
x2(x_loc)