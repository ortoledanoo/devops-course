#Reviewed By Khaled
def MoneyBreak(user_number):
    while user_number >= 0:
        if user_number % 200 != user_number:
            print("200")
            user_number -= 200
            continue
        if user_number % 100 != user_number:
            print("100")
            user_number -= 100
            continue
        if user_number % 50 != user_number:
            print("50")
            user_number -= 50
            continue
        if user_number % 20 != user_number:
            print("20")
            user_number -= 20
            continue
        if user_number % 10 != user_number:
            print("10")
            user_number -= 10
            continue
        if user_number % 5 != user_number:
            print("5")
            user_number -= 5
            continue
        if user_number % 2 != user_number:
            print("2")
            user_number -= 2
            continue
        if user_number % 1 != user_number:
            print("1")
            user_number -= 1
            continue
    return 1

user_number = int(input("Please Enter Ammount - "))
print(MoneyBreak(user_number))
