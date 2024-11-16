#Reviewed By Khaled
def sum_divisors(number):
    """Gets Number and Returns Sum of Divisors"""
    sum_of_divisors = 0
    for i in range(1, number + 1):
        if number % i == 0:
            sum_of_divisors += i
    return sum_of_divisors

user_number = int(input("Please Enter a Number - "))
print(sum_divisors(user_number))
