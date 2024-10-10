def MoneyCounter(user_input):
    for change in [200, 100, 50, 20, 10, 5, 2, 1]:
        if int(user_input/change) != 0:
            print(f"{change} : {int(user_input/change)}")
        user_input %= change

user_input = int(input("Please Enter amount - "))
MoneyCounter(user_input)
