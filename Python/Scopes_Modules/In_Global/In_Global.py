#Reviewed By Linor
def in_global(name):
    """Gets a Name and Checks if in globals()"""
    if name in globals():
        return True

user_input = input("Please Enter Name - ")
if in_global(user_input):
    print("Yes!")
else:
    print("No!")
