def CountChar(string, char):
    count = 0
    for i in string:
        if i == char:
            count+=1
    return count

string = input("Please Enter String")
char = input("Please Enter Char")
print(CountChar(string, char))
