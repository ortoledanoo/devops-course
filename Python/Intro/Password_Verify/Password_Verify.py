import re #re.search

#Reviewed By Khaled
def password_verify(user_input):
    passed = True

    if (len(user_input) < 8):
        passed = False
    elif re.search(" ", user_input):
        passed = False
    elif not re.search("[A-Z]", user_input):
        passed = False
    elif not re.search("[a-z]", user_input):
        passed = False
    elif not re.search("[@#$%&]" , user_input):
        passed = False
    elif not re.search("[0-9]" , user_input):
        passed = False

    if passed:
        print("Password Verified")
    else:
        print("Password FAILED")

user_input = input("Please Enter a Password - ")
password_verify(user_input)

