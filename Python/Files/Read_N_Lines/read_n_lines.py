file_name = input("Please Enter File Name - ")
num_lines = int(input("Enter Num Lines - "))

with open("/home/ortoledano/Desktop/Ubuntu-infinity/Python/Files/"+file_name, "r") as file:
    content = file.readlines()[0:num_lines]
    for i in content:
        print(i)
