#!/bin/bash
#
echo "Enter a Direcory Path - "
read DIR

echo "Enter an max size in  MBytes - "
read X

find $DIR -type f -name "*" -size +$X -print -delete
#find = locate files based on various criteria
#DIR = start at user entered directory
#-type f = only normal files not directories
#-name "*" = all files // can be also *.pdf 
#-size +$X = max size that will be saved
#-print = list me what you did
#
#replace . with path
