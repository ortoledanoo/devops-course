def sum_digits(number):
    """Gets Number(int) and Returns The Sum of Digits"""
    digits_sum = 0
    while number > 0:
        digits_sum += number % 10
        number = number // 10
    return digits_sum



user_number = int(input("Please Enter a Number - "))
print(sum_digits(user_number))

