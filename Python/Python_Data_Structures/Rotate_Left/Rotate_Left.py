#Reviewed By Daniel
def rotate_left(list, N):
    return list[N:] + list[:N]
#N: = From N to END
#:N = From Start To N

list = [1, 2, 3, 4, 5]
print(rotate_left(list, 3))