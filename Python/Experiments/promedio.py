import numpy as np

def obtener_vector():
    n = int(input("Tamaño del vector: "))
    vec = np.array([])
    for i in range(n):
        value = int(input(f'Valor [{i}]: '))
        vec = np.append(vec, value)
    return vec

def promedio(vec):
    prom = np.sum(vec) / len(vec)
    return prom
    
def clasifica(vec, value):
    for v in vec:
        parity  = "par" if v%2 == 0 else "non"
        if v > value:
            comp = "mayor"
        elif v < value:
            comp = "menor"
        else:
            comp = "igual"
        print(f'{v} es {parity} y es {comp} que {value}')

if __name__ == '__main__':
    v = obtener_vector()
    clasifica(v, promedio(v))
