
# import sympy 
from sympy import * 
  
a = [0, 1, 2, 3, 4, 5, 6, 7, 8]
x = symbols('x')
contf = a[0]+1/x
for i in range(1, 4):
	contf = contf.subs(x, a[i]+1/x)
	print(contf)

print(contf.subs(1/x, 0))
	