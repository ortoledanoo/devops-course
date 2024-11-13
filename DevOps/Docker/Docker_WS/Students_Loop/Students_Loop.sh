#!/bin/bash

students_names=('Daniel' 'Kobi' 'Avi' 'Ruslan' 'Gabriele' 'Linor'
                'Hillel' 'Khaled' 'Joanatan' 'Yaaf' 'Jonathan' 'Stav')

while :
do
        for i in "${students_names[@]}";
        do
                echo "$i"
                sleep 1
        done
done
