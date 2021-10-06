from multimethod import multimethod
from typing import *


class Dog:
    def __init__(self, name, lastname):
        self.name = name
        self.lstn = lastname
    def __str__(self):
        return self.name

class Cat:
    def __init__(self, name, lastname):
        self.name = name
        self.lstn = lastname
    def __str__(self):
        return self.name
    

@multimethod 
def fun(x: Dog):
    print("He is: ", x.name)
    
@multimethod 
def fun(x: Cat):
    print("She is: ", x.name)

@multimethod
def __sum__(x: Cat, y: Dog):
    print("They are friends")