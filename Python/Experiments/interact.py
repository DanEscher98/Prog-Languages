# Plot something
import matplotlib.pyplot as plt
import pickle
import pandas as pd

fig, ax = plt.subplots()
ax.plot([1,2,3],[10,-10,30])

pickle.dump(fig, open('FigureObject.fig.pickle', 'wb'))

figx = pickle.load(open('FigureObject.fig.pickle', 'rb'))
figx.show() # Show the figure, edit it, etc.!
object = pd.read_pickle(r'FigureObject.fig.pickle')
object.show()