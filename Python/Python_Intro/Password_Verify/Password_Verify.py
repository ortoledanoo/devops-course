import re #re.search
user_input = input("Please Enter a Password - ")
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
else:
    print("Password FAILED")