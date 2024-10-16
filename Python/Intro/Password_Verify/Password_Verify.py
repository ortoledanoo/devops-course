import re #re.search

#Reviewed By Khaled
def password_verify(password):
    """This Function Gets Password And Checks The Following Rules:
    1. Length > 8
    2. No Space
    3. Contains UpperCase [A-Z]
    4. Contains LowerCase [a-z]
    5. Contains Special Character
    6. Contains digit [0-9]
    Return True if Passed and False if Failed"""

    if len(password) < 8:
        return False
    elif re.search(" ", password):
        return False
    elif not re.search("[A-Z]", password):
        return False
    elif not re.search("[a-z]", password):
        return False
    elif not re.search("[@#$%&]" , password):
        return False
    elif not re.search("[0-9]" , password):
        return False

    return True

user_input = input("Please Enter a Password - ")
if password_verify(user_input):
    print("Password Verified")
else:
    print("Bad Password")




