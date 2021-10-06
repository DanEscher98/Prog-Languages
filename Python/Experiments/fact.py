from pyDatalog import pyDatalog

pyDatalog.create_terms('factorial, N')
factorial[N] = 1
factorial[N] = N*factorial[N-1]


def fact(n):
    return 1 if (n<=1) else n*fact(n-1)

ans = factorial[3]==N

for i in ans:
    print(i[0]+1)
print(ans)
print(fact(4))
