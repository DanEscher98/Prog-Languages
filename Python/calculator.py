import numpy as np

pi = np.pi
e = np.e

class Point:
    def __init__(self, x=0, y=0):
        self.x = x
        self.y = y

    def __str__(self):
        return "({0},{1})".format(self.x, self.y)

    def __add__(self, other):
        x = self.x + other.x
        y = self.y + other.y
        return Point(x, y)

class_list = dict() 
data = input('Enter coordinates: ') 
co = data.split(' ')
class_list['a'] = Point(float(co[0]), float(co[1]))

a = eval('Point(1, 2)')
print(type(a))
 
# Displaying the dictionary 
for key, value in class_list.items(): 
	print('Name: {}, Score: {}'.format(key, value)) 