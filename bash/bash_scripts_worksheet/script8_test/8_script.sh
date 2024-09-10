#!/bin/bash

# diffrent way from 6, now we use 2 help functions
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
    ["l"]="ך"
    [";"]="ף"
    ["z"]="ז"
    ["x"]="ס"
    ["c"]="ב"
    ["v"]="ה"
    ["b"]="נ"
    ["n"]="מ"
    ["m"]="צ"
    [","]="ת"
    ["."]="צ"
    [" "]=" "
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
    [" "]=" "
)


is_english_char() {
    local first_char="$1"
    [[ -n "${english_to_hebrew[$first_char]}" ]]   
}


##[[-n (expression) ]] == check if have value. if have value return 1. else - 0
#${english_to_hebrew[$first_char]} == check if first char is in the array


translate() {
    local input="$1"
    local -n  dictionary="$2" #-n points to array outside of function
    local output="" #set output no empty string
    for (( i=0; i<${#input}; i++ )); do #run on each char in "input"
        char="${input:i:1}" #set 'char' to 1 char in i index
        output+="${dictionary[$char]}"
    done
    echo "$output"
}



echo "Please enter text:"
read input
first_char="${input:0:1}" # set dirst_char to the char at index 0

     if is_english_char "$first_char"; then
   	 converted_text=$(translate "$input" english_to_hebrew)
   	 echo "Converted text: $converted_text"
   	 setxkbmap il,us
     else 
    	 converted_text=$(translate "$input" hebrew_to_english) 
   	 echo "Converted text: $converted_text"
   	 setxkbmap us.il
     fi

#the if condition is - send is_english_char the first char
#if yes - return 1 and activate thr first if
#if not - activate else

