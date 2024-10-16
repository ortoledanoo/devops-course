#Reviewed By Khaled

def celsius_to_fahrenheit(celsius):
    """Convert Celsius To Fahrenheit"""
    fahrenheit = float((celsius * 1.8) + 32)
    return fahrenheit

user_input = int(input("Please Enter Temperature in C - "))
print(celsius_to_fahrenheit(user_input))
