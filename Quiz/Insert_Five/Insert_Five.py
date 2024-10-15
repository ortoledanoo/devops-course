#Approved By Jonathan
def insert_five(user_input):
    list_input = [x for x in user_input]
    is_changed = False
    for i in range(len(list_input)):
        if list_input[i] < '5' and list_input[i] != '.':
            list_input[i] = '5'
            is_changed = True
            break

    if not is_changed:
        list_input[len(list_input) -1] = '5'

    result = "".join(list_input) #join = Connects List of Strings
    return result

user_input = input("Enter a Number - ")
print(insert_five(user_input))

