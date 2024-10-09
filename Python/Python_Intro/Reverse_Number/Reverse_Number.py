def ReverseNumber(user_input):
    new_number = 0
    while user_input > 0:
        new_number = (new_number * 10) + (user_input % 10)
        user_input //= 10 #This // is Devide To get int and NOT Float
    return new_number

user_number = int(input("Please Enter Number - "))
print(ReverseNumber(user_number))
