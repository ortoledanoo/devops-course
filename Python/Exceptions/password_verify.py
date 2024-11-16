import re #re.search
#Reviewed By Avi

class PasswordTooShortError(Exception): pass
class PasswordContainsSpaceError(Exception): pass
class MissingUppercaseError(Exception): pass
class MissingLowercaseError(Exception): pass
class MissingSpecialCharacterError(Exception): pass
class MissingDigitError(Exception): pass

def password_verify(password):
    '''This Function Gets Password And Checks The Following Rules:
    1. Length > 8
    2. No Space
    3. Contains UpperCase [A-Z]
    4. Contains LowerCase [a-z]
    5. Contains Special Character
    6. Contains digit [0-9] '''
    passed = True

    if len(password) < 8:
        passed = False
        raise PasswordTooShortError("Password Too Short!")

    if re.search(" ", password):
        passed = False
        raise PasswordContainsSpaceError("Password Can't Contain Space!")

    if not re.search("[A-Z]", password):
        passed = False
        raise MissingUppercaseError("Password Must Contain UpperCase [A-Z]")

    if not re.search("[a-z]", password):
        passed = False
        raise MissingLowercaseError("Password Must Contain LowerCase [a-z]")

    if not re.search("[@#$%&]" , password):
        passed = False
        raise MissingSpecialCharacterError("Password Must Contain Special Character [@#$%&]")

    if not re.search("[0-9]" , password):
        passed = False
        raise MissingDigitError("Password Must Contain Digit [0-9]")

    return passed


user_input = input("Please Enter a Password - ")

try:
    if password_verify(user_input):
        print("Password is valid!")
except Exception as error:
    print(f"Error: {error}")


