def factorial(n):
    if(n==0):
        return 1
    else:
        return n*factorial(n-1)


if __name__=='__main__':
    val = factorial(int(input("Insert number:")))
    print(val)
