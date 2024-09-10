#!/bin/bash
#
date=$(date '+%Y-%m-%d')
for FILENAME in *;
do
	mv $FILENAME "$date - $FILENAME" ;
done

#!/bin/bash
#for file in $(ls); do
#mv "$file" "$(date -I)-$file
