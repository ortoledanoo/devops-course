def convert_roman(user_string):
    total = 0
    convert = {'I': 1, 'V': 5, 'X':10, 'L': 50, 'C': 100, 'D': 500, 'M': 1000}
    string_list = [i.upper() for i in user_string]

    for i in range(len(user_string)):

        if i + 1 < len(string_list) and convert[string_list[i]] < convert[string_list[i+1]]:
            total -= convert.get(string_list[i])

        else:
            total += convert.get(string_list[i])

    return total