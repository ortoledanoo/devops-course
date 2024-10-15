from functools import reduce

def Insert_Five(user_input):
    list_input = [int(x) for x in user_input]

    for i in range(len(list_input)):
        if list_input [i] < 5:
            list_input[i] = 5
            break

    result = reduce(lambda a, b: a * 10 + b, list_input)
    return result

user_input = input("Enter a Number - ")
print(Insert_Five(user_input))
