#!/bin/bash
#add Date pre to each file in current directory
#
date=$(date '+%Y-%m-%d')
for FILENAME in *;
do
	mv $FILENAME "$date - $FILENAME" ;
done
