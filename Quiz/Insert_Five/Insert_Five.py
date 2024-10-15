#Approved By Jonathan
def insert_five(user_input):
    list_input = [x for x in user_input]
    changed = False
    for i in range(len(list_input)):
        if list_input[i] < '5' and list_input[i] != '.':
            list_input[i] = '5'
            changed = True
            break

    if not changed:
        list_input[len(list_input) -1] = '5'

    result = "".join(list_input) #join = Connects List of Strings
    return result

user_input = input("Enter a Number - ")
print(insert_five(user_input))

