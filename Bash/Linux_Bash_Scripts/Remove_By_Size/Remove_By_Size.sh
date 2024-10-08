#!/bin/bash
#Enter File Path and Max MB Allowed and The Script Will Remove The Rest
echo "Enter a Direcory Path - "
read DIR

echo "Enter an max size in  MBytes - "
read X

find $DIR -type f -name "*" -size +$X -print -delete

#find = locate files based on various criteria
#DIR = start at user entered directory
#-type f = only files not directories
#-name "*" = all files // can be also *.pdf etc... 
#-size +$X = max size that will be saved
#-print = list me what you did

#in readme.txt there is heavy files for check
