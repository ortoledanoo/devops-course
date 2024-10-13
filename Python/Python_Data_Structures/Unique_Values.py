#Reviewed By Daniel
def UniqueValues(dictionary):
    return list(set(dictionary.values()))
#Convert To Set and Then To List (Set Saves Only Unique!)

dictionary = {'a': 1, 'b': 2, 'c': 1, 'd': 3}
print(UniqueValues(dictionary))