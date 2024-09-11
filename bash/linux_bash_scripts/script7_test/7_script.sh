#!/bin/bash
# same as 6 just use clipx for input :)
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


translate() {
    local input="$1"
    local -n mapping="$2"
    local output=""
    for (( i=0; i<${#input}; i++ )); do
        char="${input:i:1}"
        output+="${mapping[$char]:-$char}"
    done
    echo "$output"
}

clip=$(xclip -se c -o)
#-se c == selection clipboard
#-0 = print to srdout

select choice in EN-HE HE-EN Quit
do
case $choice in
    "EN-HE")
    	echo "Your Keyboard is - $clip"
	echo "Converting Your Keyboard..."
        translate "$clip" english_to_hebrew
        ;;

    "HE-EN")
    	echo "Your Keyboard is - $clip"
	echo "Converting Your Keyboard..."
        translate "$clip" hebrew_to_english
        ;;

    "Quit")
	echo "Bye Bye"
	break;;

    *)
        echo "Invalid choice"
        ;;

	esac
done
