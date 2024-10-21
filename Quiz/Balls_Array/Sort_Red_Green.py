def sort_red_green(arr_balls):
# Reviewed By Jonatan
    """Sorts Array Of 'red' 'green' and more, Saves 'green' at Start and 'red' at the End"""
    size = len(arr_balls)
    left_i = 0
    right_i = size - 1
    i = 0

    while i <= right_i: #To Avoid Run On Swapped Red Balls
        if arr_balls[i] == 'green':
            arr_balls[left_i], arr_balls[i] = arr_balls[i], arr_balls[left_i]
            left_i += 1
            i += 1
        elif arr_balls[i] == 'red':
            arr_balls[right_i], arr_balls[i] = arr_balls[i], arr_balls[right_i]
            right_i -= 1
            #NOT increase i at Default Because Need To Check Swapped Ball From The End!
        else:
            i += 1


arr_balls = ['green', 'yellow', 'yellow', 'red', 'green', 'red']

print(arr_balls)
sort_red_green(arr_balls)
print(arr_balls)