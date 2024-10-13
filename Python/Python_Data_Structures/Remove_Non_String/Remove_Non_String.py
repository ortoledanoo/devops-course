#Reviewed By Daniel
def remove_non_string(list):
    return [i for i in list if isinstance(i, str)]
#isinstance - Check if Object is in [str]

input_list = [24, 'Toledano',{'a': 1}, 3.14, 'Pi', False]
print(remove_non_string(input_list))
