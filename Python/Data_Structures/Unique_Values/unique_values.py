#Reviewed By Daniel
def unique_values(dictionary_function):
    """Gets Dictionary and Convert To SET(To Sort Unique Values) and Then To List"""
    return list(set(dictionary_function.values()))
#Convert To Set and Then To List (Set Saves Only Unique!)

dictionary = {'a': 1, 'b': 2, 'c': 1, 'd': 3}
print(unique_values(dictionary))
