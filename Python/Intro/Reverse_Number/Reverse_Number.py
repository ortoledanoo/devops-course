#Reviewed By Khaled

def reverse_number(number):
    """Gets Number (int) And Returns The Reversed Num (example: in-123 out-321)"""
    new_number = 0
    while number > 0:
        new_number = (new_number * 10) + (number % 10)
        number //= 10 #This // is Devide To get int and NOT Float
    return new_number

user_number = int(input("Please Enter Number - "))
print(reverse_number(user_number))


