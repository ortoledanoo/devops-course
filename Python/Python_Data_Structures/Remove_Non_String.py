#Reviewed By Daniel
def RemoveNonString(list):
    return [i for i in list if isinstance(i, str)]
#isinstance - Check if Object is in [str]

input_list = [24, 'Toledano',{'a': 1}, 3.14, 'Pi', False]
print(RemoveNonString(input_list))
