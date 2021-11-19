from ctypes import *
import os
import math
import numpy as np

so_file = "/home/dany98/Desktop/Coding/Compiled/Librarys/numTrasc.so"
funks = CDLL(so_file)

def menu():
    print("1- fac(x)")
    print("2- pow(x, a)")
    print("3- exp(a)")
    print("4- ln(x)")
    print("5- log(x, a)")
    n = int(input("Choose one: "))
    a, b = Switcher().indirect(n)
    print("R1: {}\nR2: {}".format(a, b))

class Switcher(object):
    def indirect(self,i):
        method_name = 'op_'+str(i)
        method = getattr(self,method_name,lambda :'Invalid')
        return method()
    def op_1(self):
        x = int(input("Set x: "))
        r1 = math.factorial(x)
        r2 = funks.fac(x)
        return (r1, r2)
    def op_2(self):
        x = float(input("Set x: "))
        a = int(input("Set a: "))
        r1 = math.pow(x, a)
        r2 = funks.Npow(x, a)
        return (r1, r2)
    def op_3(self):
        x = float(input("Set x: "))
        r1 = math.exp(x)
        r2 = funks.Nexp(x)
        return (r1, r2)
    def op_4(self):
        x = float(input("Set x: "))
        r1 = np.log(x)
        r2 = funks.Nln(x)
        return (r1, r2)
    def op_5(self):
        x = float(input("Set x: "))
        a = float(input("Set a: "))
        r1 = np.log(x)/np.log(a)
        r2 = funks.log(x, a)
        return (r1, r2)

def initarg():
    print(type(funks))
    funks.fac.argtypes  = [c_int]
    funks.Npow.argtypes = [c_float, c_int]
    funks.Nexp.argtypes = [c_float]
    funks.Nln.argtypes  = [c_float]
    funks.Nlog.argtypes = [c_float, c_float]

if __name__ == '__main__':
    initarg()
    user = 1
    while(user == 1):
        os.system("clear")
        menu()
        user = int(input("Repeat program?: "))
    os.system("clear")