from ctypes import *
so_file = "file.so"
my_function = CDLL(so_file)

print(type(my_function))
print(my_function.square(10))
print(my_function.square(4))