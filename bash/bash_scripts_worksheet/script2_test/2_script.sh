#!/bin/bash
#
echo "Please enter a derectory path"
read path

echo "The Path You entered is - $path"
ls $path | wc -l
