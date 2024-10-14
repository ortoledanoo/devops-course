#Reviewed By Linor
def in_global(user_input):
    if user_input in globals():
        return True

user_input = input("Please Enter Name - ")
if(in_global(user_input)):
    print("Yes!")
else:
    print("No!")