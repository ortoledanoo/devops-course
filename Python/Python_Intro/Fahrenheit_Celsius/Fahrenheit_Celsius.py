def Temperature(user_input):
    fahrenheit = float((user_input * 1.8) + 32)
    return fahrenheit

user_number = int(input("Please Enter Temperature in C - "))
print(Temperature(user_number))
