import numpy as np
import matplotlib.pyplot as plt
from matplotlib.widgets import Slider

plt.subplots_adjust(bottom=0.25)
t = np.arange(0.0, 2*np.pi, 0.001)

a = 1   
b = 1   
r = a + b*np.sin(t)
x = r*np.cos(t)
y = r*np.sin(t)


l, = plt.plot(x,y, lw=4, color='black')
plt.axis([-3, 3, -3, 3])

axcolor = 'lightgoldenrodyellow'
axb  = plt.axes([0.25, 0.10, 0.65, 0.03], facecolor=axcolor)
axa = plt.axes([0.25, 0.15, 0.65, 0.03], facecolor=axcolor)

sa = Slider(axa, 'a', 0, 2, valinit=a)
sb = Slider(axb, 'b', 0, 2, valinit=b)

def update(val):
    a = sa.val     
    b = sb.val   
    
    r = a + b*np.sin(t)
    x = r*np.cos(t)
    y = r*np.sin(t)
    
    l.set_ydata(y)
    l.set_xdata(x)    
    fig.canvas.draw_idle()
    
sa.on_changed(update)
sb.on_changed(update)
plt.title('r = a + b cos(t)')

plt.show()