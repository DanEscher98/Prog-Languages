from ctypes import *
so_file = "/home/dany98/Desktop/Coding/Compiled/funk.so"
functions = CDLL(so_file)

print(type(functions))
print(functions.square(3))
print("Done")