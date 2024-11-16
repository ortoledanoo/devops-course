import csv

file_name = "/home/ortoledano/Desktop/Ubuntu-infinity/corona.csv"
with open(file_name, "r") as file:
    reader = csv.DictReader(file)
    vac = []
    not_vac = []
    for row in reader:
        if row['Is_vaccinated'] == "Y":
            vac.append(int(row['Age']))
        if row['Is_vaccinated'] == "N":
            not_vac.append(int(row['Age']))


    print(f"Max Age Vaccinated - {max(vac)}")
    print(f"Min Age Vaccinated - {min(vac)}")
    print(f"Max Age NOT Vaccinated - {max(not_vac)}")
    print(f"Mac Age NOT Vaccinated - {min(not_vac)}")






