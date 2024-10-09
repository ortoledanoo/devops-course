#Reviewed By Khaled

def SumDivisors(user_number):
    divisors_sum = 0
    for i in range(1, user_number + 1):
        if user_number % i == 0:
            divisors_sum += i
    return divisors_sum

user_number = int(input("Please Enter a Number - "))
print(SumDivisors(user_number))