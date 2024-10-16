#Reviewed By Daniel
def min_max_keys(dictionary_function):
    """Function Gets Dictionary and Returns The Max Value Key and Min Value Key"""
    # key=dictionary.get - Returns The Value (Tells max() to Find The Max Value)
    key_min = max(dictionary_function, key=dictionary_function.get)
    key_max = min(dictionary_function, key=dictionary_function.get)
    return key_max, key_min

dictionary = {'Or': 24, 'Amit': 20, 'Noam': 16}
min_key, max_key = min_max_keys(dictionary)
print(f'Maximum is - {max_key}')
print(f'Minimum is - {min_key}')



