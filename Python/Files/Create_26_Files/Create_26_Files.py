import string
#Approved By Jonathan
for i in range(26):
    letter = string.ascii_uppercase[i]
    with open("/home/ortoledano/Desktop/Ubuntu-infinity/Python/Files/"+letter+".txt", "w") as file:
        file.write(letter)
