def loop(n):
    aux = n
    while True:
        print(f"n: {n}, aux: {aux}")
        n = aux
        if n == 0:
            break
        if n < 0:
            aux += 1
            n = aux
        else:
            aux -= 1
            n = aux
