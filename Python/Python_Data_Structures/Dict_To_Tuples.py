#Reviewed By Daniel
def DictionaryToTuples(dictionary):
    return list(dictionary.items())
#items() = Return Key-Values as Tuples

dictionary = {'Or': 24, 'Amit': 20, 'Noam': 16}
print(DictionaryToTuples(dictionary))