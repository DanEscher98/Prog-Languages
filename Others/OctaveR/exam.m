u: 2:2:18;
u(1:3);
u(2:2:6);
u.*3

f = @(x, y) 2*x.^2*y.^-2+2*y
ymax = @(x) x
ans = integral2(f, 1, 2, 1, ymax)


population = @(x) 19727300/(1+e^(0.3134*(x-1913.25)))

t = 1790:10:2000

plot(population, t)
title('Plobacion USA')
xlabel('Año')
ylabel('n, habitantes')
