#!/bin/bash
#Prints List of Files in a Directory With Their Specific Type
echo "Enter a directory name"
read DIR

path=$(find /home/ortoledano/Desktop -type d -name $DIR)

file $path/*
