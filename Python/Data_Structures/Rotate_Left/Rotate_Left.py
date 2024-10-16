#Reviewed By Daniel
def rotate_left(list_function, N):
    """Gets List and N and Rotate The List Usine Slice N Times"""
    return list_function[N:] + list_function[:N]
#N: = From N to END
#:N = From Start To N

list = [1, 2, 3, 4, 5]
print(rotate_left(list, 3))
