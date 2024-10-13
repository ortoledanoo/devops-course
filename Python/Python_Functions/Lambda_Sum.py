from functools import reduce

def add(list):
    return reduce(lambda a, b: a+b, list)

list = [1,2,3,4,5]
print(add(list))

