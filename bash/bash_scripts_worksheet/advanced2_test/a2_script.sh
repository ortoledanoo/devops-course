#!/bin/bash
#
PS3="This is Toledano Translator"
input=$(xclip -se c -o)
select opt in ENG-HE HE-ENG Quit
do
	case $opt in
	"ENG-HE")
		echo "Translating : $input"
    		open "https://translate.google.com/?sl=en&tl=iw&text=$inputen&op=translate"
		;;
	"HE-ENG") 
		echo "Translating : $input"
		open "https://translate.google.com/?sl=iw&tl=en&text=$inputhe&op=translate"
		;;
	"Quit")
		echo "Bye Bye"
		break;
		;;
	*)
		echo "Oops"
		;;
	esac

done
