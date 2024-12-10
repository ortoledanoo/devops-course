import sys
# Reviewed By Gabriel

# Check If User Entered 2 Arguments
if len(sys.argv) != 3:
    print("Enter Input File and Output File!")
    sys.exit(1)

input_file = sys.argv[1]
output_file = sys.argv[2]

# Reverse The Lines And Write To New File
try:
    with open(input_file, 'r') as infile:
        lines = infile.readlines()

    with open(output_file, 'w') as outfile:
        outfile.writelines(lines[::-1])
except FileNotFoundError:
    print(f"Error! File '{input_file}' Not Found")
