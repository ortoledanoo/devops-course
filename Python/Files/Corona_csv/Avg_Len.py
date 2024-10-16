import csv
file_name = "/home/ortoledano/Desktop/Ubuntu-infinity/corona.csv"
with open(file_name, "r") as file:
    content = list(csv.reader(file))

    len_hospitlization = [line[4] for line in content]
    len_hospitlization.remove("Length_of_hospitalization")
    int_len_hospitlization = [int(x) for x in len_hospitlization]
    avg_len_hospitlization = sum(int_len_hospitlization) / len(len_hospitlization)
    print(avg_len_hospitlization)

with open(file_name, "r") as file:
    content = list(csv.reader(file))


