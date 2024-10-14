#Reviewed By Joni
from functools import reduce

def add(list):
    return reduce(lambda element_one, element_two: element_one + element_two, list)

list = [1,2,3,4,5]
print(add(list))

