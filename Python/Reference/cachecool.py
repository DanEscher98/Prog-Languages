#! /usr/bin/python3

from functools import lru_cache

@lru_cache(maxsize=5)
def fib(n):
    if n<=1:
        return n
    return fib(n-1)+fib(n-2)

if __name__=='__main__':
    for i in range(400):
        print("{}  {}".format(i, fib(i)))
