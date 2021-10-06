import threading
import time
import random

class myThread(threading.Thread):
    def __init__(self, threadID, name, counter):
        threading.Thread.__init__(self)
        self.threadID = threadID
        self.name = name
        self.counter = counter
    def run(self):
        print(f"Starting {self.name}")
        print_time(self.name, self.counter, 5)
        print(f"Exiting {self.name}")


def print_time(threadName, delay, counter):
    while counter:
        time.sleep((delay))
        print(f"{threadName}: {time.ctime(time.time())} {counter}")
        counter -= 1 

thread1 = myThread(1, "thread-a", 1)
thread2 = myThread(2, "thread-b", 1.5)

def threadsBlock(*args: myThread):
    for i in args: i.start()
    for i in args: i.join()

threadsBlock(thread1, thread2)
print("Finishing main thread")


ls = []
myThreads = []

def func(n):
    for i in range(n*random.randint(3, 5)):
        ls.append(i)
        time.sleep(random.random())

for i in range(3):
    myThreads.append(
        threading.Thread(target=func, args=(i,)))
    myThreads[i].start()

# The process will continue when all the threads
# conclude their tasks.
for i in myThreads: i.join()

print(ls)
