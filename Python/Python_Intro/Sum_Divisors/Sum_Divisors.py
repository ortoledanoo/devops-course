def SumDivisors(user_number):
    digits_sum = 0
    while user_number > 0:
        digits_sum += user_number % 10
        user_number = user_number // 10
    return digits_sum



user_number = int(input("Please Enter a Number - "))
print(SumDivisors(user_number))
