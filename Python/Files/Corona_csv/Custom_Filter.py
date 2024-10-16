import csv

def filter_csv(file_name, gender, min_age, max_age, is_vaccinated):
    filtered_data = []
    with open(file_name, "r") as file:
        reader = csv.DictReader(file)
        for row in reader:
            if gender == "" or row['gender'] == gender:
                if int(row['Age']) > min_age:
                    if int(row['Age']) < max_age:
                        if is_vaccinated == "" or row['Is_vaccinated'] == is_vaccinated:
                            filtered_data.append(row)
    return filtered_data

def create_csv(data, path):
    #Create New File
    with open(path, mode='w', newline='') as file:
        writer = csv.DictWriter(file, fieldnames=data[0].keys())
        writer.writeheader()
        writer.writerows(data)


file_name = "/home/ortoledano/Desktop/Ubuntu-infinity/corona.csv"
path = 'filtered_data.csv'
#User Choices
gender = input("Enter Male or Female (M/F) - ")
min_age = int(input("Enter Min Age - "))
max_age = int(input("Enter MAX Age - "))
is_vaccinated = input("Enter Vaccinated or Not (Y/N) - ")


create_csv(filter_csv(file_name, gender, min_age, max_age, is_vaccinated), path)








