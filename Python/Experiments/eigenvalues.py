#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon May 10 21:42:08 2021

@author: dany98
"""

from sympy import *
from IPython.display import display
init_printing(use_latex='mathjax')

A = Matrix([[1, 8], [-3, 3]])
λ = Symbol('λ')
x = Symbol('x')
y = Symbol('y')
eigenvalues = solve(det(A - λ*eye(2)), λ)

variables = Matrix([x, y])

val = eigenvalues[0]
system = A*variables - val*variables
ans1 = solve([system[i] for i in range(len(system))], variables)


for val in eigenvalues:
    system = A*variables - val*variables
    print(solve([system[i] for i in range(len(system))], variables))


 