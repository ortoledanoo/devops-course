#Reviewed By Hilell

def pangram(user_input):
    user_input = user_input.lower()
    user_input = set(user_input)

    abc = "abcdefghijklmnopqrstuvwxyz"

    for letter in abc:
        if letter not in user_input:
            return False

    return True

if __name__ == "__main__":
    print(pangram("The quick brown fox jumps over the lazy dog"))