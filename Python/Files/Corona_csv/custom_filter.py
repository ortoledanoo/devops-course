import csv
#Reviewed By Jonathan

def filter_csv(file_name, gender, min_age, max_age, is_vaccinated):
    filtered_data = []
    with open(file_name, "r") as file:
        reader = csv.DictReader(file)
        for row in reader:
            if gender == "" or row['gender'] == gender:
                if (min_age is None or age >= min_age) and (max_age is None or age <= max_age):
                        if is_vaccinated == "" or row['Is_vaccinated'] == is_vaccinated:
                            filtered_data.append(row)
    return filtered_data

def create_csv(data, path):
    #Create New File
    with open(path, mode='w', newline='') as file:
        writer = csv.DictWriter(file, fieldnames=data[0].keys())
        writer.writeheader()
        writer.writerows(data)

if __name__ == '__main__':
    file_name = "/home/ortoledano/Desktop/Ubuntu-infinity/corona.csv"
    path = 'filtered_data.csv'
    #User Choices
    gender = input("Enter Male or Female (M/F) - ")
    min_age = input("Enter Min Age - ")
    max_age = input("Enter MAX Age - ")
    is_vaccinated = input("Enter Vaccinated or Not (Y/N) - ")

    min_age = int(min_age) if min_age else None
    max_age = int(max_age) if max_age else None


    create_csv(filter_csv(file_name, gender, min_age, max_age, is_vaccinated), path)








