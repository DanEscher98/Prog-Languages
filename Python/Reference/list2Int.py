import numpy

def list2Int(aList):
    for e in range(len(aList)):
        if isinstance(aList[e], list):
            aList[e] = list2Int(aList[e])
        else:
            aList[e] = int(float(aList[e]))
    return aList

def getMatrix():
    dim = list2Int(input("Set rows and columns for Matrix: ").split(" "))
    N = range(dim[0])
    M = range(dim[1])
    Matrix = numpy.array([[0 for i in M] for j in N])
    for i in N:
        line = list2Int(input(f'Set values for row {i+1}: ').split(" "))
        for j in M:
            if (j<len(line)):
                Matrix[i][j] = line[j]
            else:
                Matrix[i][j] = 0
    return Matrix

def getND_Matrix(dim):
    N = range(dim[0])
    if(len(dim)==1):
        return [0 for i in N]
    else:
        return numpy.array([getND_Matrix(dim[1:]) for i in N])

if __name__=='__main__':
    m = getMatrix()
    print("The original Matrix:\n", m)
    print("The Transpose:\n", numpy.transpose(m))
    print("The Flatten Matrix:\n", m.flatten())
    print(getND_Matrix([2, 3, 4]))
