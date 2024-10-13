#Reviewed By Daniel
def SameElements(list1, list2):
    return [item for item in list1 if item in list2]


list1 = [1, 2, 3, 4, 9]
list2 = [3, 4, 5, 9, 6]
print(SameElements(list1, list2))