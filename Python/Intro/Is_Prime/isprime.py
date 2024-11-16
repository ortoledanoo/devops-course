#Reviewed By Khaled
def is_prime(number):
    """Gets Number and Return True if Prime Or False if Not"""
    if number > 1:
        for i in range(2, (number // 2) + 1):
            if (number % i) == 0:
                return False
        else:
            return True
    else:
        return False

user_number = int(input("Please Enter a Number - "))
if is_prime(user_number):
    print(f"{user_number} is Prime Number")
else:
    print(f"{user_number} is NOT Prime Number")

