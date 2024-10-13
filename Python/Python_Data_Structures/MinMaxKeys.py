#Reviewed By Daniel
def min_max_keys(dictionary):
    max_key = max(dictionary, key=dictionary.get)
    min_key = min(dictionary, key=dictionary.get)
    return min_key, max_key
#key=dictionary.get - Returns The Value (Tells max() to Find The Max Value)

dictionary = {'Or': 24, 'Amit': 20, 'Noam': 16}
min_key, max_key = min_max_keys(dictionary)
print(f'Maximum is - {max_key}')
print(f'Minimum is - {min_key}')