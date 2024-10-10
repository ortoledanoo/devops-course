#Reviewed By Khaled
def IsPrime(user_number):
    if user_number > 1:
        for i in range(2, (user_number // 2) + 1):

            if (user_number % i) == 0:
                print(user_number, "is not a prime number")
                break
        else:
            print(user_number, "is a prime number")
    else:
        print(user_number, "is not a prime number")

user_number = int(input("Please Enter a Number - "))
IsPrime(user_number)