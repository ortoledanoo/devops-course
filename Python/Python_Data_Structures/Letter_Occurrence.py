#Reviewed By Daniel
def LetterOccurrences(string):
    occurrences = {}
    for char in string:
        occurrences[char] = occurrences.get(char, 0) + 1
    return occurrences

user_input = input("Please Enter a String - ")
print(LetterOccurrences(user_input))