#Reviewed By Khaled

def count_char(input_string, char_to_count):
    """Returns How Many Times Char in String"""
    count = 0
    for i in input_string:
        if i == char_to_count:
            count+=1
    return count

user_string = input("Please Enter String")
char_to_check = input("Please Enter Char")
print(count_char(user_string, char_to_check))


