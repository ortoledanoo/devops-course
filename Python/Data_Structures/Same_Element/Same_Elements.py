#Reviewed By Daniel
def same_elements(first_list, second_list):
    """Gets 2 Lists and Return List With Same Elements"""
    return [item for item in first_list if item in second_list]


list1 = [1, 2, 3, 4, 9]
list2 = [3, 4, 5, 9, 6]
print(same_elements(list1, list2))