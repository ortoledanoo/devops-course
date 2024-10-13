#Reviewed By Daniel
def RotateLeft(list, N):
    return list[N:] + list[:N]
#N: = From N to END
#:N = From Start To N

list = [1, 2, 3, 4, 5]
print(RotateLeft(list, 3))