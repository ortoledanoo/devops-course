#!/bin/bash

echo "Please Enter Numbers Separated by Spaces"
read user_input
sum=0

for num in $user_input; do
  if [ $num -lt 0 ]; then
    num=$((num * -1))
  fi

  sum=$((sum + num))
done

echo $sum


# IFS (Internal Field Separator) - Allows Bash To Recognice Space, Tab and NewLine


# [] - Simple Tests, Non-Support || and &&, Non-Support regex
# [[]] - Complex Tests, Support || and &&, Support regex

# () - Run Command in Subshell
# (()) - Arithmetic Usage

