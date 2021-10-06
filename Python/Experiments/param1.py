import numpy as np
import matplotlib.pyplot as plt
from matplotlib.widgets import Slider


plt.subplots_adjust(bottom=0.25)
t = np.arange(0.0, 2*np.pi, 0.001)

a = 2   
b = 0 
r = np.cos(a*(t + b))
x = r*np.cos(t)
y = r*np.sin(t)


l, = plt.plot(x,y, lw=4, color='black')
plt.axis([-3, 3, -3, 3])

axcolor = '#0f0f0f'
axb  = plt.axes([0.25, 0.10, 0.65, 0.03], facecolor=axcolor)
axa = plt.axes([0.25, 0.15, 0.65, 0.03], facecolor=axcolor)

sa = Slider(axa, 'a', 0, 10, valinit=a)
sb = Slider(axb, 'b', -np.pi, np.pi, valinit=b)

def update(val):
    a = (sa.val)     
    b = sb.val
 
    
    r = np.cos(a*(t + b))
    x = r*np.cos(t)
    y = r*np.sin(t)

    l.set_ydata(y)
    l.set_xdata(x)    
    fig.canvas.draw_idle()
    
sa.on_changed(update)
sb.on_changed(update)
plt.title('r = cos(a(t + b))')

plt.show()