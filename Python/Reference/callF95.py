from ctypes import CDLL, POINTER, c_int, c_float
import numpy as np
import time

fortran = CDLL('/home/dany98/Desktop/Coding/Compiled/elementwise.so')
fortran.elementwise.argtypes = [ POINTER(c_float), 
                                 POINTER(c_float), 
                                 POINTER(c_float),
                                 POINTER(c_int),
                                 POINTER(c_int) ]

# Setup    
M=10
N=5000000

a = np.empty((M,N), dtype=c_float)
b = np.empty((M,N), dtype=c_float)
c = np.empty((M,N), dtype=c_float)

a[:] = np.random.rand(M,N)
b[:] = np.random.rand(M,N)


# Fortran call
start = time.time()
fortran.elementwise( a.ctypes.data_as(POINTER(c_float)), 
                     b.ctypes.data_as(POINTER(c_float)), 
                     c.ctypes.data_as(POINTER(c_float)), 
                     c_int(M), c_int(N) )
stop = time.time()
print('Fortran took ',stop - start,'seconds')

# Numpy
start = time.time()
c = np.multiply(a,b)
stop = time.time()
print('Numpy took ',stop - start,'seconds')
