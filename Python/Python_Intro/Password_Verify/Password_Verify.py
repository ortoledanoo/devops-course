import re #re.search

#Reviewed By Khaled
def PasswordVerify(user_input):
    flag = 0
    if (len(user_input) < 8):
        flag = 1
    elif re.search(" ", user_input):
        flag = 1
    elif not re.search("[A-Z]", user_input):
        flag = 1
    elif not re.search("[a-z]", user_input):
        flag = 1
    elif not re.search("[@#$%&]" , user_input):
        flag = 1
    elif not re.search("[0-9]" , user_input):
        flag = 1

    if flag == 0:
        print("Password Verified")
        return 0
    else:
        print("Password FAILED")
        return 1

user_input = input("Please Enter a Password - ")
PasswordVerify(user_input)