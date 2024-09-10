#!/bin/bash
#
echo "Enter a directory name"
read DIR

path=$(find /home/ortoledano/Desktop -type d -name $DIR)

echo "$DIR" #check output
echo "$path" #check output

file $path/*
