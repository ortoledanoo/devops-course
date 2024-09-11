#!/bin/bash

# Define 2 arrays onw hebrew-english and 2 english - hebrew
# Look at Question 8 - Another Way to Solve This Problem by using 2 Functions
# This Way Also Use 'select' and Not Automatic
declare -A english_to_hebrew=(
    ["q"]="/"
    ["w"]="'"
    ["e"]="ק"
    ["r"]="ר"
    ["t"]="א"
    ["y"]="ט"
    ["u"]="ו"
    ["i"]="ן"
    ["o"]="ם"
    ["p"]="פ"
    ["a"]="ש"
    ["s"]="ד"
    ["d"]="ג"
    ["f"]="כ"
    ["g"]="ע"
    ["h"]="י"
    ["j"]="ח"
    ["k"]="ל"
    ["l"]="ף"
    [";"]="ך"
    ["z"]="ז"
    ["x"]="ס"
    ["c"]="ב"
    ["v"]="ה"
    ["b"]="נ"
    ["n"]="מ"
    ["m"]="צ"
    [","]="ת"
    ["."]="צ"
)


declare -A hebrew_to_english=(
    ["ש"]="a"
    ["ע"]="g"
    ["ר"]="r"
    ["ן"]="i"
    ["ט"]="y"
    ["י"]="h"
    ["ו"]="u"
    ["כ"]="f"
    ["ת"]=","
    ["א"]="t"
    ["ד"]="s"
    ["ג"]="d"
    ["ם"]="o"
    ["ל"]="k"
    ["ק"]="e"
    ["מ"]="n"
    ["נ"]="b"
    ["ס"]="x"
    ["ף"]=";"
    ["ז"]="z"
    ["ב"]="c"
    ["ך"]="l"
    ["ה"]="v"
    ["צ"]="m"
    ["ת"]=","
    ["ץ"]="."
    ["'"]="w"
    ["/"]="q"
)


# Function to convert text using associative arrays
translate() {
    local input="$1" #the text user entered
    local -n mapping="$2" # mapping (en-he or he-en)
    local output="" #set output to empty string
    for (( i=0; i<${#input}; i++ )); do #runs from 0 index for all input
        char="${input:i:1}" #Take 1 Char in i index
        output+="${mapping[$char]}"#Set 'output' to The Matched Char
    done
    echo "$output"
}

select choice in EN-HE HE-EN Quit
do
case $choice in
    "EN-HE")
	echo "Please enter text:"
	read input
        translate "$input" english_to_hebrew
        ;;

    "HE-EN")
	echo "Please enter text:"
        read input
        translate "$input" hebrew_to_english
        ;;

    "Quit")
	echo "Bye Bye"
	break;;

    *)
        echo "Invalid choice"
        ;;

	esac
done
