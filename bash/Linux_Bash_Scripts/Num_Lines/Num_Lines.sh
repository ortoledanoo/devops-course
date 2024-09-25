#!/bin/bash
#Gets Path of Directory from User and Prints Number of Files Inside
echo "Please enter a directory path"
read path

echo "The Path You entered is - $path"
ls $path | wc -l
