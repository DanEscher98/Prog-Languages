def factores(n):
    ans = []
    for i in range(n):
        if(n%i == 0): ans.append(i)
    return ans

def perfecto(n):
    return (n == sum(factores(n)))

def abundante(n):
    return (n < sum(factores(n))) 

perfecto = (lambda n, )