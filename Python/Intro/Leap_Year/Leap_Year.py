#Reviewed By Khaled

def leap_year(year):
    """Gets Year and Return True if Leap Year or False if Not"""
    if (year % 4 == 0 and year % 100 != 0) or ( year % 100 == 0 and year % 400 == 0):
        return True
    else :
        return False

user_input = int(input("Please Enter a Year - "))
if leap_year(user_input):
    print(f"{user_input} is Leap Year")
else:
    print(f"{user_input} is NOT Leap Year")
