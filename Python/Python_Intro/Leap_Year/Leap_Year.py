def LeapYear(user_input):
    if (user_input % 4 == 0 and user_input % 100 != 0) or ( user_input % 100 == 0 and user_input % 400 == 0):
        return "Yes"
    else :
        return "No"
user_number = int(input("Please Enter a Year - "))
print(LeapYear(user_number))
