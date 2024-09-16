#!/bin/bash
#Script Shuffled from Array and set Pairs and Trio if needed
students=('Avi' 'Daniel' 'Gabriele' 'Johnatan' 'Khaled' 'Linor' 'Roslan' 'Shahaf' 'Stav' 'Yaaf' 'Or')
num_students=${#students[@]}
shuffled_students=($(shuf -e "${students[@]}")) #-e = echo

if [ $((num_students  % 2)) -eq 0 ]; then
	for ((i=0; i<num_students; i+=2)); do
		echo "Pair - ${shuffled_students[i]} and ${shuffled_students[i+1]}"
	done
else
	echo "Three Group - ${shuffled_students[0]} and ${shuffled_students[1]} and ${shuffled_students[2]}"
	for ((i=3; i<num_students; i+=2)); do
		echo "Pair - ${shuffled_students[i]} and ${shuffled_students[i+1]}"
        done
fi
