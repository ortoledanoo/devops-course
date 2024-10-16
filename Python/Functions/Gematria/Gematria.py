#Reviewed By Joni

hebrew_gematria = {
    'א': 1,
    'ב': 2,
    'ג': 3,
    'ד': 4,
    'ה': 5,
    'ו': 6,
    'ז': 7,
    'ח': 8,
    'ט': 9,
    'י': 10,
    'ך': 20,
    'כ': 20,
    'ל': 30,
    'מ': 40,
    'ם': 40,
    'ן': 50,
    'נ': 50,
    'ס': 60,
    'ע': 70,
    'ף': 80,
    'פ': 80,
    'ץ': 90,
    'צ': 90,
    'ק': 100,
    'ר': 200,
    'שׁ': 300,
    'שׂ': 300,
    'ש': 300,
    'ת': 400,
    'בּ': 2
}


def gematria(hebrew_string):
    """Gets String in Hebrew and Converts To The Gematria Value from hebrew_gematria Dictionary"""
    # Short Way
    return sum([hebrew_gematria.get(char, 0) for char in hebrew_string])
    # Long Way
    #result = 0
    # for char in str:
    #    letter_value = hebrew_gematria.get(char, 0)  # 0 is OPTIONAL, Return if nothing found
    #    result += letter_value

print(gematria("שלום"))

