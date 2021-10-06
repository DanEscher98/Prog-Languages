from mpl_toolkits.mplot3d import axes3d
import matplotlib.pyplot as plt
import numpy as np
import decimal

fig = plt.figure()
ax = fig.gca(projection='3d')

def frange(start, final, interval):
    d = decimal.Decimal(str(interval))
    r = abs(d.as_tuple().exponent)
    num = []
    while start<final:
        num.append(start)
        start += interval
    #num.append(final)
    num = np.array([round(x, r) for x in num])
    for i in range(0, len(num)):
        if (num[i]==0):num[i]=0
        elif((num[i])/(int(num[i]))==1): 
            num[i]=int(num[i])
    return num

x, y, z = np.meshgrid(frange(-1, 1, 0.4),
                      frange(-1, 1, 0.4),
                      frange(-1, 1, 0.4))

u = 3*x**2
v = 2*x*y**3
w = 5*x*z**2

ax.quiver(x, y, z, u, v, w, length=0.1, color = 'black')

for angle in range(0, 360):
    ax.view_init(30, angle)
    plt.draw()
    plt.pause(.001)

plt.show()